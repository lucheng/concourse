<?php
class ControllerCheckoutPayment extends Controller {
	public function index() {
		$this->load_language('checkout/checkout');

		$json = array();

		$this->load->model('account/address');

		if ($this->customer->isLogged()) {
			$this->session->data['payment_address_id']=0;
			$payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
		} elseif (isset($this->session->data['guest'])) {
			$payment_address = $this->session->data['guest']['payment'];
		}


		if (!isset($payment_address)) {
			$json['redirect'] = $this->url->link('checkout/checkout', '', 'SSL');
		}
			
		if ((!$this->cart->hasProducts() && (!isset($this->session->data['vouchers']) || !$this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}
			
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (!$json) {
				if (!isset($this->request->post['payment_method'])) {
					$json['error']['warning'] = $this->language->get('error_payment');
				} else {
					if (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
						$json['error']['warning'] = $this->language->get('error_payment');
					}
				}

				if ($this->config->get('config_checkout_id')) {
					$this->load->model('catalog/information');
						
					$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));
				
				}
			}
				
			if (!$json) {
				$this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
				
				//update payment method
				$this->load->model('checkout/order');
				$this->model_checkout_order->updateOrderPayment($this->session->data['order_id'],$this->session->data['payment_method']);
			}
				
		} else {
				// Calculate Totals
				$total_data = array();
				$total = 0;
				$taxes = $this->cart->getTaxes();

				$this->load->model('setting/extension');

				$sort_order = array();

				$results = $this->model_setting_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('total/' . $result['code']);
							
						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
					}
				}
				// Payment Methods
				$method_data = array();
					
				$this->load->model('setting/extension');
					
				$results = $this->model_setting_extension->getExtensions('payment');
					
				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('payment/' . $result['code']);
						// init payment_method if there is no a default payment_method
						if (!isset($this->session->data['payment_method']['code'])&&!$this->customer->getPaymentMethod()) {
							$this->session->data['payment_method']['code']=$result['code'];
						}
						$method = $this->{'model_payment_' . $result['code']}->getMethod($payment_address, $total);
							
						if ($method) {
							$method_data[$result['code']] = $method;
						}
					}
				}
					
				$sort_order = array();

				foreach ($method_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
					
				array_multisort($sort_order, SORT_ASC, $method_data);
					
				$this->session->data['payment_methods'] = $method_data;
				
				
			$this->data['text_payment_method'] = $this->language->get('text_payment_method');
			$this->data['button_continue'] = $this->language->get('button_continue');

			if (isset($this->session->data['payment_methods']) && !$this->session->data['payment_methods']) {
				$this->data['error_warning'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
			} else {
				$this->data['error_warning'] = '';
			}
				
			if (isset($this->session->data['payment_methods'])) {
				$this->data['payment_methods'] = $this->session->data['payment_methods'];
			} else {
				$this->data['payment_methods'] = array();
			}

			if (isset($this->session->data['payment_method']['code'])) {
				$this->data['payment_code'] = $this->session->data['payment_method']['code'];
				$this->customer->setPaymentMethod($this->data['payment_code']);
			} else {
				$this->data['payment_code'] = '';
			}
				
			if ($this->config->get('config_checkout_id')) {
				$this->load->model('catalog/information');

				$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

				if ($information_info) {
					$this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/info', 'information_id=' . $this->config->get('config_checkout_id'), 'SSL'), $information_info['title'], $information_info['title']);
				} else {
					$this->data['text_agree'] = '';
				}
			} else {
				$this->data['text_agree'] = '';
			}
				
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/payment.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/checkout/payment.tpl';
			} else {
				$this->template = 'default/template/checkout/payment.tpl';
			}
		
			$json['output'] = $this->render();
		}

		$this->load->library('json');

		$this->response->setOutput(Json::encode($json));
	}
}
?>
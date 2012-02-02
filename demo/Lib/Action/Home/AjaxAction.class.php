<?php
/**
  * @author nanze
  * @link 
  * @todo 
  * @copyright 811046@qq.com
  * @version 1.0
  * @lastupdate 2011-3-17
*/ 
class AjaxAction extends Action{
	function login(){
		Session::set('back',U('Cart/disp'));
		echo $this->fetch('Ajax:login');

	}
	function join(){
		Session::set('back',U('Cart/disp'));
		echo $this->fetch('Ajax:join');
	}
	function shippingaddress(){

		//获取国家列表
		$dao=D("Region");
		$this->Countries=$dao->where("type=0")->order('name asc')->findall();

		$this->memberID=Session::get('memberID');
		if($this->memberID){
			$dao=D("Members");
			$this->memberInfo=$dao->where("id=".$this->memberID)->find();
		}

		Session::set('back',U('Cart/disp'));
		echo $this->fetch('Ajax:shippingaddress');
	}
	function coupon(){
		$dao=D("Coupon");
		$list=$dao->validate($_POST['coupon']);
		if($list){
			die('-'.getprice_str($list['amount']?$list['amount']:0));
		}else{
			die('<span style="color:red">*The coupon is invalid</span>');
		}
	}
	function getRegion(){
		$dao=D("Region");
		$map['pid']=$_REQUEST["pid"];
		$map['type']=$_REQUEST["type"];
		$list=$dao->where($map)->findall();
		echo json_encode($list);
	}
	function get_shipping_list(){
		$dao=D("Cart");
		$weight=$dao->cart_total_weight(Session::get ( 'sessionID' ));

		$dao=D("Shipping");
		$ShippingList=$dao->get_shipping_list($_POST['country'],$_POST['state'],$_POST['city'],$weight);
		$this->ShippingList=$ShippingList;
		echo $this->fetch('Ajax:get_shipping_list');

	}
	function get_total_amount(){

		$dao = D ("Cart");
		$sessionID = Session::get ( 'sessionID' );

		$this->totalWeight = $weight = $dao->cart_total_weight( $sessionID );//总重量

		$cartTotal = $dao->cart_total ( $sessionID);//产品总价格

		$this->cartTotal = getprice_str($cartTotal);
		$this->itemTotal = $itemTotal = $dao->get_item_totalcount( $sessionID);//总数量
		$this->itemCount = $dao->get_item_count($sessionID );//总类数

		$this->discount = $discount = $dao->discount($cartTotal);//打折信息
		$totalAmonut=round($discount['price'],2);


		$shipping_id=$_POST['shipping_id'];
		$delivery=$_POST['delivery'];
		$shippingModel=D('Shipping');
		$member_id=Session::get('memberID');
		if($shipping_id && $delivery==0 && $member_id){//会员本身地址
			$memberShippingAddress=Session::get('memberShippingAddress');
			$shipping_price=$shippingModel->get_shipping_fee($shipping_id,$memberShippingAddress['country'],$memberShippingAddress['state'],$memberShippingAddress['city'],$weight);

		}else{//其它地址
			$shipping_price=$shippingModel->get_shipping_fee($shipping_id,$_POST['country'],$_POST['state'],$_POST['city'],$weight);
		}
		$shipping_price=$shipping_price['price'];
		//没有运费取保险金
		if(!$shipping_price){
			$insure=$shippingModel->get_insure($shipping_id);
			$shipping_price=$shipping_price?$shipping_price:$insure?$insure:0;
		}
		$this->shippingPrice=getprice_str($shipping_price);//运费

		$payment=$_POST['payment'];
		if($payment){
			$fee=get_orders_Fees($totalAmonut,$itemTotal,$payment);
			$fee['insurance']>0 && $this->assign('insurance',getprice_str($fee['insurance']));
			$fee['paymoney']>0 && $this->assign('paymoney',getprice_str($fee['paymoney']));
			$totalAmonut=$fee['total'];//加上其它金额
		}
		$totalAmonut+=$shipping_price;//总价加上运费

		$cpdao=D("Coupon");
		$coupon=$cpdao->validate($_POST['coupon']);
		if($coupon){
			$totalAmonut-=$coupon['amount'];
			$this->coupon=getprice_str($coupon['amount']);
		}
		//读取订单信息
		$this->list = $dao->display_contents ( $sessionID );//购物车列表
		$this->totalAmount = getprice_str($totalAmonut);//全部总价
		echo $this->fetch('Ajax:get_total_amount');
	}




	/**
	 * 未使用
	 *
	 */
	function getShippingFee(){
		$dao=D("Shipping");
		$list=$dao->where("code='".$_REQUEST["code"]."'")->find();
		$fee=get_orders_Fees($_REQUEST["total"]);
		//echo $dao->getlastsql();
		if ($list){
			$r=get_shipping_fee($list["id"],$_REQUEST["country"],$_REQUEST["state"],$_REQUEST["weight"]);

			$fee["Shipping_money"]=$r;
			$fee ["Shipping_money_str"] = getprice_str ( $r );
			$fee ['procuts_total'] = $_REQUEST["total"] + $r;

			if ($fee ['procuts_total'] <= GetSettValue ( "min_freepaymoney" )) {
				$fee ['procuts_total'] =  $fee ['insurance'] + $fee ['procuts_total'];
				$fee ['paymoney'] = number_format ( ( float ) $fee ['procuts_total'] * ( float ) GetSettValue ( "paymoney" ), 2, '.', '' );
			} else {
				$fee ['paymoney'] = 0;
			}
			//$fee ['procuts_total']=$f;

			$fee ['paymoney_str'] = getprice_str ( $fee ['paymoney'] );
			$fee ['procuts_total_str'] = getprice_str ( $fee ['procuts_total']+$fee["paymoney"] );
			$fee ['procuts_total'] =$fee ['procuts_total']+$fee["paymoney"] ;
			echo json_encode($fee);
		}
		else{
			echo json_encode("error");
		}
	}
	function getShipping_area(){
		$city=$_REQUEST["city"];
		$dao=D("Shipping_area");
		$map["config"]=array('like','%"'.$city.'"%');
		$list=$dao->where($map)->findAll();
		echo json_encode($list);
	}
}
?>
<?php
/* *
 * 类名：AlipayService
 * 功能：支付宝各接口构造类
 * 详细：构造支付宝各接口请求参数
 * 版本：3.2
 * 日期：2011-03-25
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

require_once("taobao.function.php");
require_once("taobao_submit.class.php");

class TaobaoService {
	
	var $taobao_config;
	/**
	 *支付宝网关地址（新）
	 */

	function __construct($taobao_config){
		$this->taobao_config = $taobao_config;
	}
    function TaobaoService($taobao_config) {
    	$this->__construct($taobao_config);
    }
	/**
     * 构造快捷登录接口
     * @param $para_temp 请求参数数组
     * @return 表单提交HTML信息
     */
	function taobao_auth_authorize() {
		
		$button_name = "淘宝登录";
		//生成表单提交HTML文本信息
		$taobaoSubmit = new TaobaoSubmit();
		$html_text = $taobaoSubmit->buildForm($this->taobao_config['login_url'], "get", $button_name,$this->taobao_config);
		return $html_text;
	}
	
	/**
     * 用于防钓鱼，调用接口query_timestamp来获取时间戳的处理函数
     * 注意：若要使用远程HTTP获取数据，必须开通SSL服务，该服务请找到php.ini配置文件设置开启，建议与您的网络管理员联系解决。
     * return 时间戳字符串
	 */
	function query_timestamp() {
		$url = $this->alipay_gateway_new."service=query_timestamp&partner=".trim($this->taobao_config['partner']);
		$encrypt_key = "";
		//获取远程数据
		$xml_data = getHttpResponse($url);
		//解析XML数据
		$para_data = @XML_unserialize($xml_data);
		//获取时间戳
		$encrypt_key = $para_data['alipay']['response']['timestamp']['encrypt_key'];
		
		return $encrypt_key;
	}
	
	/**
     * 构造支付宝其他接口
     * @param $para_temp 请求参数数组
     * @return 表单提交HTML信息/支付宝返回XML处理结果
     */
	function alipay_interface($para_temp) {
		//增加基本配置参数
		$para_temp['service'] = 'alipay_interface';
		$para_temp['partner'] = trim($this->taobao_config['partner']);
		$para_temp['_input_charset'] = trim(strtolower($this->taobao_config['input_charset']));

		//获取远程数据
		$alipaySubmit = new AlipaySubmit();
		$html_text = "";
		//请根据不同的接口特性，选择一种请求方式
		//1.构造表单提交HTML数据:
		//$alipaySubmit->buildForm($para_temp, $this->alipay_gateway, "get", $button_name,$this->taobao_config);
		//2.构造模拟远程HTTP的POST请求，获取支付宝的返回XML处理结果:
		//注意：若要使用远程HTTP获取数据，必须开通SSL服务，该服务请找到php.ini配置文件设置开启，建议与您的网络管理员联系解决。
		//$alipaySubmit->sendPostInfo($para_temp, $this->alipay_gateway, $this->taobao_config);
		
		return $html_text;
	}
}
?>
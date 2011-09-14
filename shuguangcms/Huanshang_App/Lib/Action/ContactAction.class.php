<?
class ContactAction extends GlobalAction {
	
	public function index(){
		
		$Settings=D('Settings')->findall();
		foreach ($Settings AS $key ){
			$this->assign($key['title'],$key['values']);
			//echo $key['title'].'--'.$key['values'].'<br>';
		}
		$this->display();
		
	}
	
}
?>
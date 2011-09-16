<?
class ContactAction extends GlobalAction {
	
	public function index(){
		
		$Pages=D("Pages");
		$list=$Pages->findall();
		
		$this->assign('pages',$list);
		
		$Settings=D('Settings')->findall();
		foreach ($Settings AS $key ){
			$this->assign($key['title'],$key['values']);
			//echo $key['title'].'--'.$key['values'].'<br>';
		}
		$this->display();
		
	}
	
}
?>
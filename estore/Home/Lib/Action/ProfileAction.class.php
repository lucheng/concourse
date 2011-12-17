<?php
import('Com.Taobao.top.TopClient');
import('Com.Taobao.top.request.UserGetRequest');
import('Com.Taobao.top.RequestCheckUtil');

class ProfileAction extends Action
{
    public function index()
    {
//    	$c = new TopClient;
//    	$sessionKey = $_SESSION[C('USER_AUTH_KEY')];
//		$req = new UserGetRequest;
//		$req->setFields("user_id,nick,seller_credit");
//		$resp = $c->execute($req, $sessionKey);
//		dump($resp);
        $this->display();
    }
    
	public function bangding()
    {
    	$c = new TopClient;
    	$sessionKey = $_SESSION[C('USER_AUTH_KEY')];
		$req = new UserGetRequest;
		$req->setFields("user_id,nick,seller_credit");
		$resp = $c->execute($req, $sessionKey);
//		dump($resp);
        $this->display();
    }

}
?>
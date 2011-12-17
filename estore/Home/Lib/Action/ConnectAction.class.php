<?php
import('Com.top.TopClient');
class ConnectAction extends Action
{
	public function oauth()
    {
    	$url = "http://container.api.taobao.com/container?appkey=12402963&encode=utf-8";
        $this->assign("jumpUrl", $url);
        $this->assign("waitSecond", 0);
//        $this->assign("taobaoUrl", $url);
//    $waitSecond};URL={$jumpUrl}
    	$this->display("Public:oauth");
    	
    }

}
?>
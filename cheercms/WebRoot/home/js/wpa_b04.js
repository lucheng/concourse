(function(){
	try{
		
		var kfuin = encodeURIComponent(params['kfuin']),
			ws = encodeURIComponent(params['ws']),
			referrer = encodeURIComponent(params['referrer']),
			cref = encodeURIComponent(params['cref']),
			pt = encodeURIComponent(params['pt']),
            aty = params['aty'] || '',
            a = params['a'] || '',
			title = params['title'] || '',
			cot1 = params['cot1'] || '',
			btn1 = params['btn1'] || '',
			wpa_release_b04 = document.getElementById('wpa_release_b04'),
			wpa_release_b04_title = document.getElementById('wpa_release_b04_title'),
			//wpa_release_b04_btn_close = doc.getElementById('wpa_release_b04_btn_close'),
			wpa_release_b04_c_1  = document.getElementById('wpa_release_b04_c_1'),
			wpa_release_b04_c_2 = document.getElementById('wpa_release_b04_c_2'),
			wpa_release_b04_btn = document.getElementById('wpa_release_b04_btn');
		
		//填充内容
		wpa_release_b04_title.innerHTML = kfuin;
		wpa_release_b04_c_1.innerHTML = title;
		wpa_release_b04_c_2.innerHTML = cot1.replace(/\n/g, '<br />');
		wpa_release_b04_btn.innerHTML = btn1;
	
		//获取头像风格
		addClass(wpa_release_b04, 'wpa_release_b04_0'+params['tx']);
		
		//绑定事件
		//wpa_release_b04_btn_close.onclick = function(){
		//	wpa_release_b04.style.display = 'none';
		//};
		
		wpa_release_b04_btn.onclick = function(){
			window.open('http://crm2.qq.com/page/portalpage/wpa.php?uin='+kfuin+'&cref='+cref+'&ref='+referrer+'&pt='+pt+'&f=1&ty=1&ap=&as=&aty=' + aty + '&a=' + a, '_blank', 'height=544, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');
		};
	}catch(e){}
}());
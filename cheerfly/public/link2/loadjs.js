/**
 * JS ������ܼ�����
 * @name my {object}
 * @author biaowu@sohu-inc.com
 * @createtime 2010-3-15 11:35
 */


var myJs =
{
	version:'1.0.1',
	jsVersion:'',
	loadTypeVlaue:'',

	jsPackages:new Array(),
	cssPackages:new Array(),
	loadedJsPackages:new Array(),
	loadedCssPackages:new Array(),

	NotFoundJsPackage:new Array(),
	errInfo:new Array(),


	loadJs:function(packObj)
	{
		if(typeof(packObj) != "object" || typeof(packObj.jsPackages) != "object" || packObj.jsPackages.length < 1)
		{
			this.errInfo.push("û�м����κΰ�");
			return false;
		}

		this.loadTypeVlaue = packObj.loadType || '';
		this.jsVersion = packObj.jsVersion || '';

		this.jsPackages = packObj.jsPackages || '';
		this.cssPackages = packObj.cssPackages || '';


		for(var i=0;i<this.jsPackages.length;i++)
		{
			var _packageName = this.jsPackages[i];
			//��ȡ����Ϣ
			var _packdata = this.getPackageInfo(_packageName);

			if(_packdata)
			{
				//��js������
				if(this.loadTypeVlaue == 'js')
				{
					this.loadJsPackage(_packdata);
				}
				//��css������
				else if(this.loadTypeVlaue == 'css')
				{
					this.loadCssPackage(_packdata);
				}
				//Ĭ�϶�����
				else
				{
					this.loadJsPackage(_packdata);
					this.loadCssPackage(_packdata);
				}
			}
			else
			{
				this.NotFoundJsPackage.push(_packageName);
			}
		}
	},

	//��ȡ����Ϣ
	getPackageInfo:function(_packageName)
	{
		//��js��������Ϣ
		var jsObj = eval('JsInc.'+_packageName);

		if(typeof(jsObj) == "object")
		{
			var _jsPackageContact = jsObj.contact;

			//JSĿ¼��ַ�������ļ��ж���
			jsObj.url = js_url_path;

			//��ȡcss��ַ
			var _cssValue = eval("this.cssPackages."+_packageName) || "implied";

			//��ȡcss�汾
			var _cssVersion = eval("jsObj.css."+_cssValue);

			if(this.checkURL(_cssValue))
			{
				var _cssUrl = _cssValue;
			}
			else
			{
				//�����ڴ��ļ�
				if(_cssVersion == undefined)
				{
					var _cssUrl = '';
				}
				else
				{
					//���ڰ汾��
					if(_cssVersion)
					{
						var _cssUrl = jsObj.url+_packageName+'/css/'+_cssValue+'_'+_cssVersion+'.css';
					}
					else
					{
						var _cssUrl = jsObj.url+_packageName+'/css/'+_cssValue+'.css';
					}
				}
			}

			if(jsObj.version != '')
			{
				var _jsUrl = jsObj.url+_packageName+'/'+_packageName+'_'+jsObj.version+'.js';
			}
			else
			{
				var _jsUrl = jsObj.url+_packageName+'/'+_packageName+'.js';
			}

			//��Ͻ��
			var returndata = {packName:_packageName,jsPackageURL:_jsUrl,cssPackageURL:_cssUrl,jsPackageContact:_jsPackageContact}
			return returndata;
		}
		return false;
	},


	//js������
	loadJsPackage:function(_packdata)
	{
		var _packageName = _packdata.packName;

		//�ж��Ƿ��Ѿ�����
		if(this.judgeLoadJs(_packageName))
		{
			if(_packdata.jsPackageContact != "")
			{
				var contactPackages = _packdata.jsPackageContact.split('||');
				for(var i=0;i<contactPackages.length;i++)
				{
					var callPackdata = this.getPackageInfo(contactPackages[i]);
					this.loadJsPackage(callPackdata);
				}
			}
			if(_packdata.jsPackageURL != '')
			{
				document.write("<scr"+"ipt type=\'text/javascript\' src=\'"+_packdata.jsPackageURL+"\'></scr"+"ipt>");
				this.loadedJsPackages.push(_packageName);
			}
			else
			{
				this.NotFoundJsPackage.push(_packageName);
			}
		}
	},

	//css������
	loadCssPackage:function(_packdata)
	{
		var _packageName = _packdata.packName;
		if(this.judgeLoadCss(_packageName))
		{
			if(_packdata.jsPackageContact != "")
			{
				//���������ж�
				var contantPackages = _packdata.jsPackageContact.split('||');
				for(var i=0;i<contantPackages.length;i++)
				{
					var callPackdata = this.getPackageInfo(contantPackages[i]);
					this.loadCssPackage(callPackdata);
				}
			}
			if(_packdata.cssPackageURL)
			{
				document.write("<link href=\""+_packdata.cssPackageURL+"\" rel=\"stylesheet\" type=\"text\/css\" />");
				this.loadedCssPackages.push(_packageName);
			}
		}
	},


	//��֤js�Ƿ��Ѽ���
	judgeLoadJs:function(_packageName)
	{
		for(var i=0;i < this.loadedJsPackages.length;i++)
		{
			if(this.loadedJsPackages[i]==_packageName)
			{
				return false;
			}
		}
		return true;
	},

	//��֤css�Ƿ��Ѽ���
	judgeLoadCss:function(_packageName)
	{

		for(var i=0;i < this.loadedCssPackages.length;i++)
		{
			if(this.loadedCssPackages[i]==_packageName)
			{
				return false;
			}
		}
		return true;
	},

	//urlУ��
	checkURL:function(mystr)
	{
		var reg = /^(https?|ftp):\/\/(.*)?/;
		return reg.test(mystr);
	},

	//��ȡdebug
	debugJs:function(){
		var _info = 'version��'+this.jsVersion+'\n';
		_info += 'loadJs��'+this.loadedJsPackages+'\n';
		_info += 'noFoundJsPack��'+this.NotFoundJsPackage+'\n';
		_info += 'loadCss��'+this.loadedCssPackages+'\n';
		_info += 'errInfo��'+this.errInfo+'\n';
		window.alert(_info);
	}

};
/**
 * JS 基础框架加载器
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
			this.errInfo.push("没有加载任何包");
			return false;
		}

		this.loadTypeVlaue = packObj.loadType || '';
		this.jsVersion = packObj.jsVersion || '';

		this.jsPackages = packObj.jsPackages || '';
		this.cssPackages = packObj.cssPackages || '';


		for(var i=0;i<this.jsPackages.length;i++)
		{
			var _packageName = this.jsPackages[i];
			//获取包信息
			var _packdata = this.getPackageInfo(_packageName);

			if(_packdata)
			{
				//单js包加载
				if(this.loadTypeVlaue == 'js')
				{
					this.loadJsPackage(_packdata);
				}
				//单css包加载
				else if(this.loadTypeVlaue == 'css')
				{
					this.loadCssPackage(_packdata);
				}
				//默认都加载
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

	//获取包信息
	getPackageInfo:function(_packageName)
	{
		//获js包配置信息
		var jsObj = eval('JsInc.'+_packageName);

		if(typeof(jsObj) == "object")
		{
			var _jsPackageContact = jsObj.contact;

			//JS目录地址，配置文件中定义
			jsObj.url = js_url_path;

			//获取css地址
			var _cssValue = eval("this.cssPackages."+_packageName) || "implied";

			//获取css版本
			var _cssVersion = eval("jsObj.css."+_cssValue);

			if(this.checkURL(_cssValue))
			{
				var _cssUrl = _cssValue;
			}
			else
			{
				//不存在此文件
				if(_cssVersion == undefined)
				{
					var _cssUrl = '';
				}
				else
				{
					//存在版本号
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

			//组合结果
			var returndata = {packName:_packageName,jsPackageURL:_jsUrl,cssPackageURL:_cssUrl,jsPackageContact:_jsPackageContact}
			return returndata;
		}
		return false;
	},


	//js包加载
	loadJsPackage:function(_packdata)
	{
		var _packageName = _packdata.packName;

		//判断是否已经加载
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

	//css包加载
	loadCssPackage:function(_packdata)
	{
		var _packageName = _packdata.packName;
		if(this.judgeLoadCss(_packageName))
		{
			if(_packdata.jsPackageContact != "")
			{
				//包关联性判断
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


	//验证js是否已加载
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

	//验证css是否已加载
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

	//url校验
	checkURL:function(mystr)
	{
		var reg = /^(https?|ftp):\/\/(.*)?/;
		return reg.test(mystr);
	},

	//获取debug
	debugJs:function(){
		var _info = 'version：'+this.jsVersion+'\n';
		_info += 'loadJs：'+this.loadedJsPackages+'\n';
		_info += 'noFoundJsPack：'+this.NotFoundJsPackage+'\n';
		_info += 'loadCss：'+this.loadedCssPackages+'\n';
		_info += 'errInfo：'+this.errInfo+'\n';
		window.alert(_info);
	}

};
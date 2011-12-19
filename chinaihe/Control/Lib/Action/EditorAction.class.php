<?php
class EditorAction extends Action{
    public function index()
    {//目录
    	
    	$this->display();
       
    }
    
    function demo1(){//简单调用
    	import("ORG.Net.Keditor");
    	$ke=new Keditor();
    	$ke->id="content";//指定textarea的id
    	$keshow=$ke->show();//生成js代码
    	$this->assign("keshow",$keshow);
    	$this->display();
    	
    }
    
    function demo2(){//精简模式
    	import("ORG.Net.Keditor");
    	$ke=new Keditor();
    	$ke->id="content";//指定textarea的id
    	$ke->items="little";//定义工具栏项目，little表示精简。
    	$keshow=$ke->show();//生成js代码
    	$this->assign("keshow",$keshow);
    	$this->display();
    	
    }
    function demo3(){//ctrl+enter提交
    	import("ORG.Net.Keditor");
    	$ke=new Keditor();
    	$ke->id="content";//指定textarea的id
    	$ke->form="formname";//指定form的id，默认为from1
    	$ke->afterCreate="ctrlenter";//定义创建后执行函数，ctrlenter表示ctrl+enter提交表单。
    	$keshow=$ke->show();//生成js代码
    	$this->assign("keshow",$keshow);
    	//获得提交的数据
    	if(!empty($_POST['content'])){
    	$data=$_POST['content'];
    	$this->assign("data",$data);
    	}
    	$this->display();
    }
    function demo4(){//配置kindeditor属性
    	import("ORG.Net.Keditor");
    	$ke=new Keditor();
    	/*
    	 * +----------------------
    	 * 下面的代码是kindeditor自带的部分属性。
    	 * 自带的属性都可以用" $ke->属性名=属性值 " 来指定。 
    	 * kindeditor的所有自带属性可以在http://www.kindsoft.net/doc.php?cmd=config查看
    	 * +---------------------
    	 */
    	$ke->id="content";//指定textarea的id
    	$ke->width="700px";
    	$ke->height="300px";
    	$ke->items="['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
'superscript', '|', 'selectall', '-',
'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
'flash', 'media', 'table', 'hr', 'emoticons', 'link', 'unlink', '|', 'about']
    	";//定义工具栏，如果值为little能快速定义一个精简模式的编辑
    	$ke->resizeMode=1;//2或1或0，2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。注意属性值是数字时不要使用引号
    	$ke->afterCreate="function(id){
    alert('回调函数afterCreate，创建成功，id为:' + id); 
    }";//定义afterCreate回调函数，如果此值为ctrlenter则能快速配置一个ctrl+enter提交表单的函数，ctrlenter要注意指定form属性值
    	$ke->imageUploadJson="/index.php/Keditor/upload";//上传图片的php处理文件默认为/index.php/Keditor/upload
    	$ke->fileManagerJson="/index.php/Keditor/filemanager";//浏览服务器图片php的php文件，默认为/index.php/Keditor/filemanager
    	$ke->allowFileManager=true;//允许浏览服务器图片，注意，为true或false的属性值，不要使用引号
    	$ke->imgid="img";//保存编辑器上传图片的隐藏域id，默认为img。
    	/*
    	 * +--------------------------------------------
    	 * 新增属性，kindeditor自身没有的属性
    	 * +--------------------------------------------
    	 */
        $ke->jspath="/Public/editor/kindeditor.js";//Kindeditor的js文件地址。默认为/Public/editor/kindeditor.js，如果你们编辑器文件没有放在/Public/editor/目录下，需要设置此属性。
        $ke->form="form1";//编辑器所在form的id，默认为form1，此属性是为了指定ctrl+enter提交时候的表单。
    	$keshow=$ke->show();//生成js代码
    	$this->assign("keshow",$keshow);
    	$this->display();
    	
    }
    
    function demo5(){//通过show直接传参配置kindeditor属性
    	import("ORG.Net.Keditor");
    	$ke=new Keditor();
    	$ke->jspath="/Public/editor/kindeditor.js";
    	$ke->form="form1";
    	
    	$ke->width="7000px";//如果show有参数，通过$ke-> 方式定义的自带属性将会失效。
    	$keshow=$ke->show("{
    id:'content',
    imgid:'img',
    width:'700px',
    height:'300px'
    }");//show传参方式定义自带属性。 不可使用快捷关键词little，ctrlenter等。不可定义新增属性jspath，form等，jspath，form必须用$ke->方式定义。
    	$this->assign("keshow",$keshow);
    	$this->display();
    	
    }
    
    function demo6(){//同一页有多个编辑器
    	import("ORG.Net.Keditor");
    	$ke=new Keditor();
    	$ke->id="content";//指定textarea的id
    	$keshow=$ke->show();//生成js代码
    	$this->assign("keshow",$keshow);
    	$ke->id="content2";//指定textarea的id
    	$keshow2=$ke->show();//生成js代码
    	$this->assign("keshow2",$keshow2);
    	$this->display();
    	
    }
    
    function demo7(){//删除编辑器图片。
    		import("ORG.Net.Keditor");
    	$ke=new Keditor();
    	$ke->id="content";//指定textarea的id
    	$ke->imgid="imgtest";//默认为img，如果你的隐藏域id不是img需要定义此属性，
    	$keshow=$ke->show();//生成js代码
    	$this->assign("keshow",$keshow);
    	if(!empty($_POST)){
    		Keditor::delimg($_POST['imgtest']);//本实例没有数据库，你可以结合数据库，在这里删除的时候 $_POST['imgtest']为数据库中存放编辑器图片的字段即可。
    		$this->assign("data","删除了图片：".$_POST['imgtest']);
    	}
    	$this->display();
    }
    
    function demo8(){//自定义上传和浏览的过程。
    	import("ORG.Net.Keditor");
    	$ke=new Keditor();
    	$ke->id="content";//指定textarea的id
    	$ke->allowFileManager=true;
    	$ke->fileManagerJson=__URL__."/filemanager";//浏览过程
         $ke->imageUploadJson=__URL__."/upload";//上传过程
    	$keshow=$ke->show();//生成js代码
    	$this->assign("keshow",$keshow);
    	$this->display();
    }
    
    public function filemanager(){
    	//可在此加自己的权限判断代码
       import("ORG.Net.Keditor");
       Keditor::filemanager("./Public/Upload/","/Public/Upload/",array('gif', 'jpg', 'jpeg', 'png', 'bmp'));
       //参数： 浏览目录（默认./Public/Upload/）， 图片地址（默认/Public/Upload/） ，显示的图片格式（默认array('gif', 'jpg', 'jpeg', 'png', 'bmp')）
    }
    public function upload(){
    	//可在此加自己的权限判断代码
       import("ORG.Net.Keditor");
       $ke=new Keditor();
       $ke->upload('./Public/Upload/','/Public/Upload/',array('gif', 'jpg', 'jpeg', 'png', 'bmp'),1000000);
       //参数：上传目录（默认./Public/Upload/）, 图片地址'/Public/Upload/',允许上传的图片格式，默认array('gif', 'jpg', 'jpeg', 'png', 'bmp')  允许图片大小单位kb。
    }
	
}
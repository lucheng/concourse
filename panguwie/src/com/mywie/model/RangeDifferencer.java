package com.mywie.model;

public class RangeDifferencer {
	/**
	 * 
	 * 〈查询匹配模板的字符数〉 
	 * 〈传入一个模板字符串,一个需要比较的字符串,获取匹配模板的字符字数返回.〉
	 * 
	 * @param model
	 * @param input
	 * @return int 如果有违例，请使用@exception/throws [违例类型]
	 *         [违例说明：异常的注释必须说明该异常的含义及什么条件下抛出该
	 * @see [类、类#方法、类#成员]
	 */
	public int Comparator(String model, String input) {

		char[] modelByte = model.toCharArray();
		char[] inputByte = input.toCharArray();
		// 当前模板索引值
		int j = 0;
		int right = 0;
//		StringBuffer sb = new StringBuffer();
//		StringBuffer sb2 = new StringBuffer();
//		StringBuffer sb3 = new StringBuffer();
		for (int i = 0; i < modelByte.length; i++) {

			int indexNum = ComparatorStr(modelByte[i], inputByte, j);
			// System.out.println("现在比较:"+(char)modelByte[i]+"结果:"+indexNum);
			// 传入的值在模板中索引得到
			if (indexNum >= 0) {
				// 搜索出的索引值
				j = indexNum + 1;
				// 正确值+1
				right++;
//				sb.append((char) modelByte[i]);
//				sb2.append(indexNum + ",");
//				sb3.append(j + ",");
				// 传入的值在模板中没有索引得到
			}
		}
//
//		System.out.println("正确字数:" + right);
//		System.out.println("匹配内容:" + sb);
//		System.out.println("模型内容:" + model);
//		System.out.println("对比内容:" + input);
//		System.out.println("模型内容下标:" + sb2);
//		System.out.println("对比内容下标:" + sb3);
		return right;
	}
	
	
	/**
	 * 
	 * 〈查询匹配模板的字符数〉 
	 * 〈传入一个模板字符串,一个需要比较的字符串,获取匹配模板的字符字数返回.〉
	 * 
	 * @param model
	 * @param input
	 * @return int 如果有违例，请使用@exception/throws [违例类型]
	 *         [违例说明：异常的注释必须说明该异常的含义及什么条件下抛出该
	 * @see [类、类#方法、类#成员]
	 */
	public int Comparator2(String model, String input) {

		char[] modelByte = model.toCharArray();
		char[] inputByte = input.toCharArray();
		int right = 0;
		int modelIi = 0;
		int inputJj = 0;
		for (int i = 0,j=0; i < modelByte.length && j < inputByte.length; i++,j++) {

			if (modelByte[i] == inputByte[j]) {
				right++;
			}else{
				for(int ti =i; ti<modelByte.length; ti++){
					if(modelByte[ti] == inputByte[j]){
						modelIi = ti;
						break;
					}else if(modelByte.length == ti+1){
						i--;
					}
					
				}
				for(int tj =j; tj<inputByte.length; tj++){
					if(inputByte[tj] == modelByte[i]){
						inputJj = tj;
						break;
					}else if(inputByte.length == tj+1){
						inputJj = inputByte.length;
					}
				}
				if(modelIi >= inputJj){
				
						right++;
						j = inputJj;
						
				}else if((modelIi-i) >= (inputJj-j)) {
					right++;
					j = inputJj;
					
				}
			}
			
			
		}
		return right;
	}

	/**
	 * 
	 * 〈查询匹配模板的字符数〉
	 * 〈传入一个模板字符串,一个需要比较的字符串,获取匹配模板的字符字数返回.〉
	 * 
	 * @param model
	 * @param input
	 * @return int 如果有违例，请使用@exception/throws [违例类型]
	 *         [违例说明：异常的注释必须说明该异常的含义及什么条件下抛出该
	 * @see [类、类#方法、类#成员]
	 */
	public int Comparator3(String model, String input) {

		char[] modelByte = model.toCharArray();
		char[] inputByte = input.toCharArray();
			int indexNumRe = 0;
		// 当前模板索引值
		int j = 0;
		int right = 0;
//		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < modelByte.length; i++) {

			int indexNum = ComparatorStr(modelByte[i], inputByte, j);
			
			//如果不是最后一个字
				if(i<modelByte.length-1 && indexNum < 0){
				int indexNum2 = ComparatorStr(modelByte[i+1], inputByte, j);
				if (indexNum < indexNum2) {
					// 搜索出的索引值
					j = indexNum + 1;
						indexNumRe = indexNum;
					// 正确值+1
					right++;
//					sb.append((char) modelByte[i]);
					}else if(indexNum == -1 && indexNum2 == -1){
						indexNum = indexNumRe;
						j = indexNum + 1;
					}
				}else{
					if (indexNum >= 0) {
						j = indexNum + 1;
						indexNumRe = indexNum;
					// 正确值+1
					right++;
//					sb.append((char) modelByte[i]);
				}
			}
		}
		return right;
	}
	
	// 传一个byte型数据在模型中查找是否存在,并返回索引值
	public int ComparatorStr(char model, char[] input, int mindex) {
		// String model="013356";

		for (int i = mindex; i < input.length; i++) {
			if (model == input[i]) {
				return i;
			}
		}
		return -1;
	}



	/**
	 * 
	 * 〈计算字数〉
	 * 〈传入一个字符串,包括标点符号,返回一个剔除了标点符号的字数.字符串类型〉
	 * @param source
	 * @return String
	 * 如果有违例，请使用@exception/throws [违例类型]   [违例说明：异常的注释必须说明该异常的含义及什么条件下抛出该 
	 * @see          [类、类#方法、类#成员]
	 */
	public int coutWord(String source){
		
		//各种标点符号
		String reg2="[\\~\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\_\\+\\`\\-\\=\\～\\！\\＠\\＃\\＄\\" +
		"％\\＾\\＆\\＊\\\\（\\）\\＿\\＋\\＝\\－\\｀\\[\\]\\\\'\\;\\/\\.\\,\\<\\>\\?\\:" +
		"\"\\{\\}\\|\\，\\．\\／\\；\\＇\\［\\］\\＼\\＜\\＞\\？\\：\\＂\\｛\\｝\\｜\\“\\”\\" +
		"‘\\’\\。\\r+\\n+\\t+\\s\\]";
		
		//剔除标点符号
		source = source.replaceAll(reg2, "");

		return source.getBytes().length;
	}
	
	
	/**
	 * 
	 * 〈剔除符号〉
	 * 〈传入一个字符串,包括标点符号,返回一个剔除了标点符号的字符串〉
	 * @param source
	 * @return String
	 * 如果有违例，请使用@exception/throws [违例类型]   [违例说明：异常的注释必须说明该异常的含义及什么条件下抛出该 
	 * @see          [类、类#方法、类#成员]
	 */
	public String RemovedSymbols(String source){
		
		//各种标点符号
		String reg2="[\\~\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\_\\+\\`\\-\\=\\～\\！\\＠\\＃\\＄\\" +
		"％\\＾\\＆\\＊\\\\（\\）\\＿\\＋\\＝\\－\\｀\\[\\]\\\\'\\;\\/\\.\\,\\<\\>\\?\\:" +
		"\"\\{\\}\\|\\，\\．\\／\\；\\＇\\［\\］\\＼\\＜\\＞\\？\\：\\＂\\｛\\｝\\｜\\“\\”\\" +
		"‘\\’\\。\\r+\\n+\\t+\\s\\]";
		
		//剔除标点符号
		source = source.replaceAll(reg2, "");

		return source;
	}

/**
 * 
 * 〈查询所有符合的字符〉
 * 〈查询所有符合的字符〉
 * @param input
 * @param model
 * @return String
 * 如果有违例，请使用@exception/throws [违例类型]   [违例说明：异常的注释必须说明该异常的含义及什么条件下抛出该 
 * @see          [类、类#方法、类#成员]
 */
	public String getTempModel(String input,String model){
		StringBuffer returnStr = new StringBuffer();
		
		//判断模型字符串是否为空
		if(model!=null){
			
			//模板中的当前字符串
			char[] modelChs = model.toCharArray();
			
			String cm = null;
			boolean sign = false;
			for (int i = 1; i < modelChs.length; i++) {
				//获取模板两个字
				cm = String.valueOf(modelChs[i-1])+String.valueOf(modelChs[i]);
				
				//如果在input字符串中找到该词组
				if(input.indexOf(cm)!=-1){
					
					if(!sign){
						returnStr.append(String.valueOf(modelChs[i-1]));
					}
					else{
						returnStr.append(String.valueOf(modelChs[i-1]));
					}
					sign = true;
					//是否已到模板末尾字符
					if(i==modelChs.length-1){
						returnStr.append(String.valueOf(modelChs[i]));
					}
				}else{
					if(sign){
						
						returnStr.append(String.valueOf(modelChs[i-1]));
						sign=false;
					}
				}
			}
		}
		
		return returnStr.toString();
	}
	
		
	public static void main(String[] args) {
		
		RangeDifferencer r = new RangeDifferencer();
		
		String input= "浙江公司信息化论坛合作伙伴联盟人民大会堂举行省通信管理局和省公司会上秘书长代表省政府祝贺对论坛和联盟响应总体战略推广移动信息技术和小康社会的全面建设肯定希望论坛联盟推动我省再上台阶总经理同时指出浙江公司领导下移动通信专家专家信息化建设提升信息";

		String model= "浙江公司信息化、论坛暨信息化合作伙伴联盟2010年年会在浙江省人民大会堂隆重举行。省政府办公厅孟刚副秘书长、省通信管理局敖大明局长、省经信委林华副巡视员和省公司钟天华总经理等领导出席年会。会上，孟刚副秘书长代表省政府致辞，他首先对信息化论坛和联盟年会的召开表示祝贺，对论坛和联盟响应省政府“创业富民、创新强省”的总体战略，以科技交流平台推广移动信息技术，促进我省经济转型升级和小康社会的全面建设所作出成绩表示肯定，并希望论坛、联盟能够在我省十二五规划下再接再厉，推动我省信息化发展再上台阶发挥更大作用。钟天华总经理对各位领导的到来表示感谢，同时指出中国移动浙江公司将在省委省政府的领导下，加速从移动通信专家向移动信息专家转型，以“数字浙江”建设为己任，大力推进信息化建设，提升信息服务业水平。";
		
		input= "绍兴客户类型无线座机发展采用手机座机捆绑模式无线家园现有实现家庭套餐座机无线座机客户发展累计系列融合针对目前集团竞争形势优势作用层面活动稳定集团形势针对捆绑以旧换新捆绑活动二次促销捆绑针对无线座机话务可乎推出通话活动获赠话费通话赚取话务量无线座机客户的无线座机客户";

		model= "绍兴分公司细分客户类型持续推进无线座机发展，一、采用“手机+座机”的融合捆绑模式，发展座机客户。推出E系统“无线家园”套餐，利用现有手机客户的规模优势，实现家庭套餐内的手机、座机无限畅打，带动家庭座机客户发展。目前已累计发展E系列融合套餐用户近2200余户。二、针对目前集团竞争形势，发挥无线座机移固替代优势作用，在集团层面开展无线座机团购活动，稳定集团竞争形势。三、针对捆绑到期的座机客户，推出预存送话费、座机以旧换新等系列后续捆绑活动，积极进行二次促销捆绑，以提高客户满意度和在网粘性。四、针对无线座机沉默或低话务客户，推出“通话赚话费”活动，客户年底前每月通话达到一定时间即可获赠5元话费，鼓励低活性用户通话赚取话费。通过激发话务量，提升无线座机客户的在网活性。";
		
		input = "1231";
		model = "1233";
		
//		input= "家分公司政府集团竞争公司领导高度重视分公司应对变化对总结分析竞争战略方向及时出台应对政策意见加大优惠力度当面全地区组织开展开展对于家政府集团结合竞争形式形式四整理应对走访脚本宣传集团会议布置客户经历操作组织人员人员加强集团签约签约统一大力开展同意支付目前签约累计累计下一家政府";
//
//		model= "嘉兴分公司积极行动应对政府类集团竞争，一、公司领导高度重视，组织各部门与分公司召开竞争应对讨论会与每日电视电话晨会，对前日形势进行总结与分析，把控竞争应对的总体战略方向。二、市场、政企部门及时梳理并出台应对政策与指导意见，通过开展个人捆绑签约并加大全业务优惠力度，从攻防两个方面指导全地区灵活开展应对。三、组织开展专题集团预警，对于全市1669家政府类集团，结合集团竞争形势与稳定度进行红黄灯日通报。四、整理下发竞争应对走访脚本与应对宣传口径，通过集团条线会议进行布置，规范一线客户经理操作，并组织人员到一线开展走访与支援。五、加强集团整体性签约，除推广集团话费统一支付活动外，还大力开展了集团保底签约活动，进一步稳定集团话费收入。截至目前，全市整体签约集团累计已达2000余家，政府类集团整体层面保持稳定。";
//		
		
//		input= "浙江公司信息化连，梦年任您大会堂腹胀局长和省公司总经理会上副秘书至此首先召开对联盟创生总体以推广vjishu促进和小康建设所作出并联盟再接再厉台阶更大作用对各类同事指出省政府加速向移动专家建设为己任大力提升水品";
//		model= "浙江公司信息化论坛暨信息化合作伙伴联盟2010年年会在浙江省人民大会堂隆重举行。省政府办公厅孟刚副秘书长、省通信管理局敖大明局长、省经信委林华副巡视员和省公司钟天华总经理等领导出席年会。会上，孟刚副秘书长代表省政府致辞，他首先对信息化论坛和联盟年会的召开表示祝贺，对论坛和联盟响应省政府“创业富民、创新强省”的总体战略，以科技交流平台推广移动信息技术，促进我省经济转型升级和小康社会的全面建设所作出成绩表示肯定，并希望论坛、联盟能够在我省十二五规划下再接再厉，推动我省信息化发展再上台阶发挥更大作用。钟天华总经理对各位领导的到来表示感谢，同时指出中国移动浙江公司将在省委省政府的领导下，加速从移动通信专家向移动信息专家转型，以“数字浙江”建设为己任，大力推进信息化建设，提升信息服务业水平。";
//		StringBuffer s1 = new StringBuffer();
//		s1.append("EJP(Extensible Java Profiler ) 开源的Java剖析工具,它使用一个可升级的,可扩展的体系结构.一个Java剖析工具是用来优化Java程序性能的开发工具,它帮助你找出并移除运行开销大的部分.EJP基于JVMPI(Java Virtual Machine Profiler Interface )可用来监控Java应用程序一小部分的执行情况并把它用一些突出的元素在分层的树上表示出来.");
//		StringBuffer s2 = new StringBuffer();
//		s2.append("EJP(Extensible Java Profiler ) 开源dgJava剖析工具,它使地方都是的,可扩展的体系结构.一个Java剖析工具是用来优化Java程序性能的开发工具,它帮助你找出并移除运行开销大的部分.EJP基于JVMPI(Java Virtual Machine Profiler Interface )可用来监控Java应用程序一小部分的执行情况并把它用一些突出的元素在分层的树上表示出来.");
//		input = r.RemovedSymbols(input);
//		model = r.RemovedSymbols(model);
		//System.out.println("输入字数:"+input.length());
		//System.out.println("模板字数:"+model.length());
//		String newModel = r.getTempModel(input, model);
//		String newInput = r.getTempModel(model, input);
//		System.out.println("新模板:"+newModel);
//		System.out.println("新内容:"+newInput);
		//System.out.println("新内容字数:"+newInput.length());
		//System.out.println("新模板字数:"+newModel.length());
		
		//System.out.println("旧最终匹配:"+r.Comparator(newModel, newInput));
		String newModel = model;
		String newInput = input;
		
		System.out.println("最终匹配:"+r.Comparator(newInput, newModel));
		System.out.println("最终匹配:"+r.Comparator2(newInput, newModel));
		System.out.println("最终匹配:"+r.Comparator3(newInput, newModel));
		System.out.println("新模板:"+newModel);
		System.out.println("新内容:"+newInput);
		//System.out.println("模板内容:"+model);
		//System.out.println("模板内容:"+model);
	
		String[] str1 = {"","","",""};
		String[] str2 = {"","","",""};

	}
}
package ICTCLAS.I3S.AC;

import com.buptsse.ate.utils.FileHelp;

class TestMain { // 主函数
	
	public static void main(String[] args) {
		
		ICTCLAS50 ICTCLAS = new ICTCLAS50();
		String text = FileHelp.readText("text_example/100049.txt");
//		text = "我们之前曾报道，苹果在其官方网站上推出了iPad和iPhone商务专区，准备发力企业级市场。而来自企业移动解决方案提供商Good Technology最新发布的统计报告显示，苹果已经取得了初步成效。在企业级用户第一季度激活的手机和平板电脑中，iPad第一季度占据企业平板电脑市场97.3%份额，而iPhone和iPad合计占据了80%的份额。";
		String segment =  ICTCLAS.testICTCLAS_ParagraphProcess(text);
		String[] list = segment.split(" ");
		for(String str : list){
			if(!str.equals("") && str.length() > 2){
				System.out.println(str = str.substring(0, str.lastIndexOf("/")));
			}
		}
	}
}
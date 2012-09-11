package ICTCLAS.kevin.zhang;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.bupt.nlp.resources.BCConvert;
import edu.bupt.utils.FileUtils;

public class CWSTagger {

	private ICTCLAS2011 tagger = new ICTCLAS2011();
	private final String CHARSET = "UTF-8";
	private String dicPath = "./dict/userdic.txt";
	
	public CWSTagger(String dicPath){
		
		String argu = ".";
		try {
			if (tagger.ICTCLAS_Init(argu.getBytes(CHARSET),1) == false) {
				System.out.println("Init Fail!");
				return;
			}
			importFileDict(dicPath);
		} catch (UnsupportedEncodingException e) {
			System.out.println("Init Fail!");
			e.printStackTrace();
		}
	}
	
	
	public CWSTagger(){
		
		String argu = ".";
		try {
			if (tagger.ICTCLAS_Init(argu.getBytes(CHARSET),1) == false) {
				System.out.println("Init Fail!");
				return;
			}
			importFileDict(dicPath);
		} catch (UnsupportedEncodingException e) {
			System.out.println("Init Fail!");
			e.printStackTrace();
		}
	}
	
	public String tag(String sInput, int bPOSTagged) {	
		
		try{	
			/*
			 * 设置词性标注集
			        ID		    代表词性集 
					1			计算所一级标注集
					0			计算所二级标注集
					2			北大二级标注集
					3			北大一级标注集
			*/
			tagger.ICTCLAS_SetPOSmap(2);
	
			byte nativeBytes[] = tagger.ICTCLAS_ParagraphProcess(sInput.getBytes(CHARSET), bPOSTagged);
			String nativeStr = new String(nativeBytes, 0, nativeBytes.length, CHARSET);
			return nativeStr;
			
		
		} catch (Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 导入用户词典
	 * @param sUserDict
	 */
	/*public void importFileDict(String sUserDict){
		
		//导入用户词典
		int nCount;
		try {
			nCount = tagger.ICTCLAS_ImportUserDict(sUserDict.getBytes("UTF-8"));
			tagger.ICTCLAS_SaveTheUsrDic();//保存用户词典
			System.out.println("导入个用户词： " + nCount);
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
	}*/
	
	/**
	 * 动态添加用户词
	 * @param userWordMap 
	 * key: 词组
	 * value: 词性
	 */
	public void importFileDict(String sUserDict){
		
//		String sWordUser = "小米	org";
		List<String> sWord = FileUtils.readTxtByLine(sUserDict, 1, 20);
		try {
			for(String sWordUser : sWord){
//				sWordUser = key + "\t" + userWordMap.get(key);
				tagger.ICTCLAS_AddUserWord(sWordUser.getBytes("GB2312"));
			}
//			tagger.ICTCLAS_AddUserWord(sWordUser.getBytes("GB2312"));
			tagger.ICTCLAS_SaveTheUsrDic();//保存用户词典
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 释放分词组件资源
	 */
	public void exit(){
		tagger.ICTCLAS_Exit();
	}
	
	public void tagFile(String srcFile, String desFile, int bPOSTagged){
		try {
			tagger.ICTCLAS_FileProcess(srcFile.getBytes(CHARSET), desFile.getBytes(CHARSET), bPOSTagged);
		} catch(Exception ex) {
			ex.printStackTrace();
		} 
	}
	
	
	public static void main(String[] args) throws Exception {
		
//		String sInput = "张华平2009年底调入北京理工大学计算机学院。";
//		String sInput = "T 36.3℃  P 72次/分  R 20次/分  BP 150/78mmHg 神志清楚，精神稍倦，形体中等，营养一般，对答合理，言语欠清，查体合作。全身粘膜及巩膜未见黄染；全身浅表淋巴结未触及肿大。头面端正，双瞳孔等大等圆，直径约3.0mm，对光反射灵敏。耳鼻无异常，口唇无发绀，咽充血（-），双侧扁桃体无肿大，颈软，气管居中，甲状腺不大，颈静脉无怒张。胸廓对称无畸形，双肺叩诊呈清音，听诊双肺呼吸音清，未闻及干湿性罗音，未闻及哮鸣音。心前区无隆起，未及震颤，心界稍向左下扩大，心率72次/分，律齐，各瓣膜听诊区未闻及病理性杂音。腹平软，无浅表静脉曲张，未见胃肠型及蠕动波，腹部无压痛及反跳痛，肝脾肋下未触及，墨菲氏征（-），肝肾区无叩击痛，移动性浊音阴性，肠鸣音未见异常。脊柱四肢无畸形，双下肢无浮肿。神经系统检查见专科检查。 舌淡暗，舌底脉络迂曲，苔白腻，脉滑，尺脉弱。";
//		String sInput = "Talkbox创始人郭秉鑫分享产品被腾讯、google、小米抄袭之后，一步步沦落，退出中国市场竞争的五点血泪教训。Talkbox最初是六人创业团队,针对开车不方便接听电话的人和盲人开发的全球第一款语音IM应用，经过1年左右的研发，2011年1月份上线，仅仅3天的时间，在App Store的下载量就涨到了100万。此后，腾讯曾经找到郭谈收购，不久之后，米聊增加了语音功能，再之后，微信来了，郭秉鑫隐约意识到自己的“活路”被断了，意料之中，产品的用户从400万、500万跌落现在仅有100万。郭秉鑫最终决定退出大陆市场，转攻海外市场。";
		//分词
		CWSTagger tagger = new CWSTagger();
//		System.out.println(tagger.tag("Ｚａｃｋｓ重申空中网持有评级 　目标股价５美元", 1));
		
		List<String> filelist = new ArrayList<String>();
		
		FileUtils.fetchFileList("E:/data/title", filelist, ".txt");
		for(String file : filelist){
			String content = FileUtils.readText(file);
			String tagged = tagger.tag(BCConvert.qj2bj(content), 1);
			System.out.println(tagged);
			FileUtils.writeFile(file.replace("title", "title_seg"), tagged);
		}
		tagger.exit();
		
		FileUtils.mergeFiles("E:/data/title_seg", "E:/data/title_seg.txt");
	}
	
}
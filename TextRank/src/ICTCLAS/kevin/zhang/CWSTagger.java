package ICTCLAS.kevin.zhang;

import java.io.UnsupportedEncodingException;
import java.util.Map;

public class CWSTagger {

	private ICTCLAS2011 tagger = new ICTCLAS2011();
	private final String CHARSET = "UTF-8";
	private String dicPath = "./dict/userdict.txt";
	
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
	public void importFileDict(String sUserDict){
		
		//导入用户词典
		int nCount;
		try {
			nCount = tagger.ICTCLAS_ImportUserDict(sUserDict.getBytes(CHARSET));
			tagger.ICTCLAS_SaveTheUsrDic();//保存用户词典
			System.out.println("导入个用户词： " + nCount);
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 动态添加用户词
	 * @param userWordMap 
	 * key: 词组
	 * value: 词性
	 */
	public void importDict(Map<String, String> userWordMap){
		
		String sWordUser = "973专家组组织的评测	ict";
		try {
			for(String key : userWordMap.keySet()){
				sWordUser = key + "\t" + userWordMap.get(key);
				tagger.ICTCLAS_AddUserWord(sWordUser.getBytes(CHARSET));
			}
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
		String sInput = "患者于2006年1月在家安静状态下突发右侧肢体乏力，当时神清，伴言语欠清，无肢体抽搐，无头晕头痛等不适，家属急送其至广州军区总医院就诊，查头颅MR提示：左侧顶叶脑梗塞，给予抗聚、营养神经等治疗后病情稳定出院，遗留右侧肢体乏力，右手不能持物、不能行走，言语欠清。之后于2006年2月至我院康复科康复治疗，出院时可自行缓慢步行、右手仍不能持物。2006年6月10日患者在家中突然出现意识丧失、双目上视、四肢抽搐，至我院急诊就诊，拟“继发性癫痫”收入我科，经治疗后症状好转出院，出院后坚持口服“得理多”控制癫痫发作，2007年8月再次因“继发性癫痫”在我科接受治疗，根据病情将得理多加量以控制癫痫发作，至今无再发癫痫发作。之后先后多次于我院行针灸康复治疗，仍有右侧肢体乏力，自行扶拐拖步行走，右上肢不能持物，近1月患者自觉右侧肢体拘挛僵硬感明显，伴有右上肢轻微肿胀，活动受限，为求进一步系统诊疗，由门诊拟“脑梗塞后遗症”收入我科。 入院症见：患者神清，精神稍倦，右侧肢体乏力，局部僵硬感，右上肢远端肿胀，活动受限，右下肢扶行拖步，言语欠流利，夜间偶有胸闷不适，无恶寒发热、头痛耳鸣、无咳嗽咯痰、肢体抽搐等症状，纳眠可，口干无口苦，夜尿3－4次，大便日一行，质软通畅。";
		sInput = "既往因支气管扩张病数次在我院住院治疗，经治疗后均症状好转出院。既往慢性浅表性胃炎炎病史，偶有胃脘部不适。于2004年因车祸致右胫腓骨下段骨折在我院行手术治疗，现遗留钢板，否认高血压、糖尿病、冠心病、肾病等病史，否认肝病、结核等传染病史，否认输血及外伤史。";
		//分词
		CWSTagger tagger = new CWSTagger("");
		System.out.println(tagger.tag(sInput, 1));
		tagger.tagFile("./text_example/0.txt", "./output/0.txt", 1);
		tagger.exit();
	}
	
}
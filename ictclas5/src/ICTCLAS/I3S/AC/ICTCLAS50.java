package ICTCLAS.I3S.AC;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.buptsse.ate.utils.Constant;
import com.buptsse.ate.utils.FileHelp;
 
public class ICTCLAS50
{
	//public enum eCodeType
	//{
	//    CODE_TYPE_UNKNOWN,//type unknown 
	//    CODE_TYPE_ASCII,//ASCII
	//    CODE_TYPE_GB,//GB2312,GBK,GB10380
	//    CODE_TYPE_UTF8,//UTF-8
	//    CODE_TYPE_BIG5//BIG5
	//}
	private Logger log = Logger.getLogger(getClass());
	
	public native boolean ICTCLAS_Init(byte[] sPath);
	public native boolean ICTCLAS_Exit();
	public native int ICTCLAS_ImportUserDictFile(byte[] sPath,int eCodeType);
	public native int ICTCLAS_SaveTheUsrDic();
	public native int ICTCLAS_SetPOSmap(int nPOSmap);
	public native boolean ICTCLAS_FileProcess(byte[] sSrcFilename, int eCodeType, int bPOSTagged,byte[] sDestFilename);
	public native byte[] ICTCLAS_ParagraphProcess(byte[] sSrc, int eCodeType, int bPOSTagged);
	public native byte[] nativeProcAPara(byte[] sSrc, int eCodeType, int bPOStagged);
	/* Use static intializer */
	static
	{
		System.loadLibrary("./ICTCLAS_CONFIG/ICTCLAS50");
	}
	
	private String charset = "GBK";
	
	public String testICTCLAS_ParagraphProcess(String sInput) {
		try {
			ICTCLAS50 testICTCLAS50 = new ICTCLAS50();
			String argu = "./ICTCLAS_CONFIG";
			// 初始化
			if (testICTCLAS50.ICTCLAS_Init(argu.getBytes(charset)) == false) {
				System.out.println("Init Fail!");
				return "";
			}

			// 设置词性标注集(0 计算所二级标注集，1 计算所一级标注集，2 北大二级标注集，3 北大一级标注集)
			testICTCLAS50.ICTCLAS_SetPOSmap(2);

			// 导入用户字典
			int nCount = 0;
			String usrdir = "./ICTCLAS_CONFIG/userdict.txt"; // 用户字典路径
			byte[] usrdirb = usrdir.getBytes();// 将string转化为byte类型
			// 导入用户字典,返回导入用户词语个数第一个参数为用户字典路径，第二个参数为用户字典的编码类型
			nCount = testICTCLAS50.ICTCLAS_ImportUserDictFile(usrdirb, 0);
//			System.out.println("导入用户词个数" + nCount);

			// 导入用户字典后再分词
			byte nativeBytes[] = testICTCLAS50.ICTCLAS_ParagraphProcess(sInput.getBytes(charset), 2, 1);
//			System.out.println("文章字数：" + nativeBytes.length);
			String nativeStr1 = new String(nativeBytes, 0,nativeBytes.length, charset);
//			System.out.println("导入用户词典后的分词结果： " + nativeStr1);
			// 保存用户字典
			testICTCLAS50.ICTCLAS_SaveTheUsrDic();
			// 释放分词组件资源
			testICTCLAS50.ICTCLAS_Exit();
			return nativeStr1;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "";

	}
	
	public void ICTCLAS_FileProcess(byte[] sSrcFilename, byte[] sDestFilename, int bPOSTagged) {
		
		try {
			ICTCLAS50 testICTCLAS50 = new ICTCLAS50();
			// 分词所需库的路径
			String argu = "./ICTCLAS_CONFIG";
			// 初始化
			if (testICTCLAS50.ICTCLAS_Init(argu.getBytes("UTF-8")) == false) {
				log.error("Init Fail!");
				return;
			}
			// 设置词性标注集(0 计算所二级标注集，1 计算所一级标注集，2 北大二级标注集，3 北大一级标注集)
			testICTCLAS50.ICTCLAS_SetPOSmap(3);
			
			// 用户字典路径
			byte[] usrdirb = Constant.USERDICT.getBytes();// 将string转化为byte类型
			// 第一个参数为用户字典路径，第二个参数为用户字典的编码类型(0:type
			// unknown;1:ASCII码;2:GB2312,GBK,GB10380;3:UTF-8;4:BIG5)
			int nCount = testICTCLAS50.ICTCLAS_ImportUserDictFile(usrdirb, 3);// 导入用户字典,返回导入用户词语个数
//			log.info("导入用户词个数" + nCount);
			// 文件分词(第一个参数为输入文件的名,第二个参数为文件编码类型,第三个参数为是否标记词性集1 yes,0
			// no,第四个参数为输出文件名)
			testICTCLAS50.ICTCLAS_FileProcess(sSrcFilename, 3, bPOSTagged, sDestFilename);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			log.error(ex.getMessage());
		}
	}
	
	public static void main(String[] args){
		/*ICTCLAS50 ICTCLAS = new ICTCLAS50();
		String text = FileHelp.readText("text_example/24162.txt");
		String segment = ICTCLAS.getWordsSeg(text);
		System.out.println(segment);*/
	}
}



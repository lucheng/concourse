package ICTCLAS.I3S.AC;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;

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
	
	private String usrdir = "./ICTCLAS_CONFIG/userdict.txt"; // 用户字典路径
	
	
	private String charset = "GBK";
	
	public ICTCLAS50(String usrdir){
		try {
			String argu = "./ICTCLAS_CONFIG";
			if (ICTCLAS_Init(argu.getBytes(charset)) == false) {
				System.out.println("Init Fail!");
				return;
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		this.usrdir = usrdir;
	}
	
	public ICTCLAS50(){
		
		try {
			String argu = "./ICTCLAS_CONFIG";
			if (ICTCLAS_Init(argu.getBytes(charset)) == false) {
				System.out.println("Init Fail!");
				return;
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
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
			byte[] usrdirb = usrdir.getBytes();// 将string转化为byte类型
			// 导入用户字典,返回导入用户词语个数第一个参数为用户字典路径，第二个参数为用户字典的编码类型
			nCount = testICTCLAS50.ICTCLAS_ImportUserDictFile(usrdirb, 0);
//			System.out.println("导入用户词个数" + nCount);

			// 导入用户字典后再分词
			byte nativeBytes[] = testICTCLAS50.ICTCLAS_ParagraphProcess(sInput.getBytes(charset), 2, 0);
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
			byte[] usrdirb = usrdir.getBytes();// 将string转化为byte类型
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
	/**
	 * 导入用户词典
	 * @param usrdir
	 */
	public void importUserDictFile(String usrdir){
		
			byte[] usrdirb = usrdir.getBytes();// 将string转化为byte类型
			
//			System.out.println("导入用户词个数" + usrdirb.length);
			// 导入用户字典,返回导入用户词语个数第一个参数为用户字典路径，第二个参数为用户字典的编码类型
			int nCount = ICTCLAS_ImportUserDictFile(usrdirb, 0);
			System.out.println("导入用户词个数" + nCount);
			ICTCLAS_SaveTheUsrDic();
			
	}
	
	public void exit(){
		
		// 释放分词组件资源
		ICTCLAS_Exit();
	}
	
	public void partUserDic(String originDic, String destDicPath, int length){
		
		File file = new File(originDic);
        BufferedReader reader = null;
        try {
//            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String userdic = "";
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
            	userdic += tempString + System.getProperty("line.separator");
            	if(line % length == 0){
            		BufferedWriter output = new BufferedWriter(new FileWriter(new File(destDicPath + "/" + (line / length) + ".txt")));
            		output.write(userdic);
            		output.close();
            		userdic = "";
	                System.out.println("line " + line + ": " + tempString);
            	}
                line++;
            }
            
            BufferedWriter output = new BufferedWriter(new FileWriter(new File(destDicPath + "/" + (line / length) + ".txt")));
    		output.write(userdic);
    		output.close();
    		userdic = "";
            
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                	e1.printStackTrace();
                }
            }
        }
	}
	
	/**
	 * 
	 * @param sInput 分词内容
	 * @param bPOSTagged 是否显示词性
	 * @return
	 */
	public String tag(String sInput, int bPOSTagged) {
		try {
			String argu = "./ICTCLAS_CONFIG";
			if (ICTCLAS_Init(argu.getBytes(charset)) == false) {
				System.out.println("Init Fail!");
				return "";
			}

			// 设置词性标注集(0 计算所二级标注集，1 计算所一级标注集，2 北大二级标注集，3 北大一级标注集)
			ICTCLAS_SetPOSmap(2);

			byte nativeBytes[] = ICTCLAS_ParagraphProcess(sInput.getBytes(charset), 2, bPOSTagged);
			System.out.println("文章字数：" + nativeBytes.length);
			String nativeStr1 = new String(nativeBytes, 0,nativeBytes.length, charset);
			// 释放分词组件资源
			ICTCLAS_Exit();
			return nativeStr1;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "";

	}
	
	public String tag(String sInput) {
		return tag(sInput, 0);
	}
	
	public static void main(String[] args){
		
		ICTCLAS50 ICTCLAS = new ICTCLAS50();
		ICTCLAS.importUserDictFile("./ICTCLAS_CONFIG/entity.txt");
		ICTCLAS.ICTCLAS_SaveTheUsrDic();
		ICTCLAS.ICTCLAS_Exit();
		
		/*for(int i = 1; i < 1019; i++){
			ICTCLAS50 ICTCLAS = new ICTCLAS50();
			ICTCLAS.importUserDictFile("./USER_DIC/" + i + ".txt");
			ICTCLAS.ICTCLAS_SaveTheUsrDic();
			ICTCLAS.ICTCLAS_Exit();
		}*/
		/*for(int i = 507; i < 1019; i++){
			String dic = "./USER_DIC/" + i + ".txt";
			ICTCLAS.importUserDictFile(dic);
			System.out.println(dic);
		}*/
//		ICTCLAS.exit();
//		String usrdir = "./USER_DIC/1.txt"; // 用户字典路径
		
		
		//分割百度百科
//		ICTCLAS.partUserDic(usrdir, "./USER_DIC", 4000);
		
		/*ICTCLAS50 ICTCLAS = new ICTCLAS50();
		String text = "最后，你所选择的学生平板电脑将决定你的创建和推广方式。最重要的是，它会决定你的目标用户。显然你多半会选择跨平台策略，无论是在应用生命周期初始还是末尾阶段。合理选择首个平台是你成败的关键。";
		String segment = ICTCLAS.tag(text, 1);
		System.out.println(segment);*/
	}
}



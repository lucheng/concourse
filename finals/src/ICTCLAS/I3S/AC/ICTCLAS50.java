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
//	public native boolean ICTCLAS_FileProcess(byte[] sSrcFilename, byte[] sDestFilename, int eCodeType, int bPOSTagged);
	public native byte[] ICTCLAS_ParagraphProcess(byte[] sSrc, int eCodeType, int bPOSTagged);
	public native byte[] nativeProcAPara(byte[] sSrc, int eCodeType, int bPOStagged);
	/* Use static intializer */
	static
	{
		System.loadLibrary("./ICTCLAS_CONFIG/ICTCLAS50");
		PropertyConfigurator.configure(Constant.LOG4J);
	}
	
	public String getWordsSeg(String sInput) {
		try {
			ICTCLAS50 testICTCLAS50 = new ICTCLAS50();
			String argu = "./ICTCLAS_CONFIG";
			// ��ʼ��
			if (testICTCLAS50.ICTCLAS_Init(argu.getBytes("GB2312")) == false) {
				log.error("ICTCLAS Init Fail!");
				return null;
			}

			// ���ô��Ա�ע��(0 ������������ע����1 ������һ����ע����2 ���������ע����3 ����һ����ע��)
			testICTCLAS50.ICTCLAS_SetPOSmap(2);

			// �����û��ֵ�
			int nCount = 0;
//			String usrdir = "./ICTCLAS_CONFIG/userdict.txt"; // �û��ֵ�·��
			byte[] usrdirb = Constant.USERDICT.getBytes();// ��stringת��Ϊbyte����
			// �����û��ֵ�,���ص����û����������һ������Ϊ�û��ֵ�·�����ڶ�������Ϊ�û��ֵ�ı�������
			nCount = testICTCLAS50.ICTCLAS_ImportUserDictFile(usrdirb, 0);
//			System.out.println("�����û��ʸ���" + nCount);
			nCount = 0;

			// �����û��ֵ���ٷִ�
			byte nativeBytes1[] = testICTCLAS50.ICTCLAS_ParagraphProcess(sInput.getBytes("GB2312"), 2, 1);
//			System.out.println(nativeBytes1.length);
			String nativeStr1 = new String(nativeBytes1, 0, nativeBytes1.length, "GB2312");
//			System.out.println("�����û��ʵ��ķִʽ���� " + nativeStr1);
			// �����û��ֵ�
			testICTCLAS50.ICTCLAS_SaveTheUsrDic();
			// �ͷŷִ������Դ
			testICTCLAS50.ICTCLAS_Exit();
			
			return nativeStr1;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}

	}
	
	public void ICTCLAS_FileProcess(byte[] sSrcFilename, byte[] sDestFilename, int bPOSTagged) {
		
		try {
			ICTCLAS50 testICTCLAS50 = new ICTCLAS50();
			// �ִ�������·��
			String argu = "./ICTCLAS_CONFIG";
			// ��ʼ��
			if (testICTCLAS50.ICTCLAS_Init(argu.getBytes("GB2312")) == false) {
				log.error("Init Fail!");
				return;
			}

			testICTCLAS50.ICTCLAS_SetPOSmap(2);
			
			// �û��ֵ�·��
			byte[] usrdirb = Constant.USERDICT.getBytes();// ��stringת��Ϊbyte����
			// ��һ������Ϊ�û��ֵ�·�����ڶ�������Ϊ�û��ֵ�ı�������(0:type
			// unknown;1:ASCII��;2:GB2312,GBK,GB10380;3:UTF-8;4:BIG5)
			int nCount = testICTCLAS50.ICTCLAS_ImportUserDictFile(usrdirb, 0);// �����û��ֵ�,���ص����û��������
			log.info("�����û��ʸ���" + nCount);
			// �ļ��ִ�(��һ������Ϊ�����ļ�����,�ڶ�������Ϊ�ļ���������,����������Ϊ�Ƿ��Ǵ��Լ�1 yes,0
			// no,���ĸ�����Ϊ����ļ���)
			testICTCLAS50.ICTCLAS_FileProcess(sSrcFilename, 0, bPOSTagged, sDestFilename);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			log.error(ex.getMessage());
		}
	}
	
	public static void main(String[] args){
		ICTCLAS50 ICTCLAS = new ICTCLAS50();
		String[] fileNames = FileHelp.getFiles("input/input");
		for(String fileName : fileNames){
			ICTCLAS.ICTCLAS_FileProcess(fileName.getBytes(), (fileName + ".tag").getBytes(), 1);
		}
	}
	
}



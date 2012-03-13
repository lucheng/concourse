package com.mywie.model;

public class RangeDifferencer {
	/**
	 * 
	 * ����ѯƥ��ģ����ַ����� 
	 * ������һ��ģ���ַ���,һ����Ҫ�Ƚϵ��ַ���,��ȡƥ��ģ����ַ���������.��
	 * 
	 * @param model
	 * @param input
	 * @return int �����Υ������ʹ��@exception/throws [Υ������]
	 *         [Υ��˵�����쳣��ע�ͱ���˵�����쳣�ĺ��弰ʲô�������׳���
	 * @see [�ࡢ��#��������#��Ա]
	 */
	public int Comparator(String model, String input) {

		char[] modelByte = model.toCharArray();
		char[] inputByte = input.toCharArray();
		// ��ǰģ������ֵ
		int j = 0;
		int right = 0;
//		StringBuffer sb = new StringBuffer();
//		StringBuffer sb2 = new StringBuffer();
//		StringBuffer sb3 = new StringBuffer();
		for (int i = 0; i < modelByte.length; i++) {

			int indexNum = ComparatorStr(modelByte[i], inputByte, j);
			// System.out.println("���ڱȽ�:"+(char)modelByte[i]+"���:"+indexNum);
			// �����ֵ��ģ���������õ�
			if (indexNum >= 0) {
				// ������������ֵ
				j = indexNum + 1;
				// ��ȷֵ+1
				right++;
//				sb.append((char) modelByte[i]);
//				sb2.append(indexNum + ",");
//				sb3.append(j + ",");
				// �����ֵ��ģ����û�������õ�
			}
		}
//
//		System.out.println("��ȷ����:" + right);
//		System.out.println("ƥ������:" + sb);
//		System.out.println("ģ������:" + model);
//		System.out.println("�Ա�����:" + input);
//		System.out.println("ģ�������±�:" + sb2);
//		System.out.println("�Ա������±�:" + sb3);
		return right;
	}
	
	
	/**
	 * 
	 * ����ѯƥ��ģ����ַ����� 
	 * ������һ��ģ���ַ���,һ����Ҫ�Ƚϵ��ַ���,��ȡƥ��ģ����ַ���������.��
	 * 
	 * @param model
	 * @param input
	 * @return int �����Υ������ʹ��@exception/throws [Υ������]
	 *         [Υ��˵�����쳣��ע�ͱ���˵�����쳣�ĺ��弰ʲô�������׳���
	 * @see [�ࡢ��#��������#��Ա]
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
	 * ����ѯƥ��ģ����ַ�����
	 * ������һ��ģ���ַ���,һ����Ҫ�Ƚϵ��ַ���,��ȡƥ��ģ����ַ���������.��
	 * 
	 * @param model
	 * @param input
	 * @return int �����Υ������ʹ��@exception/throws [Υ������]
	 *         [Υ��˵�����쳣��ע�ͱ���˵�����쳣�ĺ��弰ʲô�������׳���
	 * @see [�ࡢ��#��������#��Ա]
	 */
	public int Comparator3(String model, String input) {

		char[] modelByte = model.toCharArray();
		char[] inputByte = input.toCharArray();
			int indexNumRe = 0;
		// ��ǰģ������ֵ
		int j = 0;
		int right = 0;
//		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < modelByte.length; i++) {

			int indexNum = ComparatorStr(modelByte[i], inputByte, j);
			
			//����������һ����
				if(i<modelByte.length-1 && indexNum < 0){
				int indexNum2 = ComparatorStr(modelByte[i+1], inputByte, j);
				if (indexNum < indexNum2) {
					// ������������ֵ
					j = indexNum + 1;
						indexNumRe = indexNum;
					// ��ȷֵ+1
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
					// ��ȷֵ+1
					right++;
//					sb.append((char) modelByte[i]);
				}
			}
		}
		return right;
	}
	
	// ��һ��byte��������ģ���в����Ƿ����,����������ֵ
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
	 * ������������
	 * ������һ���ַ���,����������,����һ���޳��˱����ŵ�����.�ַ������͡�
	 * @param source
	 * @return String
	 * �����Υ������ʹ��@exception/throws [Υ������]   [Υ��˵�����쳣��ע�ͱ���˵�����쳣�ĺ��弰ʲô�������׳��� 
	 * @see          [�ࡢ��#��������#��Ա]
	 */
	public int coutWord(String source){
		
		//���ֱ�����
		String reg2="[\\~\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\_\\+\\`\\-\\=\\��\\��\\��\\��\\��\\" +
		"��\\��\\��\\��\\\\��\\��\\��\\��\\��\\��\\��\\[\\]\\\\'\\;\\/\\.\\,\\<\\>\\?\\:" +
		"\"\\{\\}\\|\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\" +
		"��\\��\\��\\r+\\n+\\t+\\s\\]";
		
		//�޳�������
		source = source.replaceAll(reg2, "");

		return source.getBytes().length;
	}
	
	
	/**
	 * 
	 * ���޳����š�
	 * ������һ���ַ���,����������,����һ���޳��˱����ŵ��ַ�����
	 * @param source
	 * @return String
	 * �����Υ������ʹ��@exception/throws [Υ������]   [Υ��˵�����쳣��ע�ͱ���˵�����쳣�ĺ��弰ʲô�������׳��� 
	 * @see          [�ࡢ��#��������#��Ա]
	 */
	public String RemovedSymbols(String source){
		
		//���ֱ�����
		String reg2="[\\~\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\_\\+\\`\\-\\=\\��\\��\\��\\��\\��\\" +
		"��\\��\\��\\��\\\\��\\��\\��\\��\\��\\��\\��\\[\\]\\\\'\\;\\/\\.\\,\\<\\>\\?\\:" +
		"\"\\{\\}\\|\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\��\\" +
		"��\\��\\��\\r+\\n+\\t+\\s\\]";
		
		//�޳�������
		source = source.replaceAll(reg2, "");

		return source;
	}

/**
 * 
 * ����ѯ���з��ϵ��ַ���
 * ����ѯ���з��ϵ��ַ���
 * @param input
 * @param model
 * @return String
 * �����Υ������ʹ��@exception/throws [Υ������]   [Υ��˵�����쳣��ע�ͱ���˵�����쳣�ĺ��弰ʲô�������׳��� 
 * @see          [�ࡢ��#��������#��Ա]
 */
	public String getTempModel(String input,String model){
		StringBuffer returnStr = new StringBuffer();
		
		//�ж�ģ���ַ����Ƿ�Ϊ��
		if(model!=null){
			
			//ģ���еĵ�ǰ�ַ���
			char[] modelChs = model.toCharArray();
			
			String cm = null;
			boolean sign = false;
			for (int i = 1; i < modelChs.length; i++) {
				//��ȡģ��������
				cm = String.valueOf(modelChs[i-1])+String.valueOf(modelChs[i]);
				
				//�����input�ַ������ҵ��ô���
				if(input.indexOf(cm)!=-1){
					
					if(!sign){
						returnStr.append(String.valueOf(modelChs[i-1]));
					}
					else{
						returnStr.append(String.valueOf(modelChs[i-1]));
					}
					sign = true;
					//�Ƿ��ѵ�ģ��ĩβ�ַ�
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
		
		String input= "�㽭��˾��Ϣ����̳������������������þ���ʡͨ�Ź���ֺ�ʡ��˾�������鳤����ʡ����ף�ض���̳��������Ӧ����ս���ƹ��ƶ���Ϣ������С������ȫ�潨��϶�ϣ����̳�����ƶ���ʡ����̨���ܾ���ͬʱָ���㽭��˾�쵼���ƶ�ͨ��ר��ר����Ϣ������������Ϣ";

		String model= "�㽭��˾��Ϣ������̳����Ϣ�������������2010��������㽭ʡ��������¡�ؾ��С�ʡ�����칫���ϸո����鳤��ʡͨ�Ź���ְ������ֳ���ʡ����ί�ֻ���Ѳ��Ա��ʡ��˾���컪�ܾ�����쵼��ϯ��ᡣ���ϣ��ϸո����鳤����ʡ�����´ǣ������ȶ���Ϣ����̳�����������ٿ���ʾף�أ�����̳��������Ӧʡ��������ҵ���񡢴���ǿʡ��������ս�ԣ��ԿƼ�����ƽ̨�ƹ��ƶ���Ϣ�������ٽ���ʡ����ת��������С������ȫ�潨���������ɼ���ʾ�϶�����ϣ����̳�������ܹ�����ʡʮ����滮���ٽ��������ƶ���ʡ��Ϣ����չ����̨�׷��Ӹ������á����컪�ܾ���Ը�λ�쵼�ĵ�����ʾ��л��ͬʱָ���й��ƶ��㽭��˾����ʡίʡ�������쵼�£����ٴ��ƶ�ͨ��ר�����ƶ���Ϣר��ת�ͣ��ԡ������㽭������Ϊ���Σ������ƽ���Ϣ�����裬������Ϣ����ҵˮƽ��";
		
		input= "���˿ͻ���������������չ�����ֻ���������ģʽ���߼�԰����ʵ�ּ�ͥ�ײ��������������ͻ���չ�ۼ�ϵ���ں����Ŀǰ���ž��������������ò����ȶ�����������������Ծɻ����������δ����������������������ɺ��Ƴ�ͨ�����������ͨ��׬ȡ���������������ͻ������������ͻ�";

		model= "���˷ֹ�˾ϸ�ֿͻ����ͳ����ƽ�����������չ��һ�����á��ֻ�+���������ں�����ģʽ����չ�����ͻ����Ƴ�Eϵͳ�����߼�԰���ײͣ����������ֻ��ͻ��Ĺ�ģ���ƣ�ʵ�ּ�ͥ�ײ��ڵ��ֻ����������޳��򣬴�����ͥ�����ͻ���չ��Ŀǰ���ۼƷ�չEϵ���ں��ײ��û���2200�໧���������Ŀǰ���ž������ƣ��������������ƹ�����������ã��ڼ��Ų��濪չ���������Ź�����ȶ����ž������ơ�������������ڵ������ͻ����Ƴ�Ԥ���ͻ��ѡ������Ծɻ��µ�ϵ�к����������������ж��δ�����������߿ͻ�����Ⱥ�����ճ�ԡ��ġ��������������Ĭ��ͻ���ͻ����Ƴ���ͨ��׬���ѡ�����ͻ����ǰÿ��ͨ���ﵽһ��ʱ�伴�ɻ���5Ԫ���ѣ������ͻ����û�ͨ��׬ȡ���ѡ�ͨ���������������������������ͻ����������ԡ�";
		
		input = "1231";
		model = "1233";
		
//		input= "�ҷֹ�˾�������ž�����˾�쵼�߶����ӷֹ�˾Ӧ�Ա仯���ܽ��������ս�Է���ʱ��̨Ӧ����������Ӵ��Ż����ȵ���ȫ������֯��չ��չ���ڼ��������Ž�Ͼ�����ʽ��ʽ������Ӧ���߷ýű��������Ż��鲼�ÿͻ�����������֯��Ա��Ա��ǿ����ǩԼǩԼͳһ������չͬ��֧��ĿǰǩԼ�ۼ��ۼ���һ������";
//
//		model= "���˷ֹ�˾�����ж�Ӧ�������༯�ž�����һ����˾�쵼�߶����ӣ���֯��������ֹ�˾�ٿ�����Ӧ�����ۻ���ÿ�յ��ӵ绰���ᣬ��ǰ�����ƽ����ܽ���������ѿؾ���Ӧ�Ե�����ս�Է��򡣶����г��������ż�ʱ������̨Ӧ��������ָ�������ͨ����չ��������ǩԼ���Ӵ�ȫҵ���Ż����ȣ��ӹ�����������ָ��ȫ������չӦ�ԡ�������֯��չר�⼯��Ԥ��������ȫ��1669�������༯�ţ���ϼ��ž����������ȶ��Ƚ��к�Ƶ���ͨ�����ġ������·�����Ӧ���߷ýű���Ӧ�������ھ���ͨ���������߻�����в��ã��淶һ�߿ͻ��������������֯��Ա��һ�߿�չ�߷���֧Ԯ���塢��ǿ����������ǩԼ�����ƹ㼯�Ż���ͳһ֧����⣬��������չ�˼��ű���ǩԼ�����һ���ȶ����Ż������롣����Ŀǰ��ȫ������ǩԼ�����ۼ��Ѵ�2000��ң������༯��������汣���ȶ���";
//		
		
//		input= "�㽭��˾��Ϣ������������������ø��;ֳ���ʡ��˾�ܾ�����ϸ��������������ٿ������˴����������ƹ�vjishu�ٽ���С�������������������ٽ�����̨�׸������öԸ���ͬ��ָ��ʡ�����������ƶ�ר�ҽ���Ϊ���δ�������ˮƷ";
//		model= "�㽭��˾��Ϣ����̳����Ϣ�������������2010��������㽭ʡ��������¡�ؾ��С�ʡ�����칫���ϸո����鳤��ʡͨ�Ź���ְ������ֳ���ʡ����ί�ֻ���Ѳ��Ա��ʡ��˾���컪�ܾ�����쵼��ϯ��ᡣ���ϣ��ϸո����鳤����ʡ�����´ǣ������ȶ���Ϣ����̳�����������ٿ���ʾף�أ�����̳��������Ӧʡ��������ҵ���񡢴���ǿʡ��������ս�ԣ��ԿƼ�����ƽ̨�ƹ��ƶ���Ϣ�������ٽ���ʡ����ת��������С������ȫ�潨���������ɼ���ʾ�϶�����ϣ����̳�������ܹ�����ʡʮ����滮���ٽ��������ƶ���ʡ��Ϣ����չ����̨�׷��Ӹ������á����컪�ܾ���Ը�λ�쵼�ĵ�����ʾ��л��ͬʱָ���й��ƶ��㽭��˾����ʡίʡ�������쵼�£����ٴ��ƶ�ͨ��ר�����ƶ���Ϣר��ת�ͣ��ԡ������㽭������Ϊ���Σ������ƽ���Ϣ�����裬������Ϣ����ҵˮƽ��";
//		StringBuffer s1 = new StringBuffer();
//		s1.append("EJP(Extensible Java Profiler ) ��Դ��Java��������,��ʹ��һ����������,����չ����ϵ�ṹ.һ��Java���������������Ż�Java�������ܵĿ�������,���������ҳ����Ƴ����п�����Ĳ���.EJP����JVMPI(Java Virtual Machine Profiler Interface )���������JavaӦ�ó���һС���ֵ�ִ�������������һЩͻ����Ԫ���ڷֲ�����ϱ�ʾ����.");
//		StringBuffer s2 = new StringBuffer();
//		s2.append("EJP(Extensible Java Profiler ) ��ԴdgJava��������,��ʹ�ط����ǵ�,����չ����ϵ�ṹ.һ��Java���������������Ż�Java�������ܵĿ�������,���������ҳ����Ƴ����п�����Ĳ���.EJP����JVMPI(Java Virtual Machine Profiler Interface )���������JavaӦ�ó���һС���ֵ�ִ�������������һЩͻ����Ԫ���ڷֲ�����ϱ�ʾ����.");
//		input = r.RemovedSymbols(input);
//		model = r.RemovedSymbols(model);
		//System.out.println("��������:"+input.length());
		//System.out.println("ģ������:"+model.length());
//		String newModel = r.getTempModel(input, model);
//		String newInput = r.getTempModel(model, input);
//		System.out.println("��ģ��:"+newModel);
//		System.out.println("������:"+newInput);
		//System.out.println("����������:"+newInput.length());
		//System.out.println("��ģ������:"+newModel.length());
		
		//System.out.println("������ƥ��:"+r.Comparator(newModel, newInput));
		String newModel = model;
		String newInput = input;
		
		System.out.println("����ƥ��:"+r.Comparator(newInput, newModel));
		System.out.println("����ƥ��:"+r.Comparator2(newInput, newModel));
		System.out.println("����ƥ��:"+r.Comparator3(newInput, newModel));
		System.out.println("��ģ��:"+newModel);
		System.out.println("������:"+newInput);
		//System.out.println("ģ������:"+model);
		//System.out.println("ģ������:"+model);
	
		String[] str1 = {"","","",""};
		String[] str2 = {"","","",""};

	}
}
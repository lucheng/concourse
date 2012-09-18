package edu.bupt.utils;

import java.util.List;

public class Corpus2CRF {

	public static void translate() {
		
		List<String> tagged = FileUtils.readTxtByLine("E:/data/content_seg.txt", 1, Integer.MAX_VALUE);
		
		StringBuffer train = new StringBuffer();
		
		for(int i = 0; i < tagged.size(); i++){
			
			String str = tagged.get(i).replace("", "");
			String[] s = str.split(" ");
			for(String word : s){
				String[] value = word.split("/");
				String vv = value[0];
				String pos = value[1];
				
				if(vv.trim().equals("")){
					continue;
				}
				boolean flag = false;
				
				if(vv.length() == 1){
					train.append(vv + "\tS" + pos + "\n");
				}else{
					for(int j = 0; j < vv.length(); j++){
						
//						if(vv.substring(j, j+1).matches("[\u4e00-\u9fa5]")){
						if(vv.substring(j, j+1) != null){
							
							train.append(vv.substring(j, j+1));
							if(j == 0){
								train.append("\tB");
							}else if(j == vv.length()-2) {
								train.append("\tM");
							} else {
								train.append("\tE");
							}
							train.append(pos + "\n");
							flag = true;
						}
					}
					
					/*if(flag == false){
						train.append(vv+"\tS" + pos + "\n");
					}*/
				}
				
				if(pos.equals("wj") || pos.equals("wf")){
					train.append("\n");
				}
			}
			train.append("\n");
		}
		
		FileUtils.writeFile("train.data", train.toString());
	}

	
	public static void main(String argv[]) throws Exception {
	
		/*String str = "中国chin受到腐蚀的 sfsｓｆｓｓｄｆ ese";
		  StringBuilder sb = new StringBuilder();
		  for(int i=0;i<str.length();i++){
		      if(str.substring(i, i+1).matches("[\u4e00-\u9fa5]")){
		          System.out.println(str.subSequence(i, i+1)+"为汉字。");
		          sb.append(str.subSequence(i, i+1));
		      }else{
		          System.out.println(str.substring(i, i+1)+"不为汉字");
		      }
		  }
		  System.out.println(sb.toString());*/
		translate();
		
	}

}

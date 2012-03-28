package ICTCLAS.I3S.AC;

import com.buptsse.ate.utils.FileHelp;

class TestMain { // Ö÷º¯Êý
	public static void main(String[] args) {
		try {
			String sInput = FileHelp.readText("files/test.txt");
			ICTCLAS50 ICTCLAS50 = new ICTCLAS50();
			String outString = ICTCLAS50.getWordsSeg(sInput);
			String[] segwords = outString.split(" ");
			for(String str : segwords){
				System.out.println(str);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

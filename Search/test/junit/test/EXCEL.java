package junit.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class EXCEL {
	
	public static void export(){
		
		try{
			InputStream is = new FileInputStream("E:/all.xls");
			Workbook book=Workbook.getWorkbook(is);
			Sheet sheet=book.getSheet(0);
			Cell cell[]=sheet.getColumn(3);
			for(int i=0; i < cell.length; i++){//读出文件内容
				System.out.println(cell[i].getContents());
			}
			System.out.println("导入的数据行数："+sheet.getRows());
			System.out.println("导入的数据列数："+sheet.getColumns());
			
			WritableWorkbook wrk = Workbook.createWorkbook(new FileOutputStream("b.xls"));
			WritableSheet wst = wrk.createSheet("demo", 0);
			Label l=new Label(0,0,"cike");//有多种格式的单元格
			wst.addCell(l);
			
			book.close();
			wrk.write();//必须有
			wrk.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void writeExcelUseFormat(Map<String, List<String>> exportDatas, String outputFilePath, String outputFileSheetName) throws Exception {
        
		OutputStream os = new FileOutputStream(outputFilePath);// 输出的Excel文件URL
        WritableWorkbook wwb = Workbook.createWorkbook(os);// 创建可写工作薄
        WritableSheet sheet = wwb.createSheet(outputFileSheetName, 0);// 创建可写工作表
        
        int i = 0;
        for(String key : exportDatas.keySet()){
        	
        	int j = 0;
        	sheet.addCell(new Label(i, j, key));
        	for(String value : exportDatas.get(key)){
//        		System.out.println(i+ " " +j);
        		j++;
        		sheet.addCell(new Label(i, j, value));
        	}
        	i++;
        }
        
        wwb.write();
        wwb.close();
        os.close();
    }
	
	public static void test() throws Exception{
		
		double[][] data = new double[12357][20331];
		
		InputStream is = new FileInputStream("E:/all.xls");
		Workbook book=Workbook.getWorkbook(is);
		Sheet sheet=book.getSheet(0);
		
		Cell relation[] = sheet.getColumn(3);
		Cell article[] = sheet.getColumn(4);
		Cell alias[] = sheet.getColumn(5);
		
		for(int i=0; i < relation.length; i++){
			
			int articleNum = Integer.parseInt(article[i].getContents());
			int aliasNum = Integer.parseInt(alias[i].getContents());
			data[aliasNum][articleNum] = Double.parseDouble(relation[i].getContents());
			
		}
		System.out.println("导入的数据行数："+sheet.getRows());
		System.out.println("导入的数据列数："+sheet.getColumns());
	}
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		
		test();
	}
}

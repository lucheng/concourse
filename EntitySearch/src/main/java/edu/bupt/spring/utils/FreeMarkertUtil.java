package edu.bupt.spring.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/*******************************************************************************
 * 
 * @author wuzhenzhong
 * 
 * @since Feb 5, 2010
 * 
 ******************************************************************************/
public class FreeMarkertUtil {
	/**
	 * templatePath妯℃澘鏂囦欢瀛樻斁璺緞,templateName 妯℃澘鏂囦欢鍚嶇О,filename 鐢熸垚鐨勬枃浠跺悕绉�	 * @param templatePath
	 * @param templateName
	 * @param fileName
	 * @param root
	 */
	public static void analysisTemplate(String templatePath,
			String templateName, String fileName, Map<?, ?> root) {
		try {
			//鍒濅娇鍖朏reeMarker閰嶇疆
			Configuration config = new Configuration();
			// 璁剧疆瑕佽В鏋愮殑妯℃澘鎵�湪鐨勭洰褰曪紝骞跺姞杞芥ā鏉挎枃浠�			
			config.setDirectoryForTemplateLoading(new File(templatePath));
			// 璁剧疆鍖呰鍣紝骞跺皢瀵硅薄鍖呰涓烘暟鎹ā鍨�			
			config.setObjectWrapper(new DefaultObjectWrapper());

			// 鑾峰彇妯℃澘,骞惰缃紪鐮佹柟寮忥紝杩欎釜缂栫爜蹇呴』瑕佷笌椤甸潰涓殑缂栫爜鏍煎紡涓�嚧
			// 鍚﹀垯浼氬嚭鐜颁贡鐮�			
			Template template = config.getTemplate(templateName, "UTF-8");
			// 鍚堝苟鏁版嵁妯″瀷涓庢ā鏉�			
			FileOutputStream fos = new FileOutputStream(fileName);
			Writer out = new OutputStreamWriter(fos, "UTF-8");
			template.process(root, out);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

}

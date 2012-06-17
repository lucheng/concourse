package edu.bupt.spring.web.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * kindeditor 上传
 * @author  linzhe
 * @Date    2012-6-2
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Controller("kindeditorController")
public class KindEditorController extends BaseController{
  
	/*
	 * 上传图片 
	 */
	@RequestMapping(value = "/kindeditor/uploadImage")
	public String uploadImage(HttpServletRequest request) throws FileUploadException {
		
		/**
		 * KindEditor JSP
		 * 
		 * 本JSP程序是演示程序，建议不要直接在实际项目中使用。
		 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
		 * 
		 */

		//文件保存目录路径
		String savePath = request.getRealPath("/") + "attached/";
		
		System.out.println(savePath);

		//文件保存目录URL
		String saveUrl  = request.getContextPath() + "/attached/";
		
		System.out.println(saveUrl);
		//定义允许上传的文件扩展名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

		//最大文件大小
		long maxSize = 1000000;

//		response.setContentType("text/html; charset=UTF-8");

		if(!ServletFileUpload.isMultipartContent(request)){
//			out.println(getError("请选择文件。"));
			return getError("请选择文件。");
		}
		//检查目录
		File uploadDir = new File(savePath);
		if(!uploadDir.isDirectory()){
//			out.println(getError("上传目录不存在。"));
			return getError("上传目录不存在。");
		}
		//检查目录写权限
		if(!uploadDir.canWrite()){
//			out.println(getError("上传目录没有写权限。"));
			return getError("上传目录没有写权限。");
		}

		String dirName = request.getParameter("dir");
		if (dirName == null) {
			dirName = "image";
		}
		if(!extMap.containsKey(dirName)){
//			out.println(getError("目录名不正确。"));
			return getError("目录名不正确。");
		}
		//创建文件夹
		savePath += dirName + "/";
		saveUrl += dirName + "/";
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";
		saveUrl += ymd + "/";
		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		List items = upload.parseRequest(request);
		Iterator itr = items.iterator();
		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			String fileName = item.getName();
			long fileSize = item.getSize();
			if (!item.isFormField()) {
				//检查文件大小
				if(item.getSize() > maxSize){
//					out.println(getError("上传文件大小超过限制。"));
					return getError("上传文件大小超过限制。");
				}
				//检查扩展名
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
//					out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
					return getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
				}

				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
				try{
					File uploadedFile = new File(savePath, newFileName);
					item.write(uploadedFile);
				}catch(Exception e){
//					out.println(getError("上传文件失败。"));
					return getError("上传文件失败。");
				}

				JSONObject obj = new JSONObject();
				obj.put("error", 0);
				obj.put("url", saveUrl + newFileName);
//				out.println(obj.toJSONString());
				return obj.toString();
			}
		}
		return "";
	}

	private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toString();
	}
}

package com.mywie.utils;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import javax.imageio.ImageIO;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImageUtil {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		try {
			ImageUtil.createImage(new URL(
					"http://www.google.cn/intl/zh-CN/images/logo_cn.gif"),
					new File("d:/loge.jpg"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void createImage(File file, File targetFile)
			throws IOException {
		Image src = ImageIO.read(file);
		int width = src.getWidth(null);
		int height = src.getHeight(null);
		writerToImage(src, targetFile, width, height);
	}

	public static void createImage(File file, File targetFile, int width,
			int height) throws IOException {
		Image src = ImageIO.read(file);
		writerToImage(src, targetFile, width, height);
	}

	public static void createImage(URL url, File targetFile) throws IOException {
		Image src = ImageIO.read(url);
		int width = src.getWidth(null);
		int height = src.getHeight(null);
		writerToImage(src, targetFile, width, height);
	}

	public static void createImage(URL url, File targetFile, int width,
			int height) throws IOException {
		Image src = ImageIO.read(url);
		writerToImage(src, targetFile, width, height);
	}

	// 生成图片（长width,宽height）并将图片放入targetFile中。

	public static void writerToImage(Image src, File targetFile, int width,
			int height) throws IOException {
		BufferedImage tag = new BufferedImage(width, height,
				BufferedImage.TYPE_3BYTE_BGR);
		tag.getGraphics().drawImage(src, 0, 0, width, height, null); // 绘制缩小后的图
		FileOutputStream destOut = new FileOutputStream(targetFile); // 输出到文件流
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(destOut);
		encoder.encode(tag); // JPEG编码
		destOut.close();
	}

}

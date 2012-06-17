package edu.bupt.spring.web.controller;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.octo.captcha.service.image.ImageCaptchaService;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

@Controller("captchaImageCreateController")
public class CaptchaImageCreateController {
	
	@Resource(name = "imageCaptchaService")  
    private ImageCaptchaService imageCaptchaService;  
  
    @RequestMapping(value = "/captchaImage")  
    public void ImageCaptcha(HttpServletRequest request , HttpServletResponse response , Model model) throws Exception{  
  
        byte[] captchaChallengeAsJpeg = null;  
        // the output stream to render the captcha image as jpeg into  
        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();  
        try {  
            // get the session id that will identify the generated captcha.  
            // the same id must be used to validate the response, the session id  
            // is a good candidate!  
            String captchaId = request.getSession().getId();
            
            System.out.println("captchaId:" + captchaId);
            
            // call the ImageCaptchaService getChallenge method  
            BufferedImage challenge = imageCaptchaService.getImageChallengeForID(captchaId, request.getLocale());  
  
            // a jpeg encoder  
            JPEGImageEncoder jpegEncoder = JPEGCodec.createJPEGEncoder(jpegOutputStream);  
            jpegEncoder.encode(challenge);  
        }catch (Exception e) {  
            // TODO Auto-generated catch block
            e.printStackTrace();  
        }  
          
        captchaChallengeAsJpeg = jpegOutputStream.toByteArray();    
        // flush it in the response    
        response.setHeader("Cache-Control", "no-store");    
        response.setHeader("Pragma", "no-cache");    
        response.setDateHeader("Expires", 0);    
        response.setContentType("image/jpeg");    
        ServletOutputStream responseOutputStream = response.getOutputStream();    
        responseOutputStream.write(captchaChallengeAsJpeg);    
        responseOutputStream.flush();    
        responseOutputStream.close();  
    }  

}

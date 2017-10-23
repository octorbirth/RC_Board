package org.rc.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.imgscalr.Scalr;
import org.rc.util.MediaUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/upload/*")
@Log
public class UploadController {
	
	@PostMapping(value = "/")
    public @ResponseBody Map<String, String> upload(MultipartFile file) throws Exception {
        
		String original = file.getOriginalFilename(); // ȭ�� ǥ�ÿ�
		
        UUID uuid = UUID.randomUUID();
        // ���ϸ� �ߺ�ó��
        String uploadName = uuid.toString() + "_" + file.getOriginalFilename(); // DB �� ���� ���� ���ε� �̸�
        
        OutputStream out = new FileOutputStream("C:\\zzz\\"+ uploadName); // ���� ��� 
        FileCopyUtils.copy(file.getInputStream(), out); // ���� ���� ��ü ����
        
        String fileType = original.substring(original.lastIndexOf(".") + 1);
        
//        log.info("=====================");
//        log.info("���� ���� : " + fileType);
//        log.info("=====================");
        
        Map<String, String> map = new HashMap();
        if(MediaUtils.checkType(fileType) != null) { // �̹��� Ÿ���̶��
        	BufferedImage origin = ImageIO.read(file.getInputStream());	
        	BufferedImage desImg = Scalr.resize(origin,
                    Scalr.Method.AUTOMATIC,
                    Scalr.Mode.FIT_TO_HEIGHT, 100);
        	String thumbnailName = "s_" + uploadName;    
        	ImageIO.write(desImg, "jpg",  new FileOutputStream("C:\\zzz\\" + thumbnailName));
        	map.put("thumbName", thumbnailName);
        	map.put("type", "imgFile");
        }else {
        	map.put("type", "File");
        }
        
        map.put("original", file.getOriginalFilename());
        map.put("uploadName",uploadName);

        return map;        
    }
	
	
	@GetMapping("/thumb/{thumbName:.+}")
    public @ResponseBody byte[] display(@PathVariable("thumbName") String thumbName) throws Exception {
        File file = new File("C:\\zzz\\" + thumbName);
        return FileUtils.readFileToByteArray(file);
    }

}

package org.rc.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.rc.dto.ReplyDTO;
import org.rc.service.BoardService;
import org.rc.util.MediaUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	
	@Autowired
	private BoardService service;
	
	@PostMapping(value = "/")
    public @ResponseBody Map<String, String> upload(MultipartFile file) throws Exception {
        
		String original = file.getOriginalFilename(); // 화면 표시용
		
        UUID uuid = UUID.randomUUID();
        // 파일명 중복처리
        String uploadName = uuid.toString() + "_" + file.getOriginalFilename(); // DB 및 실제 파일 업로드 이름
        
        OutputStream out = new FileOutputStream("C:\\zzz\\"+ uploadName); // 파일 경로 
        FileCopyUtils.copy(file.getInputStream(), out); // 실제 파일 자체 저장
        
        String fileType = original.substring(original.lastIndexOf(".") + 1);
        
//        log.info("=====================");
//        log.info("파일 형식 : " + fileType);
//        log.info("=====================");
        
        Map<String, String> map = new HashMap();
        if(MediaUtils.checkType(fileType) != null) { // 이미지 타입이라면
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
	
	@PostMapping("/profile")
    public @ResponseBody Map<String, String> uploadProfile(MultipartFile file) throws Exception {
        
		String original = file.getOriginalFilename(); // 화면 표시용
		
        UUID uuid = UUID.randomUUID();
        // 파일명 중복처리
        String uploadName = uuid.toString() + "_" + file.getOriginalFilename(); // DB 및 실제 파일 업로드 이름
        
        OutputStream out = new FileOutputStream("C:\\zupload\\"+ uploadName); // 파일 경로 
        
        String fileType = original.substring(original.lastIndexOf(".") + 1);

        
        Map<String, String> map = new HashMap();
        if(MediaUtils.checkType(fileType) != null) { // 이미지 타입이라면
        	FileCopyUtils.copy(file.getInputStream(), out); // 실제 파일 자체 저장
        	BufferedImage origin = ImageIO.read(file.getInputStream());	
        	BufferedImage desImg = Scalr.resize(origin,
                    Scalr.Method.AUTOMATIC,
                    Scalr.Mode.FIT_TO_HEIGHT, 100);
        	String thumbnailName = "s_" + uploadName;    
        	ImageIO.write(desImg, "jpg",  new FileOutputStream("C:\\zupload\\" + thumbnailName));
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
	@GetMapping("/showprofile/{uploadName:.+}")
    public @ResponseBody byte[] showProfile(@PathVariable("uploadName") String uploadName) throws Exception {
        File file = new File("C:\\zupload\\" + uploadName);
        return FileUtils.readFileToByteArray(file);
    }
	
	@GetMapping("/download/{fileName:.+}")
    public ResponseEntity<byte[]> fileDown(@PathVariable("fileName") String fileName) throws Exception {
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
//        log.info("fileName : " + fileName);
        try {
        	HttpHeaders headers = new HttpHeaders();
        	in = new FileInputStream("C:\\zzz\\" + fileName);
        	fileName = fileName.substring(fileName.indexOf("_") + 1);       
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.add("Content-Disposition", "attachment; filename=\""+ 
              new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
              headers, HttpStatus.CREATED);
        }catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
        return entity;
    }
    
    @GetMapping("/list/{bno}")
    public @ResponseBody List<String> list(@PathVariable("bno") Long bno){
		return service.getFileList(bno);
    }

}

package com.osoondosson.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.osoondosson.service.ImageUploadService;
import com.osoondosson.service.UserService;
import com.osoondosson.vo.UploadResponse;
import com.osoondosson.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ImageUploadController {

	private final ImageUploadService imageUploadService;
	private final UserService userService;

    @Autowired
    public ImageUploadController(ImageUploadService imageUploadService, UserService userService) {
        this.imageUploadService = imageUploadService;
        this.userService = userService;
    }

    @PostMapping("/student/fileUpload" )
    public ResponseEntity<UploadResponse> uploadImage(@RequestParam("fileData") MultipartFile file) {
        try {
            String result = imageUploadService.uploadFile(file);
            return ResponseEntity.ok(new UploadResponse("success",result));
        } catch (Exception e) {
            log.error("Error occurred while uploading file", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new UploadResponse("error","Error occurred while uploading file"));
            /*return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred while uploading file");*/
        }
    }
    
    @PostMapping("/myPage/fileUpload" )
    public ResponseEntity<UploadResponse> uploadImage2(@RequestParam("fileData") MultipartFile file, Principal principal) {
        try {
        	String userId = principal.getName();
            String result = imageUploadService.uploadFile2(file, userId);
            return ResponseEntity.ok(new UploadResponse("success",result));
        } catch (Exception e) {
            log.error("Error occurred while uploading file", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new UploadResponse("error","Error occurred while uploading file"));
            /*return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred while uploading file");*/
        }
    }
    
    @PostMapping("/myPage/fileDelete")
    public ResponseEntity<UploadResponse> deleteFile(Principal principal) {
        try {

        	UserVO vo = userService.findById(principal.getName());
        	imageUploadService.deleteFile(vo);
            return ResponseEntity.noContent().build();
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(new UploadResponse("error","No file associated with this user"));
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new UploadResponse("error","Error occurred while deleting file"));
        }
    }
    
    
    
    


}

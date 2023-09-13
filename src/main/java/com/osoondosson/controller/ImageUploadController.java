package com.osoondosson.controller;

import com.osoondosson.service.ImageUploadService;
import com.osoondosson.vo.UploadResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@Slf4j
public class ImageUploadController {

    private final ImageUploadService imageUploadService;

    @Autowired
    public ImageUploadController(ImageUploadService imageUploadService) {
        this.imageUploadService = imageUploadService;
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


}

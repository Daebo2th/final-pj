package com.osoondosson.service;

import com.osoondosson.controller.AWSConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;

import java.io.InputStream;

@Service
public class ImageUploadService {

    private final S3Client s3Client;

    @Autowired
    public ImageUploadService(S3Client s3Client) {
        this.s3Client = s3Client;
    }

    public String uploadFile(MultipartFile file) {

        if (file.isEmpty()) {
            throw new IllegalArgumentException("Empty file provided");
        }
        PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                .bucket("osdsbucket")
                .key(file.getOriginalFilename())
                .build();

        try (InputStream is = file.getInputStream()) {
            PutObjectResponse response = s3Client.putObject(putObjectRequest, RequestBody.fromInputStream(is, file.getSize()));
            if (response.sdkHttpResponse().isSuccessful()) {
                return "https://osdsbucket.s3.amazonaws.com/" + file.getOriginalFilename();
                /*return "File uploaded successfully";*/
            } else {
                return "Error occurred while uploading file";
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while uploading file", e);
        }
    }
}

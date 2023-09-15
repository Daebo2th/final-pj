package com.osoondosson.controller;

import com.osoondosson.service.FileServiceImpl;
import com.osoondosson.service.ImageUploadService;
import com.osoondosson.vo.FileVO;
import com.osoondosson.vo.UploadResponse;
import com.sun.mail.imap.protocol.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriUtils;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
public class DriveController {

    @Autowired
    private FileServiceImpl fileService;

    @Autowired
    private S3Client s3Client;

    @Autowired
    private ImageUploadService imageUploadService;

    // 파일 업로드 처리
    @PostMapping("/teacher/dataSharingRoom/upload")
    public ResponseEntity<UploadResponse> uploadFile(@RequestParam("file") MultipartFile file, Principal principal, String userId) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        userId = authentication.getName();
        Object details = authentication.getDetails();
        Object detailss = authentication.getPrincipal();
        System.out.println("유저아이디:" + userId);
        System.out.println("유저디테일:" + details);
        System.out.println("유저프린시플:" + detailss);
        long fileSize = file.getSize();
        ByteBuffer buffer = ByteBuffer.allocate(Long.BYTES);
        buffer.putLong(fileSize);
        byte[] bytes = buffer.array();

        String uuid = UUID.randomUUID().toString();
        // 업로드된 파일 정보 추출
        FileVO fileVO = new FileVO();

        if (!file.isEmpty()) {
            fileVO.setUuid(uuid);
            fileVO.setOriginName(file.getOriginalFilename());
            fileVO.setUploadName(uuid + "_" + file.getOriginalFilename());
            fileVO.setUploadPath("/uploads/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
            fileVO.setFileSize(file.getSize());
            fileVO.setFileType(file.getContentType());
            fileVO.setUploadDate(new Date());
            fileVO.setGroupSeq(1);

            System.out.println("파일 업로드 : " + fileVO);
            fileService.uploadDrive(fileVO);
            // 업로드된 파일을 저장하거나 원하는 작업 수행
            // 예: 파일 시스템에 저장하거나 데이터베이스에 저장

        }

        // 새로운 파일명 생성 (UUID 추가)
        String newFilename = uuid + "_" + file.getOriginalFilename();
        // 각 사용자의 ID에 해당하는 서브 디렉토리에 파일이 저장되도록 키 값을 설정합니다.
        String objectKey = "dataSharing/" + userId + "/" + newFilename; // 나중에 userId가 아닌 groupName으로
        String url = "https://osdsbucket.s3.amazonaws.com/" + objectKey;


        PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                .bucket("osdsbucket")
                .key(objectKey)
                .build();

        try (InputStream is = file.getInputStream()) {
            PutObjectResponse response = s3Client.putObject(putObjectRequest, RequestBody.fromInputStream(is, file.getSize()));
            if (response.sdkHttpResponse().isSuccessful()) {

                fileVO.setUuid(uuid);
                fileVO.setOriginName(file.getOriginalFilename());
                fileVO.setUploadName(newFilename);
                fileVO.setUploadPath(objectKey);
                fileVO.setFileSize(file.getSize());
                fileVO.setFileType(file.getContentType());
            }
            System.out.println("파일 크기:" + file.getSize());
            String result = imageUploadService.uploadFile(file);
            return ResponseEntity.ok(new UploadResponse("success", result));
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while uploading file", e);
        }
    }

    @GetMapping("/teacher/dataSharingRoom")
    public Model listDriveFiles(Model model,Principal principal) {

        int groupSeq = 1;

        // Java 코드에서 두 개의 목록 결합
        List<FileVO> list = fileService.selectFile(groupSeq); // 첫 번째 목록
        List<String> fileExtensionList = new ArrayList<>(); // 두 번째 목록

        String fileExtension = null;
        for (FileVO file : list) {
            String fileName = file.getUploadName();
            if (fileName != null) {
                int lastDotIndex = fileName.lastIndexOf(".");
                if (lastDotIndex > 0) {
                    fileExtension = fileName.substring(lastDotIndex + 1); // 파일 확장자명
                    System.out.println("File Extension: " + fileExtension);
                    fileExtensionList.add(fileExtension);
                }
            }
        }
        model.addAttribute("getName", principal.getName());
        model.addAttribute("list", list);
        model.addAttribute("contentType", fileExtensionList);
        return model;
    }

    // 다운로드
//    @GetMapping("teacher/dataSharingRoom/download/{uuid}")
//    @ResponseBody
//    public ResponseEntity<ByteArrayResource> downloadFile(@PathVariable String uuid) throws UnsupportedEncodingException {
//        // UUID에 해당하는 파일을 데이터베이스에서 가져옵니다. (fileService에 해당 기능을 구현해야 합니다)
//        FileVO fileVO = fileService.getFileByUUID(uuid);
//
//        long fileSize = fileVO.getFileSize();
//        ByteBuffer buffer = ByteBuffer.allocate(Long.BYTES);
//        buffer.putLong(fileSize);
//        byte[] fileSizeBytes = buffer.array();
//
//        // 파일의 내용을 ByteArrayResource로 만듭니다.
//        ByteArrayResource resource = new ByteArrayResource(fileSizeBytes);
//
//        // Content-Disposition 헤더 생성
//        String encodedFileName = UriUtils.encode(fileVO.getUploadName(), StandardCharsets.UTF_8);
//        // 파일 다운로드를 위한 HTTP 응답 헤더를 설정합니다.
//        HttpHeaders headers = new HttpHeaders();
//        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + encodedFileName + "\"");
//        headers.setContentLength(fileVO.getFileSize());
//        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//
//        return ResponseEntity.ok()
//                .headers(headers)
//                .contentLength(fileVO.getFileSize())
//                .contentType(MediaType.APPLICATION_OCTET_STREAM)
//                .body(resource);
//    }
}

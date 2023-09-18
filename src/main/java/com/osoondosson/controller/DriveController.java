package com.osoondosson.controller;


import com.osoondosson.dao.FileDAO;
import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.service.FileServiceImpl;
import com.osoondosson.service.S3FileService;
import com.osoondosson.service.UserService;
import com.osoondosson.vo.FileVO;
import com.osoondosson.vo.UploadResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;
import software.amazon.awssdk.services.s3.model.Redirect;

import java.io.InputStream;
import java.nio.ByteBuffer;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@Controller
public class DriveController {

    @Autowired
    private FileServiceImpl fileService;

    @Autowired
    private FileDAO fileDAO;

    @Autowired
    private S3Client s3Client;

    @Autowired
    private S3FileService s3FileService;

    // 파일 업로드 처리
    @PostMapping("/teacher/dataSharingRoom/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, Authentication authentication) {

        CustomUserDetail detail = (CustomUserDetail) authentication.getPrincipal();
        int groupSeq = detail.getGroupSeq();
        log.error(groupSeq+ " ");

        long fileSize = file.getSize();
        ByteBuffer buffer = ByteBuffer.allocate(Long.BYTES);
        buffer.putLong(fileSize);
        byte[] bytes = buffer.array();

        String uuid = UUID.randomUUID().toString();
        // 새로운 파일명 생성 (UUID 추가)
        String newFilename = uuid + "_" + file.getOriginalFilename();
        // 각 사용자의 ID에 해당하는 서브 디렉토리에 파일이 저장되도록 키 값을 설정합니다.
        String objectKey = "dataSharing/" + groupSeq + "/" + newFilename; // 나중에 userId가 아닌 groupName으로
        String url = "https://osdsbucket.s3.amazonaws.com/" + objectKey;

        // 업로드된 파일 정보 추출
        FileVO fileVO = new FileVO();

        if (!file.isEmpty()) {
            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket("osdsbucket")
                    .key(objectKey)
                    .build();

        // TODO s3FileService.uploadFile() 사용하게 바꾸기
            try (InputStream is = file.getInputStream()) {
                PutObjectResponse response = s3Client.putObject(putObjectRequest, RequestBody.fromInputStream(is, file.getSize()));
                if (response.sdkHttpResponse().isSuccessful()) {
                    fileVO.setUuid(uuid);
                    fileVO.setOriginName(file.getOriginalFilename());
                    fileVO.setUploadName(newFilename);
                    fileVO.setUploadPath(objectKey);
                    fileVO.setFileSize(file.getSize());
                    fileVO.setFileType(file.getContentType());
                    fileVO.setUploadDate(new Date());
                    fileVO.setGroupSeq(groupSeq);

                    System.out.println("파일 업로드 : " + fileVO);
                    fileService.uploadDrive(fileVO);
                    // 업로드된 파일을 저장하거나 원하는 작업 수행
                    // 예: 파일 시스템에 저장하거나 데이터베이스에 저장
                }


            } catch (Exception e) {
                throw new RuntimeException("Error occurred while uploading file", e);
            }
        }
        return "redirect:/teacher/dataSharingRoom";
    }


    @GetMapping("/teacher/dataSharingRoom")
    public String listDriveFiles(Model model, Authentication auth) {
        CustomUserDetail detail = (CustomUserDetail) auth.getPrincipal();
        int groupSeq = detail.getGroupSeq();

        // Java 코드에서 두 개의 목록 결합
        List<FileVO> list = fileService.selectFile(groupSeq); // 첫 번째 목록
        log.error(list + " ");

        model.addAttribute("getName", detail.getName());
        model.addAttribute("list", list);
        //model.addAttribute("contentType", fileExtensionList);
        return "teacher/dataSharingRoom";
    }

    @PostMapping("/teacher/dataSharingRoom")
    @ResponseBody
    public ResponseEntity<Map> listDriveFiles(Model model, Authentication auth,Map<String,Object> map) {
        CustomUserDetail detail = (CustomUserDetail) auth.getPrincipal();
        int groupSeq = detail.getGroupSeq();

        // Java 코드에서 두 개의 목록 결합
        List<FileVO> list = fileService.selectFile(groupSeq); // 첫 번째 목록
        log.error(list + " ");

        //model.addAttribute("getName", detail.getName());
        //model.addAttribute("list", list);
        //model.addAttribute("contentType", fileExtensionList);
        map.put("list", list);
        return ResponseEntity.ok().body(map);
    }

    // 파일 삭제
    @PostMapping("/teacher/dataSharingRoom/delete")
    @ResponseBody
    public ResponseEntity<UploadResponse> deleteFile(@org.springframework.web.bind.annotation.RequestBody Map<String, String> formData, Principal principal) {
        log.error(formData.get("uuid"));
        // 각 사용자의 ID에 해당하는 서브 디렉토리에 파일이 저장되도록 키 값을 설정합니다.
        String objectKey = "dataSharing/" + principal.getName() + "/" + formData.get("uploadName"); // 나중에 userId가 아닌 groupName으로
        String url = "https://osdsbucket.s3.amazonaws.com/" + objectKey;
        FileVO vo = new FileVO();
        vo.setUuid(formData.get("uuid"));
        // obj userId
        // UUID를 사용하여 S3에서 파일 삭제
        if (s3FileService.deleteFile2(objectKey)) {
            fileDAO.deleteImage(vo);
        }
        return ResponseEntity.ok(new UploadResponse("success", "성공했어요!"));
    }

    @PostMapping("/teacher/dataSharingRoom/createFolder")
    @ResponseBody
    public ResponseEntity<UploadResponse> createFolder(@org.springframework.web.bind.annotation.RequestBody String folderName, Authentication auth) {
        CustomUserDetail detail = (CustomUserDetail) auth.getPrincipal();
        String filePath = "dataSharing/" + detail.getGroupSeq() + "/" + folderName + "/";
        FileVO fileVO = new FileVO();
        fileVO.setUuid(String.valueOf(UUID.randomUUID()));
        fileVO.setOriginName(folderName);
        fileVO.setFileType("folder");
        fileVO.setUploadPath(filePath);
        fileVO.setGroupSeq(detail.getGroupSeq());
        if (fileService.isFolder(filePath) > 0) {
            return ResponseEntity.ok(new UploadResponse("fail", "폴더 생성 실패"));
        } else{
            fileService.uploadDrive(fileVO);
            return ResponseEntity.ok(new UploadResponse("success", "폴더 생성"));
        }
    }
}

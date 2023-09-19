package com.osoondosson.service;

import java.io.InputStream;
import java.util.UUID;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.osoondosson.dao.FileDAO;
import com.osoondosson.dao.user.UserDAO;
import com.osoondosson.vo.FileVO;
import com.osoondosson.vo.UserVO;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.DeleteObjectResponse;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;

@Service
@Slf4j
public class S3FileService {

    private final S3Client s3Client;

    @Autowired
    public S3FileService(S3Client s3Client) {
        this.s3Client = s3Client;
    }

    @Autowired
    private FileDAO fileDAO;

    @Autowired
    private UserDAO userDAO;

    public String uploadFile(MultipartFile file) {

        if (file.isEmpty()) {
            throw new IllegalArgumentException("Empty file provided");
        }
        PutObjectRequest putObjectRequest = PutObjectRequest.builder().bucket("osdsbucket")
                .key(file.getOriginalFilename()).build();

        try (InputStream is = file.getInputStream()) {
            PutObjectResponse response = s3Client.putObject(putObjectRequest,
                    RequestBody.fromInputStream(is, file.getSize()));
            if (response.sdkHttpResponse().isSuccessful()) {
                return "https://osdsbucket.s3.amazonaws.com/" + file.getOriginalFilename();
                /* return "File uploaded successfully"; */
            } else {
                return "Error occurred while uploading file";
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while uploading file", e);
        }
    }

    public String uploadFile2(MultipartFile file, String userId) {

        if (file.isEmpty()) {
            throw new IllegalArgumentException("Empty file provided");
        }

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        userId = authentication.getName();

        // UUID 생성
        String uuid = UUID.randomUUID().toString();

        // 새로운 파일명 생성 (UUID 추가)
        String newFilename = uuid + "_" + file.getOriginalFilename();
        // 각 사용자의 ID에 해당하는 서브 디렉토리에 파일이 저장되도록 키 값을 설정합니다.
        String objectKey = "osds/" + userId + "/" + newFilename;
        String url = "https://osdsbucket.s3.amazonaws.com/" + objectKey;

        PutObjectRequest putObjectRequest = PutObjectRequest.builder().bucket("osdsbucket").key(objectKey).build();

        try (InputStream is = file.getInputStream()) {
            PutObjectResponse response = s3Client.putObject(putObjectRequest,
                    RequestBody.fromInputStream(is, file.getSize()));
            if (response.sdkHttpResponse().isSuccessful()) {
                FileVO vo = new FileVO();
                vo.setUuid(uuid);
                vo.setOriginName(file.getOriginalFilename());
                vo.setUploadName(newFilename);
                vo.setUploadPath(objectKey);
                vo.setFileSize(file.getSize());
                vo.setFileType(file.getContentType());

                UserVO userVO = new UserVO();
                userVO.setProfile(newFilename);
                userVO.setUserId(userId);

                fileDAO.insertImage(vo);
                userDAO.updateProfile(userVO);

                return url;

            } else {
                return "Error occurred while uploading file";
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while uploading file", e);
        }
    }

    public void deleteFile(UserVO vo) {
        try {
            // userService.findById(id) return UserVO memeber 모든값 profile userId
            // 사용자의 프로필 이미지 이름 가져오기
            String filename = vo.getProfile();

            String[] temp = filename.split("_");
            FileVO fileVO = new FileVO();
            fileVO.setUuid(temp[0]);
            // 파일이 없다면 에러 발생시키기
            if (filename == null || filename.isEmpty()) {
                throw new IllegalArgumentException("No file associated with this user");
            }

            // S3에서 삭제할 object key 생성하기
            String objectKey = "osds/" + vo.getUserId() + "/" + filename;
            String url = "https://osdsbucket.s3.amazonaws.com/" + objectKey;

            DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder().bucket("osdsbucket").key(objectKey)
                    .build();

            DeleteObjectResponse response = s3Client.deleteObject(deleteObjectRequest);


            if (response.sdkHttpResponse().isSuccessful()) {
                fileDAO.deleteImage(fileVO);
                vo.setProfile(null);
                userDAO.updateProfile(vo);
            } else {
                System.out.println("Error occurred while uploading file");
            }

        } catch (Exception e) {
            throw new RuntimeException("Error occurred while deleting file", e);
        }
    }

    public boolean deleteFile2(String filePath) {
        try {

            DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder().bucket("osdsbucket").key(filePath)
                    .build();

            DeleteObjectResponse response = s3Client.deleteObject(deleteObjectRequest);

            return response.sdkHttpResponse().isSuccessful();
        } catch (Exception e) {
            log.error(e.getMessage());
            return false;
        }
    }
}
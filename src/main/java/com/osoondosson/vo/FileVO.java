package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileVO {
    private String UUID; // 고유키
    private String originName; // 원본명
    private String uploadName; // 업로드명
    private String uploadPath; // 업로드 경로
    private byte[] fileSize; // 파일크기
    private String fileType; // 파일타입
    private Date uploadDate; // 업로드 일시
}

package com.osoondosson.service;

import com.osoondosson.vo.FileVO;
import org.springframework.core.io.Resource;

import java.util.HashMap;
import java.util.List;

public interface FileService {

    void uploadDrive(FileVO fileVO);

    List<FileVO> selectFile(int groupSeq);

    FileVO getFileByUUID(String uuid);

    //Resource loadFileAsResource(HashMap map);
}

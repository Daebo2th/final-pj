package com.osoondosson.dao;

import com.osoondosson.vo.FileVO;

import java.util.List;

public interface FileDAO {
    void uploadDrive(FileVO fileVO);

    List<FileVO> selectFile(int groupSeq);

    FileVO getFileByUUID(String uuid);
}

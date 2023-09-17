package com.osoondosson.dao;

import com.osoondosson.vo.FileVO;


import java.util.List;

public interface FileDAO {
    void uploadDrive(FileVO fileVO);

    List<FileVO> selectFile(int groupSeq);

    List<FileVO> getPathBySeq(int groupSeq);

    int isFolder(String fileType);

    FileVO getFileByUUID(String uuid);
    public void insertImage(FileVO vo);
    public void deleteImage(FileVO vo);
}

package com.osoondosson.service;

import com.osoondosson.dao.FileDAO;
import com.osoondosson.vo.FileVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

@Service
public class FileServiceImpl implements FileService{

    @Autowired
    private FileDAO fileDAO;

    @Override
    public void uploadDrive(FileVO fileVO) {
        fileDAO.uploadDrive(fileVO);
    }

    @Override
    public List<FileVO> selectFile(int groupSeq) {
        return fileDAO.selectFile(groupSeq);
    }

    @Override
    public FileVO getFileByUUID(String uuid) {
        return fileDAO.getFileByUUID(uuid);
    }


}

package com.osoondosson.service;

import com.osoondosson.dao.FileDAO;
import com.osoondosson.vo.FileVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class FileServiceImpl implements FileService{

    @Autowired
    private FileDAO fileDAO;

    @Override
    public void uploadDrive(FileVO fileVO) { // 자료공유실 파일 업로드
        fileDAO.uploadDrive(fileVO);
    }

    @Override
    public List<FileVO> selectFile(int groupSeq) { //자료 공윺실 파일 리스트 출력
        return fileDAO.selectFile(groupSeq);
    }

    @Override
    public FileVO getFileByUUID(String uuid) { // 
        return fileDAO.getFileByUUID(uuid);
    }

    @Override
    public int isFolder(String fileType) { // 폴더인지 파일인지 유무 파악
        return fileDAO.isFolder(fileType);
    }


}

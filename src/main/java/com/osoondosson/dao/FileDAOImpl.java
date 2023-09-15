package com.osoondosson.dao;

import com.osoondosson.vo.FileVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FileDAOImpl implements FileDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void uploadDrive(FileVO fileVO) {
        sqlSession.insert("uploadDrive", fileVO);
    }

    @Override
    public List<FileVO> selectFile(int groupSeq) {
        return sqlSession.selectList("selectFile", groupSeq);
    }

    @Override
    public FileVO getFileByUUID(String uuid) {
        return sqlSession.selectOne("getFileByUUID",uuid);
    }
}

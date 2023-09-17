package com.osoondosson.dao;


import com.osoondosson.vo.FileVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class FileDAOImpl implements FileDAO{

    @Autowired
    private SqlSession sqlSession;
    
	@Autowired
	private SqlSessionTemplate mybatis;

    @Override
    public void uploadDrive(FileVO fileVO) {
        sqlSession.insert("uploadDrive", fileVO);
    }

    @Override
    public List<FileVO> selectFile(int groupSeq) {
        return sqlSession.selectList("selectFile", groupSeq);
    }

    @Override
    public int isFolder(String fileType) {
        return sqlSession.selectOne("isFolder", fileType);
    }

    @Override
    public FileVO getFileByUUID(String uuid) {
        return sqlSession.selectOne("getFileByUUID",uuid);
    }

	@Override
	public void insertImage(FileVO vo) {
		System.out.println("==> mybatis insertImage() 호출 ");
		mybatis.insert("insertImage", vo);
	}

	@Override
	public void deleteImage(FileVO vo) {
		System.out.println("==> mybatis deleteImage() 호출 ");
		mybatis.delete("deleteImage", vo);
	}

    @Override
    public List<FileVO> getPathBySeq(int groupSeq) {
        return sqlSession.selectList("getPathBySeq", groupSeq);
    }


}

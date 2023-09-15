package com.osoondosson.dao;

import com.osoondosson.vo.ReplyVO;
import com.osoondosson.vo.TaskVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("replyDAO")
public class ReplyDAOImpl implements ReplyDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertReply(ReplyVO vo) {
       sqlSession.insert("insertReply", vo);
    }

    @Override
    public List<TaskVO> getReplyList(int taskSeq) {
        return sqlSession.selectList("getReplyList", taskSeq);
    }
}

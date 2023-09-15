package com.osoondosson.service;

import com.osoondosson.dao.ReplyDAO;
import com.osoondosson.dao.ReplyDAOImpl;
import com.osoondosson.vo.ReplyVO;
import com.osoondosson.vo.TaskVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{

    @Autowired
    private ReplyDAOImpl replyDAO;


    @Override
    public void insertReply(ReplyVO vo) {
        replyDAO.insertReply(vo);
    }

    @Override
    public List<TaskVO> getReplyList(int taskSeq) {
        return replyDAO.getReplyList(taskSeq);
    }

    @Override
    public void deleteReply(int replySeq) {
        replyDAO.deleteReply(replySeq);
    }
}

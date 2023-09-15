package com.osoondosson.dao;

import com.osoondosson.vo.ReplyVO;
import com.osoondosson.vo.TaskVO;

import java.util.List;

public interface ReplyDAO {
    void insertReply(ReplyVO vo);

    List<TaskVO> getReplyList(int taskSeq);

    void deleteReply(int replySeq);
}

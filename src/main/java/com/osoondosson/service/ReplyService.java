package com.osoondosson.service;

import com.osoondosson.vo.ReplyVO;
import com.osoondosson.vo.TaskVO;

import java.util.List;

public interface ReplyService {
    void insertReply(ReplyVO vo);

    List<TaskVO> getReplyList(int taskSeq);
}

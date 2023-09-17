package com.osoondosson.dao;

import com.osoondosson.vo.TaskVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface TaskDAO {
    public void insertTask(TaskVO vo);

    TaskVO getDetailTask(TaskVO vo );

    List<TaskVO> getTaskUserList(HashMap map);

    List<TaskVO> getTaskList(HashMap map);

    public void updateTask(TaskVO vo);

    void deleteTask(int taskSeq);

    /*교직원*/
    List<TaskVO> getTaskGroupSeq(HashMap map);

    public void updateStatus(TaskVO vo);

}

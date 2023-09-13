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
}

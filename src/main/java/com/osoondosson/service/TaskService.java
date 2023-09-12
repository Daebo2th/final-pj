package com.osoondosson.service;

import com.osoondosson.vo.TaskVO;

import java.util.HashMap;
import java.util.List;

public interface TaskService {


     void insertTask(TaskVO vo);

     TaskVO getDetailTask(TaskVO vo);

     List<TaskVO> getTaskUserList(HashMap map);

     List<TaskVO> getTaskList(HashMap map);
}

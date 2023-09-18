package com.osoondosson.service;

import com.osoondosson.vo.ClassVO;
import com.osoondosson.vo.TaskVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface TaskService {
     /*학생 */
     void insertTask(TaskVO vo);

     TaskVO getDetailTask(TaskVO vo);

     List<TaskVO> getTaskUserList(HashMap map);

     List<TaskVO> getTaskList(HashMap map);

     void UpdateTask(TaskVO vo);

     void deleteTask(int taskSeq);

     /*교직원*/
     List<TaskVO> getTaskGroupSeq(HashMap map);

     void updateStatus(TaskVO vo);

     /*그룹 정보 가져오기*/
     ClassVO getGroupInfoBygroupSeq(int groupSeq);

     int countTasks(String userId);

     int countGroupSeqTasks(int groupSeq);

     /*페이지처리*/



}

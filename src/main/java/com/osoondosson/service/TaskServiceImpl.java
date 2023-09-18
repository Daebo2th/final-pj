package com.osoondosson.service;

import com.osoondosson.dao.TaskDAO;
import com.osoondosson.dao.TaskDAOImpl;
import com.osoondosson.vo.ClassVO;
import com.osoondosson.vo.PagingVO;
import com.osoondosson.vo.TaskVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("taskService")
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskDAO taskDAO;
    /*학생*/
    @Override
    public void insertTask(TaskVO vo) {
/*      Map<String, Object> map = new HashMap<>();
        map.put("author", vo.getAuthor());
        map.put("title", vo.getTitle());
        map.put("content", vo.getContent());*/

        taskDAO.insertTask(vo);
    }

    @Override
    public TaskVO getDetailTask(TaskVO vo) {
        System.out.println("service 까지 옴 ");
        return taskDAO.getDetailTask(vo);
    }

    @Override
    public List<TaskVO> getTaskUserList(HashMap map) {
        List<TaskVO> taskUserList = taskDAO.getTaskUserList(map);

        // rownum 값 설정
        int start= (int) map.get("start");
        for (int i=0; i<taskUserList.size(); i++) {
            TaskVO task=taskUserList.get(i);
            int rownum=start+i;
            task.setRownum(rownum);
        }
        return taskUserList;
    }

    @Override
    public List<TaskVO> getTaskList(HashMap map) {

        return taskDAO.getTaskList(map);
    }

    @Override
    public void UpdateTask(TaskVO vo) {
        taskDAO.updateTask(vo);
    }

    @Override
    public void deleteTask(int taskSeq) {
        taskDAO.deleteTask(taskSeq);
    }

    /*교직원 학생목록 count */
    @Override
    public List<TaskVO> getTaskGroupSeq(HashMap map) {
        List<TaskVO> groupTasks =taskDAO.getTaskGroupSeq(map);
        // rownum 값 설정
        int start= (int) map.get("start");
        for (int i=0; i<groupTasks.size(); i++) {
            TaskVO task=groupTasks.get(i);
            int rownum=start+i;
            task.setRownum(rownum);
        }
        return groupTasks;
    }

    @Override
    public void updateStatus(TaskVO vo) {
        taskDAO.updateStatus(vo);
    }

    @Override
    public ClassVO getGroupInfoBygroupSeq(int groupSeq) {
      return taskDAO.getGroupInfoBygroupSeq(groupSeq);
    }

    /*교사*/
    @Override
    public int countTasks(String userId) {
        return taskDAO.countTasks(userId);
    }

    /*교직원*/
    @Override
    public int countGroupSeqTasks(int groupSeq) {
        return taskDAO.countGroupSeqTasks(groupSeq);
    }

}

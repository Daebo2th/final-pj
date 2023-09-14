package com.osoondosson.service;

import com.osoondosson.dao.TaskDAOImpl;
import com.osoondosson.vo.TaskVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service("taskService")
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskDAOImpl taskDAO;
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
        System.out.println("UserList service 까지 옴 ");

        return taskDAO.getTaskUserList(map);
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

    /*교직원*/
    @Override
    public List<TaskVO> getTaskGroupSeq(String groupSeq) {
        return taskDAO.getTaskGroupSeq(groupSeq);
    }
}

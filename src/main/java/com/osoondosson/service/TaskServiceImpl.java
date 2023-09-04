package com.osoondosson.service;

import com.osoondosson.dao.TaskDAO;
import com.osoondosson.dao.TaskDAOImpl;
import com.osoondosson.vo.TaskVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.config.Task;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("taskService")
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskDAOImpl taskDAO;
    @Override
    public void insertTask(TaskVO vo) {
/*      Map<String, Object> map = new HashMap<>();
        map.put("author", vo.getAuthor());
        map.put("title", vo.getTitle());
        map.put("content", vo.getContent());*/

        taskDAO.insertTask(vo);
    }
}

package com.snailxr.base.task.dao;
import java.util.List;

import com.snailxr.base.task.domain.ScheduleJob;
/**
* @File    ScheduleJobMapper.java
* @author  ShieldofZues 
* @Date    create by 17:57  2017/10/27 0027
* @Description 
* @Method  
* @param   
* @return  
*
*/
public interface ScheduleJobMapper {
	int deleteByPrimaryKey(Long jobId);

	int insert(ScheduleJob record);

	int insertSelective(ScheduleJob record);

	ScheduleJob selectByPrimaryKey(Long jobId);

	int updateByPrimaryKeySelective(ScheduleJob record);

	int updateByPrimaryKey(ScheduleJob record);

	List<ScheduleJob> getAll();
}
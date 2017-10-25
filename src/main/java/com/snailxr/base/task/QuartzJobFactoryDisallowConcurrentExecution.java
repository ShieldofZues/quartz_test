package com.snailxr.base.task;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.snailxr.base.task.domain.ScheduleJob;

/**
* @File    QuartzJobFactoryDisallowConcurrentExecution.java
* @author  ShieldofZues
* @Date    create by 9:57  2017/10/23 0023
* @Description  若一个方法一次执行不完下次轮转时则等待改方法执行完后才执行下一次操作
* @Method
* @param
* @return
*
*/
@DisallowConcurrentExecution
public class QuartzJobFactoryDisallowConcurrentExecution implements Job {
	public final Logger log = Logger.getLogger(this.getClass());

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		ScheduleJob scheduleJob = (ScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
		TaskUtils.invokMethod(scheduleJob);

	}
}
package com.snailxr.base.task;

import java.nio.charset.Charset;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
/**
* @File    TaskTest.java
* @author  ShieldofZues 
* @Date    create by 9:58  2017/10/23 0023
* @Description 
* @Method  
* @param   
* @return  
*
*/
@Component
public class TaskTest {
	public final Logger log = Logger.getLogger(this.getClass());
 
	public void run() {
		for (int i = 0; i < 1; i++) {
			log.debug(i+" run.........777777..............." + (new Date()));
		}

	}

	public void run1() {
		for (int i = 0; i < 1; i++) {
			log.debug(i+" run1......66666............" + (new Date()));
		}
	}
	
	public static void main(String[] args) {
		String c=null;
	    Map<String, Charset> charsets = Charset.availableCharsets();
	    for (Map.Entry<String, Charset> entry : charsets.entrySet()) {
	       System.out.println(entry.getKey());
	    }

	}
}

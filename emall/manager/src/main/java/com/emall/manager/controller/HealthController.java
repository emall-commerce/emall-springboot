package com.emall.manager.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <consul health 检查>
 * 健康检查
 * @author win7
 *
 */ 
@RestController
@RequestMapping(value = "/") 
public class HealthController {
	 @GetMapping("/health")
	    public String health(){
	        return "health"; 
   }
 
}

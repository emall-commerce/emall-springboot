package com.emall.wap.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: xiaobin
 * @Date: 2019/8/13 19:58
 * @Desc: 这是一个测试类
 */
@RestController
@RequestMapping ("hello")
public class HelloController {

    @GetMapping("/say")
    public String sayHelloWorld(@RequestParam String name){
        return  "hello " + name;
    }
}

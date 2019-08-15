package com.emall.wap.controller;


import lombok.extern.slf4j.Slf4j;
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
@RequestMapping("hello")
@Slf4j
public class HelloController {

    @GetMapping("/say")
    public String sayHelloWorld(@RequestParam String name) {
      log.error("测试error log【{}】", name);
      log.info("测试info log【{}】", name);
        return "hello " + name;
    }
}

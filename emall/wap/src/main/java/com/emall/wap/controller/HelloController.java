package com.emall.wap.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class HelloController {
    Logger logger = LoggerFactory.getLogger(HelloController.class);

    @GetMapping("/say")
    public String sayHelloWorld(@RequestParam String name) {
        logger.info("测试日志【{}】", name);
        logger.error("测试错误日志【{}】", name);
        return "hello " + name;
    }
}

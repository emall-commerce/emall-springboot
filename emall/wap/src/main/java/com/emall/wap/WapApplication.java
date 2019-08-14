package com.emall.wap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;


/**
 * <手机端交互使用>
 */
@SpringBootApplication
@EnableDiscoveryClient
public class WapApplication {
    public static void main(String[] args) {
        SpringApplication.run(WapApplication.class, args);
    }
}

package com.emall.pc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;


/**
 * <PC端交互使用--冗余>
 */
@SpringBootApplication
@EnableDiscoveryClient
public class ThirdpartApplication {
    public static void main(String[] args) {
        SpringApplication.run(ThirdpartApplication.class, args);
    }
}

package com.emall.pc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;


/**
 * <PC端交互使用--冗余>
 */
@SpringBootApplication
@EnableDiscoveryClient
public class PcApplication {
    public static void main(String[] args) {
        SpringApplication.run(PcApplication.class, args);
    }
}

package com.woniu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.woniu.mapper")
@SpringBootApplication
public class SpringBootMain {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMain.class, args);
	}
}

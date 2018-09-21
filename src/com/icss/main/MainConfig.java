package com.icss.main;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

//组件加载
//@Configuration//声明启动spring容器，作用相当于applicationContext.xml 先加载 事务管理
@EnableWebMvc//用于启动springMVC
@ComponentScan(basePackages={"com.icss.controller","com.icss.service"})//定义扫描组件的位置；默认扫描**/**.class,可以指定base-package
//@ComponentScan(basePackages={"com.icss.controller"})
public class MainConfig {//springservlet.xml
	@Bean//将函数的返回值（对象），声明为spring容器中的Bean
	public UrlBasedViewResolver viewResolver(){
		UrlBasedViewResolver rsl = new UrlBasedViewResolver();
		rsl.setViewClass(JstlView.class);
		rsl.setPrefix("/");
		rsl.setSuffix(".jsp");
		return rsl;
	}
	
	@Bean(name="multipartResolver")//文件上传
	public CommonsMultipartResolver multipartFileResolver(){
		CommonsMultipartResolver mprsl = new CommonsMultipartResolver();
		mprsl.setMaxUploadSize(1024L*1024L*10L);//10M
		return mprsl;
	}
}













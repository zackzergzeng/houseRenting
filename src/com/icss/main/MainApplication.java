package com.icss.main;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class MainApplication implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext context) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("start--------------------");
		AnnotationConfigWebApplicationContext act = new AnnotationConfigWebApplicationContext();
		act.setServletContext(context);
		act.register(MainConfig.class,DbConfig.class);
		Dynamic servlet = context.addServlet("spring", new DispatcherServlet(act));
		servlet.addMapping("*.do");
		servlet.setLoadOnStartup(1);
		
		javax.servlet.FilterRegistration.Dynamic filter = context.addFilter("utf8", new MyFilter());
		filter.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), false, "/*");
		
	}

}

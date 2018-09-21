package com.icss.main;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration//声明启动spring容器，作用相当于applicationContext.xml 先加载 事务管理
@MapperScan(basePackages={"com.icss.dao"})//包的扫描
@ComponentScan("com.icss.service")
@EnableTransactionManagement//启动注解事务
public class DbConfig {
	public DataSource dataSource() throws Exception{
		ComboPooledDataSource pool = new ComboPooledDataSource();
		pool.setJdbcUrl("jdbc:mysql://localhost:3306/houserenting?characterEncoding=utf-8");
		pool.setUser("root");
		pool.setDriverClass("com.mysql.jdbc.Driver");
		pool.setPassword("123");
		pool.setMaxPoolSize(50);
		pool.setMinPoolSize(1);
		return pool;
	}
	
	@Bean
	public SqlSessionFactory sessionFactory() throws Exception{
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(this.dataSource());
		//延迟加载
		PathMatchingResourcePatternResolver rs = new PathMatchingResourcePatternResolver();
//		factoryBean.setConfigLocation(rs.getResource("classpath:mybatis-cfg.xml"));
		//
		return factoryBean.getObject();
	}
	
	@Bean//事务管理器
	public PlatformTransactionManager transactionManager() throws Exception{
		DataSourceTransactionManager txm = new DataSourceTransactionManager(this.dataSource());
		return txm;
	}
}

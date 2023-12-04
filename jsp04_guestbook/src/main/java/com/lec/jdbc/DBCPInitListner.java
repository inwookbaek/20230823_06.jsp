package com.lec.jdbc;

import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.w3c.dom.ranges.RangeException;

public class DBCPInitListner implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		String poolConfig = sce.getServletContext().getInitParameter("poolConfig");
		Properties prop = new Properties();
		try {
			prop.load(new StringReader(poolConfig));
		} catch (Exception e) {
			throw new RuntimeException("Config Data Load 실패!!");
		}
		
		loadJDBCDriver(prop);
		initConnection(prop);
	}

	private void loadJDBCDriver(Properties prop) {
		String driverClass = prop.getProperty("jdbcdriver");
		try {
			Class.forName(driverClass);
			System.out.println(driverClass);
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로딩 실패!!!");
		}		
	}

	private void initConnection(Properties prop) {
		String url = prop.getProperty("url");
		String usr = prop.getProperty("usr");
		String pwd = prop.getProperty("pwd");	
		
		ConnectionFactory connFactory = new DriverManagerConnectionFactory(url, usr, pwd);
		PoolableConnectionFactory poolFactory = new PoolableConnectionFactory(connFactory, null);
		poolFactory.setValidationQuery("select 1");  // 커넥션유효성검사 - (mariadb or mysql)

		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L); // 사용가능한 커넥션 검사 주기
		poolConfig.setTestWhileIdle(true); // 풀에 보관중인 커넥션 유효여부 검사
		poolConfig.setMinIdle(5);   // 커넥션 최소갯수
		poolConfig.setMaxTotal(10); // 커넥션 최대 갯수
		
		GenericObjectPool<PoolableConnection> connPool = new GenericObjectPool<>(poolFactory, poolConfig);
		poolFactory.setPool(connPool);  // 생성한 커넥션을 연결

		try {
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			String poolName = prop.getProperty("poolName");
			driver.registerPool(poolName, connPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}		
	}
}

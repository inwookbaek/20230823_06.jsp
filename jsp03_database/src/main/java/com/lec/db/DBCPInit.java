package com.lec.db;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {
	
	@Override
	public void init() throws ServletException{
		// System.out.println("1. init()");
		loadJDBCDriver();
		initConnectionPool();
	}

	private void loadJDBCDriver() {
		String driverClass = getInitParameter("jdbcdriver");
		try {
			Class.forName(driverClass);
			System.out.println(driverClass);
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로딩 실패!!!");
		}
	}

	private void initConnectionPool() {
		String url = getInitParameter("jdbcUrl");
		String usr = getInitParameter("dbUser");
		String pwd = getInitParameter("dbPass");
		
		System.out.println(url);
		System.out.println(usr);
		System.out.println(pwd);
		
		ConnectionFactory connFactory = new DriverManagerConnectionFactory(url, usr, pwd);
		PoolableConnectionFactory poolFactory = new PoolableConnectionFactory(connFactory, null);
		poolFactory.setValidationQuery("select 1");  // 커넥션유효성검사 - (mariadb or mysql)
		// poolFactory.setValidationQuery("select * from dual"); // 오라클일 경우 커넥션유효성 검사
		
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
			String poolName = getInitParameter("poolName");
			driver.registerPool(poolName, connPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
 	}
}
















package com.etc.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.stereotype.Repository;

@Repository("etcRepositoryDao42")
public class EtcRepositoryDao42 {

//	private JdbcTemplate jdbcTemplate;
	 private JdbcTemplate jdbcTemplate2;

	protected Logger logger = LoggerFactory.getLogger(getClass());
	private static String JDBCDriver = "com.cloudera.impala.jdbc4.Driver";
	// Define a string as the connection URL
	private static final String CONNECTION_URL = "jdbc:impala://140.128.101.178:21050";

	@Autowired
	@Qualifier("postgresDataSource")
	public void setDataSource(SimpleDriverDataSource dataSource) {
		this.jdbcTemplate2 = new JdbcTemplate(dataSource);
	}

	// @Autowired
	// @Qualifier("impalaDataSource")
	// public void setDataSource(SimpleDriverDataSource dataSource) {
	// this.jdbcTemplate = new JdbcTemplate(dataSource);
	// }

//	public JdbcTemplate getJdbcTemplate() {
//		return jdbcTemplate;
//	}

	 public JdbcTemplate getJdbcTemplate2() {
	 return jdbcTemplate2;
	 }

//	GET THE SHORTEST ROAD
	public String getShortestRoad() {
		String sql = " select * from etc_data.No2_s7 ";
		Statement stmt = null;
		ResultSet rs = null;
		Connection con = null;

		try {
			Class.forName(JDBCDriver);
			con = DriverManager.getConnection(CONNECTION_URL);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				System.out.println(rs.getString(1));
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return "";
	}

}

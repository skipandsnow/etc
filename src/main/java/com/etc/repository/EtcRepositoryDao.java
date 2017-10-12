package com.etc.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etc.model.DetectedStation;
import com.etc.model.Highway;
import com.etc.model.HighwayMeta;
import com.sun.javafx.collections.MappingChange.Map;

@Repository("etcRepositoryDao")
public class EtcRepositoryDao {
	public String city;
	private JdbcTemplate jdbcTemplate;
	// private JdbcTemplate jdbcTemplate2;

	protected Logger logger = LoggerFactory.getLogger(getClass());
	private static String JDBCDriver = "com.cloudera.impala.jdbc4.Driver";
	// Define a string as the connection URL
	private static final String CONNECTION_URL = "jdbc:impala://140.128.101.178:21050";

	@Autowired
	@Qualifier("postgresDataSource")
	public void setDataSource(SimpleDriverDataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// @Autowired
	// @Qualifier("impalaDataSource")
	// public void setDataSource(SimpleDriverDataSource dataSource) {
	// this.jdbcTemplate = new JdbcTemplate(dataSource);
	// }

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	// public JdbcTemplate getJdbcTemplate2() {
	// return jdbcTemplate2;
	// }

	public List<DetectedStation> getDetectedStations() {
		String sql = " select gantryfrom, gantryfrom_zh, gantryto, gantryto_zh from detect_station_main";
		List<DetectedStation> detectedStationList = jdbcTemplate.query(sql.toString(),
				new RowMapper<DetectedStation>() {
					public DetectedStation mapRow(ResultSet rs, int rowNum) throws SQLException {
						DetectedStation detectedStation = new DetectedStation();
						detectedStation.setGantryfrom_id(rs.getString("gantryfrom"));
						detectedStation.setGantryfrom_zh(rs.getString("gantryfrom_zh"));
						detectedStation.setGantryto_id(rs.getString("gantryto"));
						detectedStation.setGantryto_zh(rs.getString("gantryto_zh"));
						return detectedStation;
					}
				});
		return detectedStationList;
	}

	public ArrayList<Highway> getEtcHistoryData(HighwayMeta highwayMeta) {
		String sql = "select etc_date, hour, highwayid, highway_caramount, highway_spacemeanspeed from etc_data.highway_metadata where "
				+ "order by highwayid, etc_date";
		Statement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Highway> highwayList = new ArrayList<Highway>();
		try {
			Class.forName(JDBCDriver);
			con = DriverManager.getConnection(CONNECTION_URL);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Highway highway = new Highway();
				highway.setEtc_date(rs.getString("etc_date"));
				highway.setHighwayid(rs.getString("highwayid"));
				highway.setCaramount(rs.getInt("highway_caramount"));
				highway.setMeanspeed(rs.getDouble("highway_spacemeanspeed"));
				highwayList.add(highway);
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
		return highwayList;
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

//	GET THE City
	public List<String> getCity() {
		String sql = " select distinct city from etc_data.road_info";
		Statement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		List<String> city = new ArrayList<String>();
		try {
			Class.forName(JDBCDriver);
			con = DriverManager.getConnection(CONNECTION_URL);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				city.add(rs.getString(1));
//				System.out.println(rs.getString(1));
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
		return city;
	}

//	GET THE Area
	public List<String> getArea(String city) {
		String sql = " select distinct area,gantryname from etc_data.road_info where city = '"+city+"'";
		Statement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		List<String> area = new ArrayList<String>();
		try {
			Class.forName(JDBCDriver);
			con = DriverManager.getConnection(CONNECTION_URL);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				area.add(rs.getString(1));
//				System.out.println(rs.getString(1));
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
		return area;
	}
	
	/** For testing */
	public String getImpalaTables() {
		String sql = " select * from etc_data.dim_highway";
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

package com.etc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.stereotype.Repository;

import com.etc.model.DetectedStation;

@Repository("etcRepositoryDao")
public class EtcRepositoryDao {

	private JdbcTemplate jdbcTemplate;

	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	@Qualifier("postgresDataSource")
	public void setDataSource(SimpleDriverDataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	/**
	 * 取的所有獨立站點的資訊
	 * */
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

}

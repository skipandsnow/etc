package com.etc.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.etc.model.DetectedStation;
import com.etc.repository.EtcRepositoryDao;
import com.etc.service.EtcService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class EtcAction extends ActionSupport {
	private String jsonData;

	Gson gson = new Gson();

	@Autowired
	private EtcService etcService;

	@Autowired
	private EtcRepositoryDao etcRepositoryDao;
	
	public String execute() throws Exception {
		return "index";
	}

	public String toAnalysis1() {
		return "analysis1";
	}

	public String toAnalysis2() {
		return "analysis2";
	}

	public String toAnalysis3() {
		return "analysis3";
	}

	public String toTest() {
		return "test";
	}

	public String getShortestPath() {
		List<DetectedStation> detectedList = etcService.getShortestPath("", "");
		return gson.toJson(detectedList);
	}

	public String getDetectedStations() {
		List<DetectedStation> detectedList = etcService.getShortestPath("", "");
		jsonData = gson.toJson(detectedList);
		return "json";
	}
	public String getImpalaTables() {
		jsonData = gson.toJson(etcRepositoryDao.getImpalaTables());
		return "json";
	}
	public String getJsonData() {
		return jsonData;
	}

	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

}

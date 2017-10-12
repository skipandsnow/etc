package com.etc.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.etc.model.DetectedStation;
import com.etc.repository.EtcRepositoryDao;
import com.etc.repository.EtcRepositoryDao42;
import com.etc.service.EtcService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class EtcAction42 extends ActionSupport {
	private String jsonData;
	public String city;
	Gson gson = new Gson();

	@Autowired
	private EtcService etcService;

	@Autowired
	private EtcRepositoryDao42 etcRepositoryDao;
	
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
	
	public String getCity() {
		jsonData = gson.toJson(etcRepositoryDao.getCity());
		return "json";
	}
	public String getArea() {
		jsonData = gson.toJson(etcRepositoryDao.getArea(city));
		return "json";
	}
	
	public String getJsonData() {
		return jsonData;
	}

	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

}

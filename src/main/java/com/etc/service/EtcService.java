package com.etc.service;

import java.util.List;

import com.etc.model.DetectedStation;

public interface EtcService {
	public List<DetectedStation> getShortestPath(String start, String end);
}
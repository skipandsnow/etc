package com.etc.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etc.model.DetectedStation;
import com.etc.repository.EtcRepositoryDao;
import com.etc.service.EtcService;


@Service("etcService")
public class EtcServiceImpl implements EtcService {
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private EtcRepositoryDao etcRepositoryDao;

	@Override
	public List<DetectedStation> getShortestPath(String start, String end) {
		// TODO Auto-generated method stub
		List<DetectedStation> detectedStationList = etcRepositoryDao.getDetectedStations();
		for (DetectedStation ds : detectedStationList) {
			logger.info(ds.getGantryfrom_id() + "-->" + ds.getGantryfrom_zh());
		}
		return detectedStationList;
	}
}

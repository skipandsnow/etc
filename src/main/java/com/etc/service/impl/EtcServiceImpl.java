package com.etc.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
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
	
	private static HashMap<String, ArrayList<String>> gantryMap = null;
	private static int shortestPathLength = 0;
	private static List<List<String>> selectedRoutes = new ArrayList<List<String>>();

	@Override
	public List<DetectedStation> getShortestPath(String start, String end) {
		// TODO Auto-generated method stub
		List<DetectedStation> detectedStationList = etcRepositoryDao.getDetectedStations();
		for (DetectedStation ds : detectedStationList) {
			logger.info(ds.getGantryfrom_id() + "-->" + ds.getGantryfrom_zh());
		}
		return detectedStationList;
	}

	@Override
	public List<List<String>> getShortestRoute(String startGantry, String endGantry) {
		// TODO Auto-generated method stub
		if(gantryMap==null){
			gantryMap = etcRepositoryDao.getGantryMap();
		}
		logger.info("Gantry Map Size is "+gantryMap.size());
		logger.info("Load Gantry Finished. Start Searching Route.");
		selectedRoutes = new ArrayList<List<String>>();//reset results
		shortestPathLength=gantryMap.size();//reset Shortest Path to default
		ArrayList<String> routeArr = new ArrayList<String>();
		routeArr.add(startGantry);
		getRoute(routeArr, endGantry);
		logger.info("End Searching Route, found "+selectedRoutes+" routes.");
		return selectedRoutes;
	}
	
	public void getRoute(ArrayList<String> route, String endGantry) {

		if (gantryMap.containsKey(route.get(route.size() - 1))) {
			for (String tmpGantry : gantryMap.get(route.get(route.size() - 1))) {
				if (!tmpGantry.equals(endGantry)) {
					HashSet<String> tmpHighway = new HashSet<String>();  
					for (int i = 0; i < route.size(); i++) {
						tmpHighway.add(route.get(i).substring(0,3)+route.get(i).substring(route.get(i).length()-1,route.get(i).length()));
					}
					tmpHighway.remove(route.get(route.size()-1).substring(0,3)+route.get(route.size()-1).substring(route.get(route.size()-1).length()-1,route.get(route.size()-1).length()));
					/**如果有重複上道路就停止*/
					if(tmpHighway.size()>1 && tmpHighway.contains(tmpGantry.substring(0,3)+tmpGantry.substring(tmpGantry.length()-1,tmpGantry.length()))){					
						continue; 
					} 
					/** 複製List */
					ArrayList<String> tmpList = new ArrayList<String>();
					for (int i = 0; i < route.size(); i++) {
						tmpList.add(route.get(i));
					}
					tmpList.add(tmpGantry);
					/** 如果搜尋的超出限制就停止 */
					if (tmpList.size() < gantryMap.size()) {
						if(tmpList.size() < shortestPathLength-1){
							getRoute(tmpList, endGantry);	
						}
					}
				} else {
					int count = 0;
					ArrayList<String> tmpList = new ArrayList<String>();
					for (int i = 0; i < route.size(); i++) {
						tmpList.add(route.get(i));
					}
					tmpList.add(tmpGantry);
					shortestPathLength = tmpList.size();
					StringBuffer sb = new StringBuffer();
					for (String gantry : tmpList) {
						if (count != 0) {
							System.out.print("-->");
							sb.append("-->");
						}
						System.out.print(gantry);
						sb.append(gantry);
						count++;
					}
					selectedRoutes.add(tmpList);//將找到的路徑加入List
				}
			}

		}
	}
}

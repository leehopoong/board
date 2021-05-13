package ino.web.freeBoard.service;


import ino.web.freeBoard.dto.FreeBoardDto;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FreeBoardService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<FreeBoardDto> freeBoardList(Map<String, Object> map){
		
		return sqlSessionTemplate.selectList("freeBoardGetList", map);
	}
	
	public int listCount(Map<String,Object> map){
		return  sqlSessionTemplate.selectOne("listCount",map);
	}



	public Map<String,Object> freeBoardInsertPro(FreeBoardDto dto){
		
		Map<String,Object> map = new HashMap<>();
		try {
			sqlSessionTemplate.insert("freeBoardInsertPro",dto);
			map.put("result", "true");
			map.put("num", getNewNum());
		} catch (Exception e) {
			map.put("result", "false");
		}
		return map;
	}

	public FreeBoardDto getDetailByNum(int num){
		return sqlSessionTemplate.selectOne("freeBoardDetailByNum", num);
	}

	public int getNewNum(){
		return sqlSessionTemplate.selectOne("freeBoardNewNum");
	}

	public Map<String,Object> freeBoardModify(FreeBoardDto dto){
		Map<String,Object> map = new HashMap<>();
		try {
			sqlSessionTemplate.update("freeBoardModify", dto);
			map.put("result", "true");
			map.put("num", getNewNum());
		} catch (Exception e) {
			map.put("result", "false");
		}
		return map;
		
	}
	
	public Map<String,Object> FreeBoardDelete (int num) {
		Map<String,Object> map = new HashMap<>();
		try {
			sqlSessionTemplate.delete("freeBoardDelete", num);
			map.put("result", "true");
			map.put("num", getNewNum());
		} catch (Exception e) {
			map.put("result", "false");
		}
		return map;
		

	}
	public Map<String,Object> freeBoardDelete1 (Map<String,Object> fruitList) {
			Map<String,Object> map = new HashMap<>();
			try {
				sqlSessionTemplate.delete("freeBoardDelete1", fruitList);
				map.put("result", "true");

			} catch (Exception e) {
				map.put("result", "false");
			}
		return map;
	}
	
	public List<Map<String,Object>> CommCdList1 () {
//		Map<String,Object> map = new HashMap<>();
		
//		List<Map<String,Object>> Commcd1=sqlSessionTemplate.selectList("commonCdList1");
		return sqlSessionTemplate.selectList("commonCdList1");
//		map.put("commCd1", Commcd1);
//		map.put("Commcd2", Commcd2);
//	return map;
	

}
	public List<Map<String,Object>> CommCdList2 () {
//		Map<String,Object> map = new HashMap<>();
		
		return sqlSessionTemplate.selectList("commonCdList2");
//		List<Map<String,Object>> Commcd2 =sqlSessionTemplate.selectList("commonCdList2");
//		map.put("commCd1", Commcd1);
////		map.put("Commcd2", Commcd2);
//		return map;
		
		
	}

}

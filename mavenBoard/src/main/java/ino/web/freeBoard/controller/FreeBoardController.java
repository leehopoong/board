package ino.web.freeBoard.controller;


import ino.web.freeBoard.dto.FreeBoardDto;

import ino.web.freeBoard.dto.Pasing;
import ino.web.freeBoard.service.FreeBoardService;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeBoardService;
	@Autowired
	SqlSession sqlSession;
	@Autowired
	Pasing pasing;
	
	

	@RequestMapping("/main.ino")
	public ModelAndView main(Model model,HttpServletRequest request, FreeBoardDto dto,Map<String,Object> map1){
		int rowcount = freeBoardService.listCount(map1);
		int pagesize = 10;
		int page = 1;
		int startrow = ((page - 1) * pagesize);
		int endrow = (startrow + pagesize) ;
		int absPage = 1;
		if (rowcount % pagesize == 0) {
			absPage = 0;
		}
		int pagecount = rowcount / pagesize + absPage;
		int pages[] = new int[pagecount];
		for (int i = 0; i < pagecount; i++) {
			pages[i] = i + 1;
		}
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		map.put("startrow",startrow);
		map.put("endrow",endrow);
//		map.put("rowcount",rowcount);
//		map.put("pages",pages);
		List<FreeBoardDto> list = freeBoardService.freeBoardList(map);

		mav.setViewName("boardMain");
		mav.addObject("freeBoardList",list);
		mav.addObject("rowcount",rowcount);
		mav.addObject("pages",pages);
		
//		System.out.println(map);
//		model.addAttribute("rowcount",rowcount);
//		model.addAttribute("pages", pages);
		return mav;
	}
		

	@RequestMapping("/freeBoardInsert.ino")
	public String freeBoardInsert(){
		return "freeBoardInsert";
	}

	@RequestMapping("/freeBoardInsertPro.ino")
	@ResponseBody
	public Map<String,Object> freeBoardInsertPro(HttpServletRequest request,
			FreeBoardDto dto
			){
		Map<String,Object> map = freeBoardService.freeBoardInsertPro(dto);
	return map;
		
	}
	

	@RequestMapping("/freeBoardDetail.ino")
	public ModelAndView freeBoardDetail(HttpServletRequest request,Model model,int num){
		FreeBoardDto FreeBoardDto = freeBoardService.getDetailByNum(num);
		return new ModelAndView("freeBoardDetail", "FreeBoardDto",FreeBoardDto);
	}

	@RequestMapping("/freeBoardModify.ino")
	@ResponseBody
	public Map<String,Object> freeBoardModify(HttpServletRequest request, FreeBoardDto dto){
		Map<String,Object> map = freeBoardService.freeBoardModify(dto);
		
		return map;
	}


	@RequestMapping("/freeBoardDelete.ino")
	@ResponseBody
	public Map<String,Object> FreeBoardDelete(int num){ 
		Map<String,Object> map = freeBoardService.FreeBoardDelete(num);
		
		return map;
	}
	@RequestMapping("/freeBoardfinder.ino")
	@ResponseBody
	public Map<String,Object> FreeBoardfrinde(Model model,HttpServletRequest request,
			@RequestParam Map<String,Object> map,@RequestParam int page){
		int rowcount = freeBoardService.listCount(map);
		int pagesize = 10;
		int startrow = ((page -1)* pagesize) ; 
		int endrow = (startrow + pagesize);
		int absPage = 1;
		if (rowcount % pagesize == 0) {
			absPage = 0;
		}
		int pagecount = rowcount / pagesize + absPage;
		System.out.println(pagecount);
		int pages[] = new int[pagecount];
		for (int i = 0; i < pagecount; i++) {
			pages[i] = i + 1;
			System.out.println(pages[i]);
			
		}
		
		map.put("startrow",startrow);
		map.put("endrow",endrow); 
		map.put("rowcount",rowcount);
		map.put("pages", pages);
		List<FreeBoardDto> list = freeBoardService.freeBoardList(map);
		System.out.println(map);
		
		map.put("list", list);
		System.out.println("===============================map"+list);
		
		return map;
	}
	
	@RequestMapping("/boardDeleteAjex.ino")
	@ResponseBody
	public  Map<String,Object> FreeBoardDelete1 (@RequestParam (value ="num[]")String[] fruitList){
//		Map<String,Object> map = new HashMap<>();
//		for(String num :fruitList ){
//			 freeBoardService.FreeBoardDelete(Integer.parseInt(num));
//			Integer.parseInt(num);
//			System.out.println(num);
//			freeBoardService.FreeBoardDelete(Integer.parseInt(num));
//		}
			
		int[] nums = Arrays.asList(fruitList).stream().mapToInt(Integer::parseInt).toArray();
		Map<String,Object> map = new HashMap<>();
		map.put("list", nums);
		freeBoardService.freeBoardDelete1(map);
		return map;
	}
	
}
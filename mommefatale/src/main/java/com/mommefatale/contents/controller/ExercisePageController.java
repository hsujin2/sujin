package com.mommefatale.contents.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.model.Paging;
import com.mommefatale.contents.model.ExerciseVO;
import com.mommefatale.contents.service.ExercisePageService;

@Controller
public class ExercisePageController {

	private ExercisePageService command;
	private Paging paging;

	public ExercisePageService getCommand() {
		return command;
	}

	public void setCommand(ExercisePageService command) {
		this.command = command;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	
	@RequestMapping(value = "/exercise1.do")
	public ModelAndView ExercisePage(HttpServletRequest request) throws Exception {
		System.out.println("운동법 리스트 컨트롤러");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		String category = request.getParameter("category");
		
		/*test*/
		System.out.println("테스트, 카테고리는 : " + category );
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 9;
		int pageNavi = 3;
		int page_count = command.ExercisePageCount();

		int count = 0;
		if(category == null || category == ""){
			//count = command.getCount(); //전체 글수
			System.out.println("카테고리 널이야!");
		}else{
			count = command.getCategoryCount(category); // 전체 글수
			System.out.println("카테고리별 게시물수"+count);
		}
		int number = count - (currentPage - 1) * pageSize; // 화면에 보여줄 글 번호
		paging.setPaging(pageSize, pageNavi, count, currentPage);
		map.put("startRow", paging.getWriting_Start());
		map.put("endRow", paging.getWriting_End());

		System.out.println("카운트 : " + page_count);

		List<ExerciseVO> categoryList = null;
		if(category != null || category != ""){
			System.out.println("카테고리: " + category);
			map.put("category", category);
			categoryList = command.listCategory(map);
		}
		
		List<ExerciseVO> vo = command.ExercisePage(map);
//		int count = vo.size();

		Map<String, Object> model = new HashMap<String, Object>();

		model.put("category", category);
		model.put("categoryList",categoryList);
		model.put("count", new Integer(count));
		model.put("page_count", new Integer(page_count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", paging);
		
		mav.setViewName("/contents/exercise1");
		mav.addAllObjects(model);
		mav.addObject("vo", vo);
		
		return mav;
	}

}

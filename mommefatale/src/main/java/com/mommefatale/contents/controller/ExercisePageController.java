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
		System.out.println("��� ����Ʈ ��Ʈ�ѷ�");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		String category = request.getParameter("category");
		
		/*test*/
		System.out.println("�׽�Ʈ, ī�װ��� : " + category );
		
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
			//count = command.getCount(); //��ü �ۼ�
			System.out.println("ī�װ� ���̾�!");
		}else{
			count = command.getCategoryCount(category); // ��ü �ۼ�
			System.out.println("ī�װ��� �Խù���"+count);
		}
		int number = count - (currentPage - 1) * pageSize; // ȭ�鿡 ������ �� ��ȣ
		paging.setPaging(pageSize, pageNavi, count, currentPage);
		map.put("startRow", paging.getWriting_Start());
		map.put("endRow", paging.getWriting_End());

		System.out.println("ī��Ʈ : " + page_count);

		List<ExerciseVO> categoryList = null;
		if(category != null || category != ""){
			System.out.println("ī�װ�: " + category);
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

package com.mommefatale.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.community.model.Paging;
import com.mommefatale.qna.model.QnaVO;
import com.mommefatale.qna.service.QnaPageService;

@Controller
public class QnaPageController {

		private QnaPageService command;
		private Paging paging;
		
		public QnaPageService getCommand() {
			return command;
		}

		public void setCommand(QnaPageService command) {
			this.command = command;
		}

		public Paging getPaging() {
			return paging;
		}

		public void setPaging(Paging paging) {
			this.paging = paging;
		}
		
		@RequestMapping(value = "/qnaBoard.do")
		public ModelAndView qnaPage(HttpServletRequest request) throws Exception {

			ModelAndView mav = new ModelAndView();
			request.setCharacterEncoding("UTF-8");
			String pageNum = request.getParameter("pageNum");

			Map<String, Object> map = new HashMap<String, Object>();
			if (pageNum == null || pageNum == "") {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10;
			int pageNavi = 3;
			int page_count = command.qnaPageCount();
			int number = page_count - (currentPage - 1) * pageSize;

			paging.setPaging(pageSize, pageNavi, page_count, currentPage);
			map.put("startRow", paging.getWriting_Start());
			map.put("endRow", paging.getWriting_End());
			
			System.out.println("ī��Ʈ: " + page_count);

			List<QnaVO> vo = command.qnaPage(map);
			int count = vo.size();
			
			Map<String, Object> model = new HashMap<String, Object>();

			model.put("qnaList", vo);
			model.put("page_count", new Integer(page_count));
			model.put("number", new Integer(number));
			model.put("pageNum", pageNum);
			model.put("paging", paging);
			mav.addAllObjects(model);
			mav.setViewName("/qna/qnaBoard");
			mav.addObject("vo", vo);
			mav.addObject("count", count);
//			for(int i=0; i<count; i++){
//			System.out.println("ref:"+vo.get(i).getRef()+"step:"+vo.get(i).getStep()+"depth"+vo.get(i).getDepth());
//			}
			return mav;
		}
		
}

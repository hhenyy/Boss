package boss.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.model.Review;
import boss.service.MasterReviewService;

@Controller
public class MasterReviewController {

	@Autowired
	private MasterReviewService ms;

	// 관리자 리뷰리스트
	@RequestMapping("masterReviewList.do")
	public String masterReviewList(PagePgm pp, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("masterReviewList");

		int total = ms.total();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		pp = new PagePgm(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("pp", pp);
		model.addAttribute("list", ms.list(pp));
		return "./master/review/masterReviewList";
	}

	// 관리자 리뷰 상세정보
	@RequestMapping("masterReviewSelect.do")
	public String masterReviewSelect(String rid, Model model) {
		System.out.println("masterReviewSelect");
		System.out.println(rid);
		Review review = ms.selectOne(rid);
		System.out.println("review : " + review);
		model.addAttribute("review", review);

		return "./master/review/masterReviewSelect";
	}

	// 관리자 리뷰 삭제
	@RequestMapping("masterReviewDelete.do")
	public String masterReviewDelete(String rid, Model model, HttpServletRequest request) {
		System.out.println("masterReviewDelete");

		// Service에서 메소드를 1번만 호출하기 위해 리스트로 양식을 통일했음.
		List<String> idList = new ArrayList<String>();
		int result = 0;
		// id값이 1개라도 넘어온다면 (복수허용)
		if ((rid != null) || (request.getParameterValues("chkId") != null)) {

			if (rid != null) { // 1개만 넘어온경우. (양식이 List기때문에 단일값도 list에 add)
				idList.add(0, rid);
			} else { // 여러개가 넘어온경우. (String[]->List (메서드 양식 통일))
				String[] ids = request.getParameterValues("chkId");
				idList = Arrays.asList(ids);
			}
		} else {
			result = 0;
			model.addAttribute("result", result);
			model.addAttribute("msg", "체크된 글이 없습니다.");
			return "./master/review/masterReviewDelete";
		}
		result = ms.delete(idList);
		if (result > 0) { // 삭제 성공시
			model.addAttribute("result", result);
			model.addAttribute("msg", result + "개 리뷰삭제 성공.");
		} else { // 삭제 실패시
			model.addAttribute("result", result);
			model.addAttribute("msg", "삭제할 글이 없습니다.");
		}
		return "./master/review/masterReviewDelete";
	}
}

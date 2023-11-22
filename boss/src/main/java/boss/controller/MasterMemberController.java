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
import boss.model.Member;
import boss.service.MasterMemberService;

@Controller
public class MasterMemberController {

	@Autowired
	private MasterMemberService ms;

	// elements
	@RequestMapping("elements.do")
	public String elements() {
		System.out.println("elements");
		return "./common/elements";
	}

	// 관리자 메인 이동
	@RequestMapping("masterMain.do")
	public String masterMain() {
		System.out.println("masterMain");
		return "./master/member/masterMain";
	}

	// 관리자 회원리스트 이동
	@RequestMapping("masterMemberList.do")
	public String masterMemberList(PagePgm pp, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("masterMemberList");
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
		return "./master/member/masterMemberList";
	}

	// 관리자 회원 개인정보
	@RequestMapping("masterMemberSelect.do")
	public String masterMemberSelect(String id, Model model) {
		System.out.println("masterMemberSelect");
		System.out.println(id);
		Member member = ms.selectOne(id);
		System.out.println("id : " + member.getmEmail());
		model.addAttribute("member", member);

		return "./master/member/masterMemberSelect";
	}

	// 관리자 회원정보 수정 폼(입력값 받음)
	@RequestMapping("masterMemberUpdateForm.do")
	public String masterMemberUpdateForm(String id, Model model) {
		System.out.println("masterMemberUpdateForm");
		Member db = ms.selectOne(id);
		model.addAttribute("member", db);
		return "./master/member/masterMemberUpdateForm";
	}

	// 관리자 회원 수정 (입력값 적용)
	@RequestMapping("masterMemberUpdate.do")
	public String masterMemberUpdate(Member member, Model model) {
		System.out.println("masterMemberUpdate");
		System.out.println(member.getmEmail());
		System.out.println(member.getmReg());
		int result = ms.update(member);
		System.out.println("쿼리문 성공");
		String dbid = member.getmEmail();
		System.out.println("dbid" + dbid);
		if (result == 1) { // 업데이트 성공시
			System.out.println("여기여기");
			model.addAttribute("result", result);
			model.addAttribute("mEmail", dbid);
			model.addAttribute("member", member);
			model.addAttribute("msg", "회원수정 성공.");
			System.out.println("업데이트 성공");
		} else { // 업데이트 실패시
			System.out.println("업데이트 실패");
			model.addAttribute("msg", "회원수정 실패.");
		}
		return "./master/member/masterMemberUpdate";
	}

	// 관리자 회원 삭제
	@RequestMapping("masterMemberDelete.do")
	public String masterMemberDelete(String id, Model model, HttpServletRequest request) {
		System.out.println("masterMemberDelete");

		// Service에서 메소드를 1번만 호출하기 위해 리스트로 양식을 통일했음.
		List<String> idList = new ArrayList<String>();
		if (id != null) { // 1개만 삭제할경우. (양식이 List기때문에 단일값도 list에 add)
			idList.add(0, id);
		} else { // 여러개 삭제할경우. (String[]->List로 변환해준다.)
			String[] ids = request.getParameterValues("chkId");
			idList = Arrays.asList(ids);
		}
		int result = ms.delete(idList);
		if (result > 0) { // 삭제 성공시
			model.addAttribute("result", result);
			model.addAttribute("msg", result + "명 이젠 보낼게");
			System.out.println(result);
		} else { // 삭제 실패시
			model.addAttribute("result", result);
			model.addAttribute("msg", "아직 잊지 못했어.");
			System.out.println(result);
		}
		return "./master/member/masterMemberDelete";
	}

}

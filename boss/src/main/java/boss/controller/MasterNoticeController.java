package boss.controller;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import boss.common.PagePgm;
import boss.model.MasterNotice;
import boss.model.Product;
import boss.service.MasterNoticeService;
import boss.service.MasterProductService;


@Controller
public class MasterNoticeController {

	
	  @Autowired MasterNoticeService service;
	 
	
	//글 등록폼 이동 메소드
	/*
	 * @RequestMapping("masterNoticeInsertForm.do") public String
	 * masterNoticeInsertForm() {
	 * 
	 * return "./master/notice/masterNoticeInsertForm"; }
	 * 
	 * //새 글 등록 메소드
	 * 
	 * @RequestMapping(value="masterNoticeInsert.do", method = {RequestMethod.POST})
	 * public String masterNoticeInsert(Notice notice, Model model,
	 * 
	 * @RequestParam(value="mnOriFile1", required=false) MultipartFile mfile,
	 * HttpServletRequest request) throws Exception{ int result = 0; int sizeCheck,
	 * extensionCheck; // 첨부 파일명 String filename = mfile.getOriginalFilename();
	 * System.out.println("파일이름" + filename); // 첨부 파일 사이즈 (Byte) int size =
	 * (int)mfile.getSize(); // 파일 저장될 경로 String path =
	 * "C:\\bossRepository\\boss\\src\\main\\webapp\\images";
	 * 
	 * System.out.println("oldpath : " + path);
	 * 
	 * // 확장자 잘라서 저장할 배열 String[] file = new String[2];
	 * 
	 * // 새로운 파일명 저장 번수 String newfilename = "";
	 * 
	 * if(filename != "") { // 첨부 파일이 전송된 경우 // .뒤에 확장자만 자르기 String extension =
	 * filename.substring(filename.lastIndexOf("."), filename.length());
	 * 
	 * UUID uuid = UUID.randomUUID();
	 * 
	 * // 난수를 발생시켜 중복 문제 해결후 확장자 결합 newfilename = uuid.toString() + extension;
	 * 
	 * // 확장자를 구분해 조건을 주기 위해 잘라줌 //file[0]에 파일명, file[1] 에 확장자가 저장됨. StringTokenizer
	 * st = new StringTokenizer(filename, "."); file[0] = st.nextToken(); file[1] =
	 * st.nextToken();
	 * 
	 * if(size > 600) { // 사이즈가 설정된 범위 초과할 경우 sizeCheck = -1;
	 * model.addAttribute("sizeCheck", sizeCheck); System.out.println("설정범위 초과");
	 * return "./master/notice/masterNotice"; //이동 대신 경고메세지 출력 후 복귀가 좋을 듯
	 * 
	 * // 확장자가 jpg, png, jpeg, gif 가 아닐경우 }else if(!file[1].equals("jpg") &&
	 * !file[1].equals("png") && !file[1].equals("jpeg") && !file[1].equals("gif"))
	 * { extensionCheck = -1; model.addAttribute("extensionCheck", extensionCheck);
	 * 
	 * return "./master/notice/masterNotice"; //이동 대신 경고메세지 출력 후 복귀가 좋을 듯 }
	 * 
	 * }
	 * 
	 * // 첨부파일이 전송된 경우 if(size > 0) { mfile.transferTo(new File(path + "/" +
	 * newfilename)); notice.setMnOriFile(newfilename);
	 * System.out.println("전송됐음!!"); }
	 * 
	 * System.out.println("파일명"); System.out.println(notice.getMnOriFile());
	 * //result = //insert문 호출;
	 * 
	 * if(result == 1) { System.out.println("첨부파일 포함된 상품등록 성공");
	 * 
	 * }else { System.out.println("첨부파일 포함된 상품등록 실패"); }
	 * 
	 * model.addAttribute("notice", notice); System.out.println("???????"); return
	 * "./master/notice/masterNotice"; }
	 */

	// 글 삭제

	// 글 수정

	// 공지사항 목록 페이지 출력
	@RequestMapping("masterNotice.do")
	public String masterNotice(PagePgm pp, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "20";
		}
		
		//총 글 갯수
		int totalCount = service.totalCount();
		System.out.println(totalCount+"개");
		
pp = new PagePgm(totalCount,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		
		// 페이징 처리된 리스트
		List<MasterNotice> noticeList = service.noticeList(pp);
		System.out.println(noticeList);
		model.addAttribute("pp", pp);
		model.addAttribute("list", noticeList);
		
		return "./master/notice/masterNotice";
	}
	
}

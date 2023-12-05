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

import com.mysql.cj.protocol.x.Notice;

import boss.common.PagePgm;
import boss.model.MasterNotice;
import boss.service.MasterNoticeService;

@Controller
public class MasterNoticeController {

	@Autowired
	MasterNoticeService service;

	// 글 등록폼 이동 메소드

	@RequestMapping("masterNoticeInsertForm.do")
	public String masterNoticeInsertForm() {

		return "./master/notice/masterNoticeInsertForm";
	}

	// 새 글 등록 메소드
	@RequestMapping(value = "masterNoticeInsert.do", method = { RequestMethod.POST })
	public String masterNoticeInsert(MasterNotice notice, Model model,
	@RequestParam(value = "mnOriFile1", required = false) MultipartFile mfile,
	// 파일은 MasterNotice에서 받는 것이 불가능. 해당 DTO는 String형. 파일 이름만 저장 가능
	HttpServletRequest request) throws Exception {
		
		int result = 0;
		int sizeCheck, extensionCheck;
		String filename = mfile.getOriginalFilename();
		// 전송된 파일에서 이름만 채취
		System.out.println("파일이름:" + filename);
		String path = "C:\\bossRepository\\boss\\src\\main\\webapp\\images";
		 //path = request.getRealPath("upload");
		 System.out.println(path);
		// 파일 저장될 경로 path
		int size = (int) mfile.getSize();
		// 첨부 파일 사이즈 (Byte) int size
		String[] file = new String[2];
		// 확장자 잘라서 저장할 배열
		String newfilename = "";
		// 새로운 파일명 저장 번수

		if (filename != "") { // 첨부 파일이 전송된 경우
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			// .뒤에 확장자만 자르기
			UUID uuid = UUID.randomUUID();
			// 난수를 발생시켜 중복 문제 해결후 확장자 결합
			newfilename = uuid.toString() + extension;
			StringTokenizer st = new StringTokenizer(filename, ".");
			// 확장자를 구분해 조건을 주기 위해 잘라줌
			file[0] = st.nextToken();
			file[1] = st.nextToken();
			// file[0]에 파일명, file[1] 에 확장자가 저장됨.

			if (size > 6000) { // 사이즈가 설정된 범위 초과할 경우
				sizeCheck = -1;
				model.addAttribute("sizeCheck", sizeCheck);
				System.out.println("설정범위 초과");
				return "redirect:/masterNotice.do"; // 이동 대신 경고메세지 출력 후 복귀가 좋을 듯
			} else if (!file[1].equals("jpg") && 
					   !file[1].equals("png") && 
					   !file[1].equals("jpeg")&& 
					   !file[1].equals("gif"))
					   // 확장자가 jpg, png, jpeg, gif 가 아닐경우
			{
				extensionCheck = -1;
				model.addAttribute("extensionCheck", extensionCheck);

				System.out.println("올바른 확장자가 아닙니다");
				return "redirect:/masterNotice.do"; // 이동 대신 경고메세지 출력 후 복귀가 좋을 듯

			}

			// 첨부파일이 전송된 경우
			if (size > 0) {
				mfile.transferTo(new File(path + "/" + newfilename));
				notice.setMnOriFile(newfilename);
				//업로드 파일 내부의 파일을 바꾸고 DTO 내부의 이름을 바꿔버림
				System.out.println("전송됐음!!");
			}
		}

		System.out.println("파일명:"+notice.getMnOriFile());

		// 공지 등록
		result = service.noticeInsert(notice);
		System.out.println("공지 입력 성공");

		if (result == 1) {
			System.out.println("공지사항 등록 성공");
		} else {
			System.out.println("공지사항 등록 실패");
		}

		model.addAttribute("notice", notice);
		return "redirect:/masterNotice.do";
	}

	// 글 삭제
	@RequestMapping("masterNoticeDelete.do")
	public String masterNoticeDelete(int mnId,PagePgm pp) {

		System.out.println("masterNoticeDelete");
		service.noticeDelete(mnId);
//		model.addAttribute("pp", pp);
//		model.addAttribute("mnId", mnId);
//		model.addAttribute("nowPage", nowPage);
		return "redirect:/masterNotice.do";
	}

	// 글 수정 폼
	@RequestMapping("masterNoticeUpdateForm.do")
	public String masterNoticeUpdateForm(PagePgm pp, Model model, MasterNotice mn,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		model.addAttribute("mn", mn);
		model.addAttribute("pp", pp);

		return "./master/notice/masterNoticeUpdateForm";
	}

	// 글 수정
	@RequestMapping(value = "masterNoticeUpdate.do", method = RequestMethod.POST)
	public String masterNoticeUpdate(
	PagePgm pp, Model model, MasterNotice mn, 
	@RequestParam(value = "nowPage", required = false) String nowPage,		
	@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
	@RequestParam(value = "mnOriFile1", required = false) MultipartFile mfile) throws Exception {
		
		System.out.println("수정 진입");
		int sizeCheck, extensionCheck;
		String filename = mfile.getOriginalFilename();
		int size = (int) mfile.getSize();
		String path = "C:\\bossRepository\\boss\\src\\main\\webapp\\images";
		int result = 0;
		String file[] = new String[2];
		String newfilename = "";
		
		mn.setMnTitle(mn.getMnTitle()+"(수정)");
		System.out.println(mn.getMnTitle());

		if (filename != "") { // 첨부파일이 전송된 경우

			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:" + newfilename);

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken(); // 파일명
			file[1] = st.nextToken(); // 확장자

			if (size > 600) { // 사이즈가 설정된 범위 초과할 경우
				sizeCheck = -1;
				model.addAttribute("sizeCheck", sizeCheck);
				System.out.println("설정범위 초과");

				return "./master/notice/masterNotice"; // 이동 대신 경고메세지 출력 후 복귀가 좋을 듯

			} else if (!file[1].equals("jpg") && 
					   !file[1].equals("png") && 
					   !file[1].equals("jpeg") &&
					   !file[1].equals("gif"))
			// 확장자가 jpg, png, jpeg, gif 가 아닐경우
			{
				extensionCheck = -1;
				model.addAttribute("extensionCheck", extensionCheck);

				System.out.println("올바른 확장자가 아닙니다");
				return "./master/notice/masterNotice"; // 이동 대신 경고메세지 출력 후 복귀가 좋을 듯
				
			}

		}

		if (size > 0) { // 첨부파일이 전송된 경우
			mfile.transferTo(new File(path + "/" + newfilename));
			mn.setMnOriFile(newfilename);
			//업로드 파일 내부의 파일을 바꾸고 DTO 내부의 이름을 바꿔버림
			System.out.println("전송됐음!!");
		}

		if (size == 0) { // 첨부 파일이 수정되지 않으면 파일 유지
						 // 이 코드가 없으면 null값으로 변해버림
			System.out.println(mn.getmnId());
			MasterNotice oldmn = service.selectOne(mn.getmnId());
			System.out.println(oldmn.getMnOriFile());
			
			String oldfilename = oldmn.getMnOriFile();
			// sql문을 호출. 테이블에 존재하는 파일명을 가져와 저장
			mn.setMnOriFile(oldfilename); // 테이블에 저장된 파일명을 설정
				
			
		}

		// update문 실행. 완성된 DTO 객체를 전송, 테이블에 덮어씌움
		service.masterNoticeUpdate(mn);

		return "redirect:/masterNoticeDetail.do?mnId=" + mn.getmnId();
	}

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

		// 총 글 갯수
		int totalCount = service.totalCount();
		System.out.println(totalCount + "개");

		pp = new PagePgm(totalCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		// 페이징 처리된 리스트
		List<MasterNotice> noticeList = service.noticeList(pp);
		System.out.println(noticeList);
		model.addAttribute("pp", pp);
		model.addAttribute("list", noticeList);

		return "./master/notice/masterNotice";
	}
	
	@RequestMapping("masterNoticeSearch.do")
	public String masterNoticeSearch(PagePgm pp, 
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			Model model) {
		
		if (nowPage == null) {
			nowPage = "1";
		}else {
			pp.setNowPage(Integer.parseInt(nowPage));
		}
		cntPerPage="20";
		
		int total = service.noticeCount(pp.getKeyword());
		
		pp=new PagePgm(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage),pp.getKeyword());
		List<MasterNotice> noticeSearch=service.noticeSearchList(pp);
		
		model.addAttribute("pp", pp);
		model.addAttribute("list", noticeSearch);
		
		return "./master/notice/masterNoticeSearch";
	}
	
	// 공지 내용 : 세부 내용 띄우면서 조회수 + 1
		@RequestMapping("masterNoticeDetail.do")
		public String masterNoticeDetail(PagePgm pp, Model model, MasterNotice mn) {

			// 조회수 + 1
			service.updateMnReadCount(mn.getmnId());
			System.out.println("조회1");
			// 해당 공지 번호의 자료 조회
			mn = service.selectOne(mn.getmnId());
			//글 번호의 최대값 구하기
			mn.setRnumMax(service.noticeMax());
			System.out.println(mn.getMnOriFile());
			System.out.println("조회2");
			System.out.println(mn.getmnId());
			System.out.println(mn.getRnum());

			model.addAttribute("mnId", mn.getmnId());
			model.addAttribute("pp", pp);
			model.addAttribute("mnd", mn);
			//mnId,pp,mnd 값들을 다음 페이지로 전송

			return "./master/notice/masterNoticeDetail";
		}
	
		// 공지 내용 : 이전글/다음글로 이동
		@RequestMapping("masterNoticeDetailMove.do")
		public String masterNoticeDetailMove(PagePgm pp, Model model, MasterNotice mn,
				@RequestParam(value = "nowPage", required = false) String nowPage,
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

			System.out.println(mn.getRnum());
			
			// 조회수 + 1
			service.updateMnReadCount(mn.getRnum());
			//글 번호의 최대값 구하기
			
			int rm = service.noticeMax();
			mn.setRnumMax(rm);
			System.out.println("최대값:"+mn.getRnumMax());
			
			// 해당 글 번호의 자료 조회
			mn = service.selectMove(mn.getRnum());
			
			System.out.println("글 아이디:"+mn.getmnId());
			System.out.println("글번호:"+mn.getRnum());

			model.addAttribute("mnId", mn.getmnId());
			model.addAttribute("cntPerPage", pp.getCntPerPage());
			//model.addAttribute를 통해 단일값을 공유하면 get방식으로 공유됨. url 주소에서 확인 가능
			model.addAttribute("pp", pp);
			model.addAttribute("mnd", mn);

			return "redirect:/masterNoticeDetail.do";
		}

}

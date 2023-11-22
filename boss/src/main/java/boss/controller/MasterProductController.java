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
import boss.model.Product;
import boss.service.MasterProductService;

@Controller
public class MasterProductController {

	@Autowired
	MasterProductService service;
	
	/*
	 * 상품 1개 상세보기
	 */
	@RequestMapping("masterProductDetail.do")
	public String masterProductDetail(String id, Model model) {
		
		// 상품 상세정보 구하기
		Product product = service.selectOne(id);
		
		model.addAttribute("product", product);
		
		return "./master/product/masterProductDetail";
	}
	
	/*
	 * 상품리스트 페이지 이동 메소드 + 페이징 처리
	 */
	@RequestMapping("masterProductList.do")
	public String masterProductList(PagePgm page, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		// 총상품 갯수
		int totalCount = service.totalCount();
		System.out.println(totalCount+"개");
		
		page = new PagePgm(totalCount,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		
		// 페이징 처리된 리스트
		List<Product> list = service.selectList(page);
		System.out.println(list);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		return "./master/product/masterProductList";
	}
	
	/*
	 * 상품 등록 폼 이동 메소드
	 */
	@RequestMapping("masterProductInsertForm.do")
	public String masterProductInsertForm() {
		
		return "./master/product/masterProductInsertForm";
	}
	
	/*
	 * 신규 상품 등록 메소드
	 */
	@RequestMapping(value="masterProductInsert.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String productInsert(Product product, Model model, 
			@RequestParam(value="pimage1", required=false) MultipartFile mfile, HttpServletRequest request) throws Exception{
		int result = 0; 
		int sizeCheck, extensionCheck;
		// 첨부 파일명
		String filename = mfile.getOriginalFilename();
		System.out.println("파일이름" + filename);
		// 첨부 파일 사이즈 (Byte)
		int size = (int)mfile.getSize();
		// 파일 저장될 경로
		
		//String path = request.getRealPath("upload");
		
		String path = "C:\\bossRepository\\boss\\src\\main\\webapp\\images";
		
		System.out.println("oldpath : " + path);
		//String path = request.getRealPath("upload");
		System.out.println(path);
		System.out.println("cid" + product.getCid());
		System.out.println("pname" + product.getPname());
		System.out.println("pcontent" + product.getPcontent());
		System.out.println("pprice" + product.getPprice());
		System.out.println("pcolor" + product.getPcolor());
		System.out.println("psize" + product.getPsize());
		
		// 확장자 잘라서 저장할 배열
		String[] file = new String[2];
		
		// 새로운 파일명 저장 번수
		String newfilename = "";
		
		if(filename != "") { // 첨부 파일이 전송된 경우
			// .뒤에 확장자만 자르기
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			
			UUID uuid = UUID.randomUUID();
			
			// 난수를 발생시켜 중복 문제 해결후 확장자 결합
			newfilename = uuid.toString() + extension;
			
			// 확장자를 구분해 조건을 주기 위해 잘라줌 file[1] 에 확장자가 저장됨.
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();
			
			if(size > 10000000) {
				// 사이즈가 설정된 범위 초과할 경우
				sizeCheck = -1;
				model.addAttribute("sizeCheck", sizeCheck);
				System.out.println("설정범위 초과");
				return "./master/product/masterProductList";
				
				// 확장자가 jpg, png, jpeg, gif 가 아닐경우
			}else if(!file[1].equals("jpg") && !file[1].equals("png") && 
					 !file[1].equals("jpeg") && !file[1].equals("gif")) {
				extensionCheck = -1;
				model.addAttribute("extensionCheck", extensionCheck);
				
				return "./master/product/masterProductList";
			}
			
		}
		
		// 첨부파일이 전송된 경우
		if(size > 0) {
			mfile.transferTo(new File(path + "/" + newfilename));
			product.setPimage(newfilename);
			System.out.println("전송됐음!!");
		}
		
		System.out.println("여기는?");
		System.out.println(product.getPimage());
		result = service.productInsert(product);
		
		if(result == 1) {
			System.out.println("첨부파일 포함된 상품등록 성공");
			
		}else {
			System.out.println("첨부파일 포함된 상품등록 실패");
		}
		
		model.addAttribute("product", product);
		System.out.println("???????");
		return "./master/product/masterProductList";
	}
	
	/*
	 * 상품 수정 페이지 이동 메소드
	 */
	@RequestMapping("masterProductUpdateForm.do")
	public String masterProductUpdateForm(String id,Model model) {
		
		// 상품 상세정보 구하기
		Product product = service.selectOne(id);
		model.addAttribute("product", product);
		System.out.println("update : " + product.getPreg());
		return "./master/product/masterProductUpdateForm";
	}
	
	/*
	 * 상품 수정 메소드
	 */
	@RequestMapping("masterProductUpdate.do")
	public String masterProductUpdate(Product product, MultipartFile mFile, Model model) {
		
		
		
		return "./master/product/masterProductDetail";
	}
}























package boss.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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























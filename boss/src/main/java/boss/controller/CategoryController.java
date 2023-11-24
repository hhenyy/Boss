package boss.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.model.Category;
import boss.model.Product;
import boss.service.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService cs;
	
		// 상품 리스트로 이동 이동
		@RequestMapping("category.do")
		public String category(PagePgm pp, Product p, Model model,
				@RequestParam(value = "nowPage", required = false) String nowPage,
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
			System.out.println("category");
			int categoryCount = cs.categoryCount(p.getCid());
			//해당 카테고리의 상품 갯수를 검색
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "15";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "15";
			}
			
			//1.cid 값을 가지고 product내부에서 검색하는 쿼리문으로 연결
			//검색 결과는 리스트에 저장되어 돌아옴
			List<Product> categoryList = cs.categoryList(p.getCid());
			
			//2.리스트의 인덱스 번호 값을 페이징에 활용. 0~29/30~59 등등
			//for문을 사용해 해당 DTO 객체들을 새로운 리스트에 저장시킨 후 뷰페이지로 공유
			List<Product> realCategoryList = new ArrayList<Product>();
			
			pp=new PagePgm(categoryCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			for(int i = pp.getStartPage()-1;i<pp.getEndPage();i++) {
				realCategoryList.add(i, categoryList.get(i));
			}
			
			
			
			//3.뷰페이지에선 이 데이터를 forEach를 이용해 반복출력
			//출력될 리스트는 현재 페이지에 따라 변화하게 됨
			
			model.addAttribute("pp", pp);  //상품 갯수, 현재페이지번호, 한 페이지에 출력될 번호를 공유
			model.addAttribute("list", realCategoryList);
			model.addAttribute("cid",p.getCid());
			//cid로 찾아낸 해당 카테고리 상품 목록을 페이징 처리하여 공유
			return "./category/categoryList";
		}

}

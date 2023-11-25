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
		public String category(PagePgm pp, Product p, Model model, Category c,
				@RequestParam(value = "nowPage", required = false) String nowPage,
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
			System.out.println("category");
			
			int categoryCount = cs.categoryCount(p.getCid());
			//해당 카테고리의 상품 갯수를 검색
			System.out.println(p.getCid());
			System.out.println(categoryCount);
			System.out.println(pp.getNowPage());
			System.out.println(pp.getCntPerPage());
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "15";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "15";
			}
			
			//1.페이징처리를 위한 값들을 전송 후 거기서 파생된 변수들을 Category DTO에 저장. 
			pp = new PagePgm(categoryCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			System.out.println(c.getNewCid());
			c.setNewCid("맨투맨");
			c.setNewStartRow(pp.getStartRow());
			c.setNewEndRow(pp.getEndRow());
			System.out.println(c.getNewCid());
			System.out.println(c.getNewStartRow());
			System.out.println(c.getNewEndRow());
			
			model.addAttribute("pp", pp);  //상품 갯수, 현재페이지번호, 한 페이지에 출력될 번호를 공유
			model.addAttribute("list", cs.categoryList(c));
			model.addAttribute("cid",p.getCid());
			//cid로 찾아낸 해당 카테고리 상품 목록을 페이징 처리하여 공유
			System.out.println(cs.categoryList(c).get(0).getPname());
			return "./category/categoryList";
		}

}

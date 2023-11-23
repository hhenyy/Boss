package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.model.Category;
import boss.service.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService cs;
	
		// 상품 리스트로 이동 이동
		@RequestMapping("category.do")
		public String category(Category c, Model model,
				@RequestParam(value = "nowPage", required = false) String nowPage,
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
			System.out.println("category");
			int categoryCount = cs.categoryCount(c.getCid());
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "30";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "30";
			}
			c = new Category(c.getCid(),categoryCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("c", c);
			model.addAttribute("list", cs.categoryList(c));  //해당 카테고리 목록을 공유
			return "./category/categoryList";
		}

}

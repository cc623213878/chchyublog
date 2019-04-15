package cn.chchyu.contorller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.chchyu.mapper.ArticleMapper;
import cn.chchyu.model.Article;


@Controller
public class ArticleController {
	@Autowired ArticleMapper articleMapper;
	
	@RequestMapping({"/","index"})
	public String listArticle(Model m,@RequestParam(value = "start", defaultValue = "0") int start,@RequestParam(value = "size", defaultValue = "5") int size) throws Exception{
		PageHelper.startPage(start,size,"mdfile desc");
		List<Article> articles=articleMapper.findAll();
		PageInfo<Article> page = new PageInfo<>(articles);
		m.addAttribute("page",page);
		return "index"; 
	}
	
	@RequestMapping("/ArticleView")
	public String articleView(HttpServletRequest request,Model m) {
		String mdfile=request.getParameter("mdfile");
		articleMapper.viewArticle(mdfile);
		Article article=articleMapper.findByid(mdfile);
		m.addAttribute("article",article);
		return "articleView";
	}
	@RequestMapping("/AddArticle")
	public String addArticle() {
		return "addArticle";
	}
}

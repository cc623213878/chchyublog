package cn.chchyu.api;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.chchyu.mapper.ArticleMapper;
import cn.chchyu.model.Article;
/*
 * 左边热门推荐_get方法返回json
 */
@RestController
public class ArticleHoting {
	@Autowired ArticleMapper articleMapper;
	@RequestMapping("/API/HotArticle")
	public String hotArticle() {
		JSONObject jsonObject=new JSONObject();
		List<Article> titles=articleMapper.findHotArticle();
		try {
			for(Article title : titles) {
				JSONObject jsontemp=new JSONObject();
				jsontemp.put("title", title.getTitle());
				jsontemp.put("mdfile", title.getMdfile());
				jsonObject.accumulate("article", jsontemp);
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
}

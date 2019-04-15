package cn.chchyu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import cn.chchyu.model.Article;

@Mapper
public interface ArticleMapper {
	@Select("select mdfile,title,described,time,pageview,SUBSTRING(content,1,50) as content from article")
	List<Article> findAll();
	@Select("select * from article where mdfile=#{mdfile}")
	public Article findByid(String mdfile);
	@Insert("insert into article(mdfile,title,described,time,content,pageview) values(#{mdfile},#{title},#{described},#{time},#{content},0) "
			+ "ON DUPLICATE KEY UPDATE title=#{title},described=#{described},time=#{time},content=#{content} ")
    public boolean save(Article article); 
}

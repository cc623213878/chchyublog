package cn.chchyu.model;


public class Article {
	private String mdfile;
	private String title;
	private String time;
	private String described;
	private int pageview;
	private String content;
	public String getMdfile() {
		return mdfile;
	}
	public void setMdfile(String mdfile) {
		this.mdfile = mdfile;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDescribed() {
		return described;
	}
	public void setDescribed(String described) {
		this.described = described;
	}
	public int getPageview() {
		return pageview;
	}
	public void setPageview(int pageview) {
		this.pageview = pageview;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}

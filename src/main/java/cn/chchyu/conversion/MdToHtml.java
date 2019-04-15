package cn.chchyu.conversion;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.pegdown.PegDownProcessor;

/*
 * markdown格式转为html文件格式
 * mdstring   md文件读取的字符串
 * 对md中的本地图片进行地址转变
 * 返回html格式字符串
 */
public class MdToHtml {
	

	public static String toHtml(String mdstring,String folder) {
        PegDownProcessor pdp = new PegDownProcessor(Integer.MAX_VALUE);
        String htmlContent = pdp.markdownToHtml(mdstring);
        Document doc = Jsoup.parse(htmlContent);
        Elements imgs = doc.select("img[src~=^(?!http)]");
        for (Element img : imgs) {
        	String linksrc = img.attr("src");
        	img.attr("src","/myimg/"+folder+"/"+linksrc);
        }
        return doc.toString();
    }

}

package cn.chchyu.conversion;

import org.pegdown.PegDownProcessor;

/*
 * markdown格式转为html文件格式
 * mdstring   md文件读取的字符串
 * 返回html格式字符串
 */
public class MdToHtml {
	public static String toHtml(String mdstring) {

        PegDownProcessor pdp = new PegDownProcessor(Integer.MAX_VALUE);
        String htmlContent = pdp.markdownToHtml(mdstring);
        return htmlContent;
    }

}

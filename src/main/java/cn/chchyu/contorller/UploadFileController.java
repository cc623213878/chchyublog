package cn.chchyu.contorller;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.chchyu.conversion.MdToHtml;
import cn.chchyu.mapper.ArticleMapper;
import cn.chchyu.model.Article;

/*
 *  markdown文件夹上传
 *  上传的markdown文件中包含文章的描述注释信息:
 *  
 *  <!--blog
 * 		{
 * 			"title":"",
 * 			"described":""
 * 		}
 *  blog-->
 *  
 *  title:文章的标题
 *  described:文章的概述或介绍
 * 
 *	通过post上传文件夹，与服务器上的文件夹比较 
 * 	相同的文件不做处理
 * 	不同的替换并更新数据库
 *  md文件中没有文章描述的不保存   并返回错误信息
 * 	服务器没有的文件进行保存，并保存到数据库
 */
@Controller
public class UploadFileController {
	@Autowired ArticleMapper articleMapper;
	@RequestMapping("/uploadfile")
	public String uploadfile(@RequestParam("file") MultipartFile[] file,RedirectAttributes attributes) {
		if (file[0].isEmpty()) {
			attributes.addFlashAttribute("messagenum", 1);
			attributes.addFlashAttribute("message", "文件上传失败，请选择文件！");
			return "redirect:AddArticle";
        }
		
		String regEx = ".*\\.md";
		String regheader = "<!--blog[\\s\\S]*blog-->";
        File file1 = null;
        File file2 = null;
		byte[] buffer = new byte[1024];
		int length = -1;
        String name="";
        int messagenum=0;
        String message="";
		String described,title,temp = null,line;
		
		Pattern pattern = Pattern.compile(regEx);
		Pattern paheader = Pattern.compile(regheader);
		Matcher matcher;
		
		for(MultipartFile f:file){
	        try {
                name = f.getOriginalFilename();
                file1 = new File(ResourceUtils.getURL("").getPath()+name);
                file2= new File(ResourceUtils.getURL("").getPath()+name+".temp");
                MessageDigest md1 = MessageDigest.getInstance("MD5");
                MessageDigest md2 = MessageDigest.getInstance("MD5");
                //服务器存在相同文件名
                if (file1.exists()) {
                	//文件名相同
                	 if (f.getSize()==file1.length()) {
                		 //保存临时文件计算原文件与临时文件的md5，
                		 makeDir(ResourceUtils.getURL("").getPath()+name+".temp");
                		 f.transferTo(file2);
                		 
                		 FileInputStream fis = new FileInputStream(file2);
                         while ((length = fis.read(buffer, 0, 1024)) != -1) {
                             md2.update(buffer, 0, length);
                         }
                         fis.close();
                         
                         BigInteger bigInt2 = new BigInteger(1, md2.digest());

                         fis = new FileInputStream(file1);
                         length = -1;
                         while ((length = fis.read(buffer, 0, 1024)) != -1) {
                             md1.update(buffer, 0, length);
                         }
                         fis.close();
                         
                         BigInteger bigInt1 = new BigInteger(1, md1.digest());
                         file2.delete();
                         //比较两个文件的md5,相同则文件未更改不用覆盖
                         if(bigInt1.toString(16).equals(bigInt2.toString(16))){
                        	 continue;
                        	 //System.out.println("DELETE "+file2.getName());
                         }                  
					}
                } 
                makeDir(ResourceUtils.getURL("").getPath()+name);
                f.transferTo(file1);
           	 	matcher = pattern.matcher(name);
                //如果是。md文件则解析markdown文件
                if (matcher.matches()) {
                	Article article=new Article();
                	FileInputStream fin=new FileInputStream(file1);
                	InputStreamReader in=new InputStreamReader(fin);
                	BufferedReader reader =new BufferedReader(in);
                	temp="";
                    while ((line=reader.readLine())!=null) {  
                        temp+=line+"\n";
                    }
                	//匹配markdown文件中文章描述 （title，described） 
                	matcher=paheader.matcher(temp);
                	//如果有文章描述就保存，没有就不保存
                	if(matcher.find()) {
                		article.setContent(MdToHtml.toHtml(temp,name.split("/",2)[0]));
	                	temp=matcher.group();
	                	temp=temp.substring(9,temp.length()-8); 
	                	temp=temp.replaceAll("\u200b", "");//从文件中读取的一个不显示字符，不去掉会报错 
	                	
	                	JSONObject jsonObject=new JSONObject(temp);
	                	
	                	described=jsonObject.getString("described");
	                	title=jsonObject.getString("title");
	                	
						article.setDescribed(described);
						article.setTitle(title);

						SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
						article.setTime(ft.format(new Date()));
						article.setMdfile(name);
						articleMapper.save(article);
						reader.close();
                	}else {
                		reader.close();
                		file1.delete();
                		messagenum++;
                		message+="["+file1.getName()+"] 文章头描述错误，上传失败\\n";
                	}
                }
	        }catch (Exception e){
	            e.printStackTrace();
	        }
		 }
		attributes.addFlashAttribute("messagenum", messagenum);
		attributes.addFlashAttribute("message", message);
		return "redirect:AddArticle";
	}
	private static void makeDir(String filePath) {
		if (filePath.lastIndexOf('/') > 0) {
			String dirPath = filePath.substring(0, filePath.lastIndexOf('/'));
			File dir = new File(dirPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
		}
	}

}

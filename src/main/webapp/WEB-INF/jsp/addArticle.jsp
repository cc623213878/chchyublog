<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>

<body>
	<div>   
	希望所有的博客文件都放在同一个目录中，在选择文件夹时选择这个目录，会同步该目录下的所有问价到博客上<br/>
	注：本功能目前支持Chrome浏览器。其他浏览器未知<br/>
		上传的markdown文件中包含文章的描述注释信息:<br/>

	  &#60;&#33;--blog<br/>
	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br/>
	 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"title":"",<br/>
	 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"described":""<br/>
	  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
	   blog--&#62;<br/><br/>
	   
	   title:文章的标题<br/>
	   described:文章的概述或介绍
	</div>
    <form action="uploadfile" method="post" enctype="multipart/form-data">
        <input id="dir" value="选择文件夹" type="file" name="file" accept="." webkitdirectory mozdirectory /> </br>
        <input type="submit" value="提交文件夹">
    </form>
    <c:if test="${messagenum>0}">
    	<script type="text/javascript">
    		alert("${message}");
    	</script>
    </c:if>
</body>

</html>
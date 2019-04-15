## chchyublog

使用mysql数据库

新建一个数据库：myblog

sql文件：myblog.sql（带测试数据）



#### 上传页面：你的网址/AddArticle



在本地新建一个存储markdown的blog文件夹（包括图片，图片只用相对路径）

注：文件夹上传功能目前支持Chrome浏览器。其他浏览器未知
​		上传的markdown文件中包含文章的描述注释信息:

```
<!--blog
	{
		"title":"",
		"described":""
	}
blog-->
```

 title:文章的标题

described:文章的概述或介绍
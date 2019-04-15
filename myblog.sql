/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3307
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 15/04/2019 22:56:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `mdfile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `described` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `pageview` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`mdfile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('myblog/1.md', 'KJPush介绍', 'KJPush是一个Android推送框架，目标是让Android开发者一人无需与服务端开发者交流也能完成推送功能开发<br/>不同于现有的第三方推送服务(极光、个推、百度等)以socket长连接的形式实现推送，KJPush采用轮询机制更适合轻量级应用快速完成推送功能开发。很多人认为长连接没有任何消耗，其实不然。如果轮询策略配置的好，消耗的电与数据流量绝不比维持一个socket连接使用的多。', '2019-04-15', 0000000000, '<html>\n <head></head>\n <body>\n  <p><img src=\"/myimg/myblog/1.assets/assic.jpg\" alt=\"assic\"></p> \n  <h1><a href=\"#kjpush介绍\" name=\"kjpush介绍\"></a>KJPush介绍</h1> \n  <p>KJPush是一个Android推送框架，目标是让Android开发者一人无需与服务端开发者交流也能完成推送功能开发<br>不同于现有的第三方推送服务(极光、个推、百度等)以socket长连接的形式实现推送，KJPush采用轮询机制更适合轻量级应用快速完成推送功能开发。很多人认为长连接没有任何消耗，其实不然。如果轮询策略配置的好，消耗的电与数据流量绝不比维持一个socket连接使用的多。</p> \n  <h2><a href=\"#欢迎你访问\" name=\"欢迎你访问\"></a>欢迎你访问</h2> \n  <ul> \n   <li></li> \n  </ul> \n  <pre><code class=\"java\">PushManager.stopWork();\n</code></pre>\n </body>\n</html>');
INSERT INTO `article` VALUES ('myblog/2.md', 'CalenderView', 'Android上一个优雅、高度自定义、性能高效的日历控件，完美支持周视图，支持标记、自定义颜色、农历等，任意控制月视图显示、任意日期拦截条件、自定义周起始等。Canvas绘制，极速性能、占用内存低，，支持简单定制即可实现任意自定义布局、自定义UI，支持收缩展开、性能非常高效，', '2019-04-15', 0000000000, '<html>\n <head></head>\n <body>\n  <h1><a href=\"#calenderview\" name=\"calenderview\"></a>CalenderView</h1> \n  <p>Android上一个优雅、高度自定义、性能高效的日历控件，完美支持周视图，支持标记、自定义颜色、农历等，任意控制月视图显示、任意日期拦截条件、自定义周起始等。Canvas绘制，极速性能、占用内存低，，支持简单定制即可实现任意自定义布局、自定义UI，支持收缩展开、性能非常高效，<br>这个控件内存和效率优势相当明显，而且真正做到收缩+展开，适配多种场景，支持同时多种颜色标记日历事务，支持多点触控，你真的想不到日历还可以如此优雅！更多参考用法请移步Demo，Demo实现了4个精美的自定义效果。</p> \n  <h3><a href=\"#特别的-请注意不要复制这三个路径-自行替换您自己的自定义路径\" name=\"特别的-请注意不要复制这三个路径-自行替换您自己的自定义路径\"></a>特别的，请注意不要复制这三个路径，自行替换您自己的自定义路径</h3> \n  <pre><code class=\"xml\">app:month_view=\"com.haibin.calendarviewproject.simple.SimpleCalendarCardView\"\napp:week_view=\"com.haibin.calendarviewproject.simple.SimpleWeekView\"\napp:week_bar_view=\"com.haibin.calendarviewproject.EnglishWeekBar\"\n</code></pre> \n  <p>### </p>\n </body>\n</html>');
INSERT INTO `article` VALUES ('myblog/3.md', 'Site content is written in Markdown format located in `src`. Pull requests welcome!', 'If you are the maintainer of a community translation fork and would like to deploy via Netlify instead of GitHub pages, please ping @yyx990803 in an issue to request a Netlify team membership and DNS update.', '2019-04-15', 0000000022, '<html>\n <head></head>\n <body>\n  <h1><a href=\"#vuejs-org\" name=\"vuejs-org\"></a>vuejs.org</h1> \n  <p>And thank you in advance ;</p>\n </body>\n</html>');

-- ----------------------------
-- Table structure for myblog
-- ----------------------------
DROP TABLE IF EXISTS `myblog`;
CREATE TABLE `myblog`  (
  `blogname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blogurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

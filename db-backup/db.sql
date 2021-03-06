/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.45 : Database - fateblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `t_ad` */

DROP TABLE IF EXISTS `t_ad`;

CREATE TABLE `t_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '',
  `pic` varchar(100) DEFAULT '',
  `link` varchar(100) DEFAULT '',
  `expires` int(11) DEFAULT '0' COMMENT '过期时间',
  `post_time` int(11) DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `pwd` char(32) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `t_imgs` */

DROP TABLE IF EXISTS `t_imgs`;

CREATE TABLE `t_imgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '',
  `tags` varchar(100) NOT NULL DEFAULT '',
  `brief` varchar(200) NOT NULL DEFAULT '',
  `thumb` varchar(200) NOT NULL DEFAULT '',
  `content` text,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `views` int(11) NOT NULL DEFAULT '1',
  `post_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `t_links` */

DROP TABLE IF EXISTS `t_links`;

CREATE TABLE `t_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `link` varchar(100) NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `t_nav` */

DROP TABLE IF EXISTS `t_nav`;

CREATE TABLE `t_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(40) DEFAULT '',
  `navurl` varchar(100) DEFAULT '',
  `isshow` tinyint(4) NOT NULL DEFAULT '1',
  `listorder` int(11) NOT NULL DEFAULT '0',
  `linktype` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 本站链接 2 站外链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `t_post` */

DROP TABLE IF EXISTS `t_post`;

CREATE TABLE `t_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `nav_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属栏目',
  `is_recommend` tinyint(4) DEFAULT '0',
  `list_style` tinyint(4) DEFAULT '1' COMMENT '列表样式 1 小图 2 大图',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `title` varchar(100) DEFAULT '',
  `tags` varchar(60) DEFAULT '',
  `thumb` varchar(200) DEFAULT '',
  `brief` varchar(200) DEFAULT '',
  `views` int(11) DEFAULT '1',
  `post_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `t_post_comment` */

DROP TABLE IF EXISTS `t_post_comment`;

CREATE TABLE `t_post_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论那篇文章',
  `nickname` varchar(60) DEFAULT '',
  `email` varchar(60) DEFAULT '',
  `ip` varchar(60) DEFAULT '',
  `content` varchar(200) DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `client_type` tinyint(4) DEFAULT '0',
  `post_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `t_post_content` */

DROP TABLE IF EXISTS `t_post_content`;

CREATE TABLE `t_post_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT '0',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `t_tips` */

DROP TABLE IF EXISTS `t_tips`;

CREATE TABLE `t_tips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '',
  `intro` varchar(400) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `t_topic` */

DROP TABLE IF EXISTS `t_topic`;

CREATE TABLE `t_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户id',
  `topic_cate_id` int(11) DEFAULT '0' COMMENT '帖子分类id',
  `title` varchar(100) DEFAULT '',
  `brief` varchar(200) DEFAULT '',
  `ip` varchar(60) DEFAULT '',
  `essence` tinyint(4) DEFAULT '0' COMMENT '精华',
  `praise` int(11) DEFAULT '0' COMMENT '赞',
  `status` tinyint(4) DEFAULT '1',
  `comment_number` int(11) DEFAULT '0' COMMENT '评论数',
  `post_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `t_topic_category` */

DROP TABLE IF EXISTS `t_topic_category`;

CREATE TABLE `t_topic_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) DEFAULT '',
  `brief` varchar(100) DEFAULT '' COMMENT '描述',
  `thumb` varchar(200) DEFAULT '' COMMENT '话题图标',
  `is_recommand` tinyint(4) DEFAULT '0' COMMENT '是否推荐',
  `post_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `t_topic_content` */

DROP TABLE IF EXISTS `t_topic_content`;

CREATE TABLE `t_topic_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `t_topic_reply` */

DROP TABLE IF EXISTS `t_topic_reply`;

CREATE TABLE `t_topic_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论那篇话题',
  `uid` int(11) NOT NULL DEFAULT '0',
  `content` varchar(200) NOT NULL DEFAULT '',
  `floor` int(11) NOT NULL DEFAULT '0' COMMENT '楼层',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `post_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` tinyint(4) DEFAULT '1' COMMENT '0女 1男 2保密',
  `username` varchar(60) DEFAULT '',
  `password` char(32) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `avatar` varchar(200) DEFAULT '',
  `truename` varchar(60) DEFAULT '',
  `phone` varchar(60) DEFAULT '',
  `shortintro` varchar(200) DEFAULT '',
  `regtime` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='会员表';

/*Table structure for table `t_user_credit` */

DROP TABLE IF EXISTS `t_user_credit`;

CREATE TABLE `t_user_credit` (
  `uid` int(11) DEFAULT '0',
  `score` double DEFAULT '0',
  `experience` double DEFAULT '0',
  UNIQUE KEY `userid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='用户积分表';

/*Table structure for table `t_user_level` */

DROP TABLE IF EXISTS `t_user_level`;

CREATE TABLE `t_user_level` (
  `levelname` varchar(20) DEFAULT '',
  `minscore` int(11) DEFAULT '0',
  `maxscore` int(11) DEFAULT '0',
  `levelnum` int(11) DEFAULT '1' COMMENT '等级编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='用户等级表';

/*Table structure for table `t_vod` */

DROP TABLE IF EXISTS `t_vod`;

CREATE TABLE `t_vod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vod_cate_id` int(11) DEFAULT '0',
  `vod_year` int(11) DEFAULT '0',
  `vod_name` varchar(100) DEFAULT '',
  `vod_tip` varchar(50) DEFAULT '',
  `vod_area` varchar(20) DEFAULT '',
  `vod_tags` varchar(60) DEFAULT '',
  `vod_actor` varchar(100) DEFAULT '' COMMENT '演员',
  `vod_director` varchar(60) DEFAULT '' COMMENT '导演',
  `vod_pic` varchar(200) DEFAULT '' COMMENT '图片地址',
  `vod_posttime` int(11) DEFAULT '0',
  `vod_updatetime` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `t_vod_detail` */

DROP TABLE IF EXISTS `t_vod_detail`;

CREATE TABLE `t_vod_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vod_id` int(11) DEFAULT '0',
  `vod_brief` text COMMENT '简介',
  `vod_url` text COMMENT '视频地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `t_comment_center`;
CREATE TABLE `t_comment_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '项目编号 1 视频',
  `client_type` smallint(6) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `project_inner_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目内编号 比如文章的编号',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父评论编号',
  `uid` int(11) NOT NULL DEFAULT '0',
  `praise` int(11) NOT NULL DEFAULT '0',
  `post_time` int(11) NOT NULL DEFAULT '0',
  `nick` varchar(60) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

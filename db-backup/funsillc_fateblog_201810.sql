-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2018-11-06 20:32:40
-- 服务器版本： 10.1.36-MariaDB-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `funsillc_fateblog`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_ad`
--

CREATE TABLE `t_ad` (
  `id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `pic` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `link` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `expires` int(11) DEFAULT '0' COMMENT '过期时间',
  `post_time` int(11) DEFAULT '0' COMMENT '发布时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_ad`
--

INSERT INTO `t_ad` (`id`, `title`, `pic`, `link`, `expires`, `post_time`) VALUES
(1, '声之形', '/upload/201808/koenokatachi3.jpg', '/posts?id=8', 1553794452, 1533784505),
(2, 'Fate/stay night', '/upload/201808/fate-saber1.jpg', '/posts?id=10', 1553794452, 1533885505);

-- --------------------------------------------------------

--
-- 表的结构 `t_admin`
--

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT '',
  `pwd` char(32) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_admin`
--

INSERT INTO `t_admin` (`id`, `name`, `pwd`) VALUES
(1, 'admin', 'c8511d769ed67c8d40efa5ba529dd832');

-- --------------------------------------------------------

--
-- 表的结构 `t_links`
--

CREATE TABLE `t_links` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL DEFAULT '',
  `link` varchar(100) NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_nav`
--

CREATE TABLE `t_nav` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(40) CHARACTER SET utf8 DEFAULT '',
  `navurl` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `isshow` tinyint(4) NOT NULL DEFAULT '1',
  `listorder` int(11) NOT NULL DEFAULT '0',
  `linktype` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 本站链接 2 站外链接'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_nav`
--

INSERT INTO `t_nav` (`id`, `pid`, `title`, `navurl`, `isshow`, `listorder`, `linktype`) VALUES
(1, 0, '动漫', 'anime', 1, 0, 1),
(2, 0, '游戏', 'game', 1, 0, 1),
(3, 0, '周边衍生', 'around', 1, 0, 1),
(4, 0, '杂谈', 'news', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_post`
--

CREATE TABLE `t_post` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT '0',
  `nav_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属栏目',
  `is_recommend` tinyint(4) DEFAULT '0',
  `list_style` tinyint(4) DEFAULT '1' COMMENT '列表样式 1 小图 2 大图',
  `title` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `author` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `tags` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `thumb` varchar(200) CHARACTER SET utf8 DEFAULT '',
  `brief` varchar(200) CHARACTER SET utf8 DEFAULT '',
  `views` int(11) DEFAULT '1',
  `post_time` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_post`
--

INSERT INTO `t_post` (`id`, `uid`, `nav_id`, `is_recommend`, `list_style`, `title`, `author`, `tags`, `thumb`, `brief`, `views`, `post_time`) VALUES
(1, 1, 1, 0, 2, '动漫：《噬血狂袭》', '月十', '动漫', '/upload/201808/shixuekx.jpg', '《噬血狂袭》，简称“血袭”（ストブラ），为三云岳斗所创作，麻喵子负责插画的日本轻小说。经由电击文库自 2011 年 5 月起出版发行。', 32, 1464533773),
(2, 1, 1, 1, 2, '动漫：《白色相簿 2 》', '月十', '动漫', '/upload/201808/whitealbum2.jpg', '由游戏改编的动漫一向比较好看，这里推荐一部《白色相簿 2》。小编感觉这部动漫从人物塑造，画风到剧情都还不错。白色相簿系列发行了游戏、漫画、动画、小说、周边等，可以说很成功了。', 38, 1464667800),
(3, 1, 1, 1, 2, '动漫：《樱花庄的宠物女孩》', '月十', '动漫', '/upload/201808/sakurasou.jpg', '《樱花庄的宠物女孩》（日文：さくら荘のペットな彼女）是轻小说家鸭志田一著作，插画家沟口凯吉负责插画，电击文库 （ 隶属 MediaWorks ） 所属的轻小说', 10, 1464754200),
(4, 1, 1, 1, 2, '动漫：《灰色的果实》', '月十', '动漫|灰色三部曲', '/upload/201808/grisaia.jpg', '《灰色的果实》是灰色三部曲《灰色的果实》，《灰色的迷宫》，《灰色的乐园》的第一部，是日本游戏开发商 FrontWing 开发的一款成人向游戏，于 2011 年 2 月 25 日发售', 27, 1465543626),
(5, 1, 1, 1, 2, '动漫：《染红的街道》', '月十', '动漫|空之三部曲', '/upload/201808/qihongdejiedao.jpg', '《染红的街道》（日语：あかね色に染まる坂）是由 feng 制作的一部游戏。', 8, 1468209600),
(6, 1, 2, 1, 2, '游戏：病娇模拟器', '月十', '游戏', '/upload/201808/bingjiaomoniqi.jpg', '病娇模拟器，原名 Yandere Simulator ，这款游戏是一个自由度超高的个人项目，目前还没有开发完成，可以下载调试版试玩。', 27, 1486872000),
(7, 1, 1, 1, 1, '动画电影：《借东西的小人阿莉埃蒂》', '月十', '动漫|动画电影', '/upload/201808/jiewuxiaoren.jpg', '动漫改编自英国作家玛丽·诺顿的小说作品，讲述生活在郊外房子地板下身长 10 厘米的 14 岁少女，与来此疗养的少年相识的故事。', 84, 1489312817),
(8, 1, 1, 1, 2, '动画电影：《声之形》', '月十', '动漫|动画电影', '/upload/201808/koenokatachi3.jpg', '《声之形》（日语：映画 聲の形）是由京都动画制作的一部动画电影，根据大今良时的漫画《声之形》改编。于 2016 年 9 月 17 日在日本上映。', 21, 1503918000),
(9, 1, 1, 1, 2, '动画电影：《你的名字。》', '月十', '新海诚|动画电影', '/upload/201808/yourname2.jpg', '《你的名字。》（日语：君の名は。）是由新海诚导演的， CoMix Wave Films 制作的动画电影。并有小说、漫画等衍生作品。', 33, 1504263600),
(10, 1, 2, 1, 2, '游戏： Fate/stay night', '月十', 'fate', '/upload/201808/fate.jpg', '《Fate / stay night》（日语：フェイト/ステイナイト)，简称 stay night ，是由 TYPE-MOON 于 2004 年 1 月 30 日发售的 PC 平台文字冒险游戏。', 73, 1505127600),
(11, 1, 1, 1, 2, '动画电影：《大鱼海棠》', '月十', '动漫|动画电影', '/upload/201808/dayuhaitang.jpg', '《大鱼海棠》于 2016-07-08 上映，单从电影的构思，引入了平行世界观，有了其他种族和人类的互动，定位已经不再是老少咸宜了，主打成人市场，可以说在国产动画里很创新了。', 35, 1506855600),
(12, 1, 1, 1, 2, '动漫：《工作细胞》', '月十', '动漫', '/upload/201808/gongzuoxibao.jpg', '《工作细胞》（日语：はたらく細胞）是由日本漫画家清水茜于漫画杂志《月刊少年天狼星》（月刊少年シリウス）上连载的一部细胞拟人漫画。后由 david production 改编成电视动画。', 31, 1535628948),
(13, 1, 1, 1, 2, '《Fate / stay night》电视动画及剧场版简介', '月十', 'fate', '/upload/201809/fate.jpg', '《 Fate/stay night 》（日语：フェイト/ステイナイト)，简称 stay night ，是由 TYPE-MOON 于 2004 年 1 月 30 日发售的 PC 平台文字冒险游戏/视觉小说。游戏一共三条线路： Fate 、Unlimited Blade Works 、Heaven\'s Feel ，分别对应 Saber 、远坂凛、间桐樱三位女主角。', 58, 1535788759),
(14, 1, 1, 1, 2, '动画电影：《红辣椒》', '月十', '今敏', '/upload/201809/YVibJZ20180912055736.jpg', '《 Paprika 》（中文：红辣椒 或 盗梦侦探）是日本著名动画导演今敏所导的动画电影。于 2006 年 9 月在威尼斯国际电影节首映， 2006 年 11 月 25 日在日本放映。', 18, 1536732003),
(15, 1, 2, 0, 1, '看懂游戏分级制度', '月十', '游戏', '/upload/201809/gsrr.png', '游戏分级是一种用于分别视频游戏对各年龄人士的合适度的分级。大部份分级系统都是由政府资助非营利性组织。大部分国家都会对视频游戏做内容分级。', 14, 1537262750),
(16, 1, 1, 1, 2, 'fate 美食番《卫宫家今天的饭》', '月十', 'fate', '/upload/201809/weigongfan.jpg', '《卫宫家今天的饭》(日语：衛宮さんちの今日のごはん)是漫画家 TAa 的漫画作品。后由 ufotable 将其改变为电视动画。营造了一个温柔的世界观', 24, 1538308401),
(17, 1, 3, 0, 2, '《约会大作战》狂三，富士见周年纪念手办', '月十', '手办', 'http://wx3.sinaimg.cn/mw690/77719d27ly1fvzsypenf7j20go0m8n0f.jpg', 'KADOKAWA 作品《约会大作战》中主角之一「時崎狂三」，在富士见文库 （日文：ファンタジア文庫） 30 周年纪念之际，按照 1:7 比例手办化', 8, 1538908287),
(18, 1, 1, 1, 2, '动漫：《秒速五厘米》', '月十', '新海诚', '/upload/201810/miaosu.jpg', '《秒速5厘米》（日语：秒速びょうそく5センチメートル）是由新海诚创作和制作的一部动画电影，于 2007 年 3 月 3 日在日本上映，并有小说、漫画等衍生作品。', 16, 1539341984),
(19, 1, 1, 1, 2, 'TV 动画：她和她的猫', '月十', '新海诚', '/upload/201810/hercat.jpg', '《她和她的猫》（日语：彼女と彼女の猫）原本是由新海诚自主制作的 5 分钟黑白动画。2016 Lidenfilms 将原动画重新制作，内容相当于原黑白动画之前的故事。', 14, 1540982167);

-- --------------------------------------------------------

--
-- 表的结构 `t_post_comment`
--

CREATE TABLE `t_post_comment` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论那篇文章',
  `nickname` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `email` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `ip` varchar(60) DEFAULT '',
  `content` varchar(200) CHARACTER SET utf8 DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `client_type` tinyint(4) DEFAULT '0',
  `post_time` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_post_comment`
--

INSERT INTO `t_post_comment` (`id`, `pid`, `post_id`, `nickname`, `email`, `ip`, `content`, `status`, `client_type`, `post_time`) VALUES
(1, 0, 13, '阿福', 'yulifu@douyu.tv', '36.110.77.218', '嗯', 1, 0, 1536644205);

-- --------------------------------------------------------

--
-- 表的结构 `t_post_content`
--

CREATE TABLE `t_post_content` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT '0',
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_post_content`
--

INSERT INTO `t_post_content` (`id`, `post_id`, `content`) VALUES
(1, 1, '<p>《噬血狂袭》，简称“血袭”（ ストブラ ），为三云岳斗所创作，麻喵子负责插画的日本轻小说。经由电击文库自 2011 年 5 月起出版发行。</p><p>TV 动画：</p><p>从 2013 年 10 月开始播放 TV 动画，正片一共 24 话，讲述了被认为是世界最强<a href=\"/search?k=吸血鬼\" target=\"_blank\">吸血鬼</a>&nbsp;“第四真祖” 的少年晓古城，和被派来监视他的剑巫少女姬柊雪菜相遇，并一起被卷入一连串超出常理的事件的校园奇幻故事。<br></p><p><a href=\"/search?k=动漫\" target=\"_blank\">动漫</a>本身的情节还算紧凑，打斗场景比重也很大，也有色色的镜头，结尾也是温馨的。唯一我感觉不足的就是正片中几个配角的故事没有讲明白，在 ova 中有所补充，但是也是杯水车薪。总的来说值得一看。</p><p><img src=\"/upload/201808/shixuekx.jpg\"></p><p><br></p><blockquote><p>动画官网 - http://www.strike-the-blood.com</p></blockquote>'),
(2, 2, '<p>由<a href=\"/search?k=游戏\" target=\"_blank\">游戏</a>改编的动漫一向比较好看，这里推荐一部《白色相簿 2》。小编感觉这部动漫从人物塑造，画风到剧情都还不错。白色相簿系列发行了游戏、漫画、动画、小说、周边等，可以说很成功了。</p><p>原作游戏：</p><p>《WHITE ALBUM 2》，又称《白色相簿 2 之白楼梦》（日语：ホワイトアルバム2）是由 <mark data-id=\"4\">Leaf</mark> 制作的一部<a href=\"/search?k=十八禁\" target=\"_blank\">十八禁</a>游戏，游戏分为两部分发售： introductory chapter ( 通称 IC 或 序章 ) 和 closing chapter ( 通称 CC 或 终章 ) ，而终章包含「终章 - 初回限定版」和「最终章 - 序章 + 终章套装版」两部分。</p><p>IC 于 2010 年 3 月 26 日发售， CC 于 2011 年 12 月 22 日发售。</p><p>本部作品虽然和前作「WHITE ALBUM」名字相同，但与前作并无多少剧情上的关系，两者共同之处在于故事同样发生于冬季，而且主题比较悲伤。所以后来出现了一个梗：<b>又到了白色相簿的季节</b>，用以说明比较悲伤的场景。所不同的是，前作的整体概念在于「出轨」的主题，同时缔造了<a href=\"/search?k=动漫\">动漫</a>四大人渣之首。而本作则更倾向于青空下的约定之类的较为温柔的世界观。</p><p><img src=\"/upload/201808/whitealbum.jpg\"></p><p>衍生品：</p><p>《White Album 2 Mini After Story》即《白色相簿 2 迷你后传》一款故事向的游戏。讲述了 Kazusa （冬马和纱） 和 Setsuna （小木曾雪菜） 真实结局的故事。于&nbsp;2014-12-25 发行。</p><p>TV 动画</p><p>《WHITE ALBUM2 幸せの向こう侧》即《WHITE ALBUM2 幸福的彼端》于 2013 年 10 月 6 日凌晨 1 点 30 分在「TOKYO MX」开播。</p><p><img src=\"/upload/201808/whitealbum3.jpg\"></p><p><br></p><blockquote><p>正版视频 - https://ch.nicovideo.jp/whitealbum2</p></blockquote><p><br></p><blockquote><p>动画官网 - https://whitealbum2.jp</p><p>官方 Twitter - https://twitter.com/wa2_anime</p><p>视觉小说数据库 - https://vndb.org/v16493</p></blockquote>'),
(3, 3, '<p>《樱花庄的宠物女孩》（日文：さくら荘のペットな彼女）是轻小说家鸭志田一著作，插画家沟口凯吉负责插画，电击文库 （ 隶属 MediaWorks ） 所属的轻小说。小说从 2010 年 1 月 10 号开始，一共出版了 10 卷主卷及 5.5 7.5 10.5 三卷分卷。书籍详情 - http://asciimw.jp/search/mode/gr/gr/鴨志田一<br></p><p data-role=\"info\">MediaWorks 是日本角川控股集团旗下以次文化、游戏为主拥有“电击”等品牌的出版社， ASCII 公司为日本一家以电脑杂志为主的出版社。2008 年 4 月 1 日， MediaWorks 吸收合并 ASCII ，商号变更为“株式会社 ASCII MEDIA WORKS”</p><p>作品主要讲述了就读水明艺术大学附属高中的神田空太，一年级夏天时在宿舍养猫，而被校长叫去问话，并要求把猫赶走，不然就搬出宿舍。身为爱猫一族的空太，企图反抗权威，结果被撵出宿舍，流落到恶名昭彰的“樱花庄”。 隔年春天，随着世界级天才画家椎名真白搬进了樱花庄，神田空太开始过起被这名缺乏常识的少女耍得团团转的日子。<br></p><p>动画：</p><p>2012 年 4 月 10 号在动画官网&nbsp;http://sakurasou.tv 宣布决定制作 TV 动画。并于 2012 年 10 月 15 日开始在日本最大视频服务商 NicoNico 放送。</p><p><img src=\"/upload/201808/sakurasou.jpg\"></p><p><br></p><blockquote><p>参考 动画官网 - http://sakurasou.tv</p></blockquote>'),
(4, 4, '<p>《灰色的果实》是<a href=\"/search?k=灰色三部曲\" target=\"_blank\">灰色三部曲</a>《灰色的果实》，《灰色的迷宫》，《灰色的乐园》的第一部，是日本游戏开发商 FrontWing 开发的一款成人向游戏，于 2011 年 2 月 25 日发售。有许多人评价其为能改变人生的 gal 。</p><p>灰色三部曲按照剧情顺序为：<a href=\"/search?k=灰色的迷宫\" target=\"_blank\">灰色的迷宫</a>，<a href=\"/search?k=灰色的果实\" target=\"_blank\">灰色的果实</a>，<a href=\"/search?k=灰色的乐园\" target=\"_blank\">灰色的乐园</a>。</p><p>按照作品发行顺序：灰色的果实，灰色的迷宫，灰色的乐园。</p><p>「灰色的迷宫」是「灰色的果实」的续作，内容收录了果实里五位女主角的后日谈，并加入其他新剧本，同时还有前传故事，介绍男主角雄二过去的 “ Caprice 之茧” 路线。而「灰色的乐园」则是前两作的完结篇，承接前作剧本 “ Caprice 之茧” ，讲述主人公风见雄二在被西斯·奥斯罗抓走之后的故事。</p><p>本作讲述了主人翁风见雄二转学到一所只有五名性格迥异少女的美浜学院，并与她们在校园发生的故事。</p><p>TV 动画：</p><p>电视动画于 2014 年 10 月 5 日 24 点 30 分，也就是 10 月 6 日 0 点 30 分在「 TOKYO MX 」等多家电视台播放。讲述了主角风见雄二作为唯一一名男生转入与世隔绝的美滨学园中并于其中的女孩一起经历逸闻趣事生活的故事。</p><p data-role=\"info\">日本电视节目很多会排到第二天凌晨，这个凌晨期间的节目也算是前一天的，所以就有了超过 24 点的计时。</p><p><img src=\"/upload/201808/grisaia.jpg\"></p><p><br></p><blockquote><p>动画官网 - http://www.grisaia-anime.com</p></blockquote>'),
(5, 5, '<p>《染红的街道》（日语：あかね色に染まる坂）是由 <mark data-id=\"6\">feng</mark> 制作的一部游戏。包装盒及官方网站上的标语是“给全国 2000 万的傲娇爱好者和非爱好者的戏剧性的傲娇未婚妻 &amp; 妹 AVG ”。<br></p><p>作为 feng 社空之三部曲的第二部（《望见青空之丘》、《染红的街道》、《架向星空之桥》），讲述了主人公长濑准一原本和妹妹长濑凑一起过着两人平凡生活，不料却被主人公所救且在学校发生了亲吻事件的一个女生片桐优姬所逼婚，而后开展了主人公及妹妹和被救少女的三人同居生活的故事。</p><p>TV 动画：</p><p>TV 动画版从 2008 年 10 月 10 号晚上 25 点 30 分在 <mark data-id=\"5\">「Tokyo MX」</mark>及「KBS 京都」等电视台同步播出，电视动画剧和游戏还是有所不同的。</p><p><img src=\"/upload/201808/qihongdejiedao.jpg\"></p><p><br></p><blockquote><p>动画官网 - http://www.marv.jp/special/akasaka</p><p>染红的街道官网 - http://www.akane-iro.jp</p></blockquote>'),
(6, 6, '<p>病娇模拟器，原名 Yandere Simulator ，为一款个人独立游戏，早在 2014 年 4 月便开始研发，目前游戏还没有开发完成，但可以下载调试版试玩。<br></p><p>Yandere Simulator 是一款自由度颇高的秘密游戏，在游戏中玩家扮演一个对学长有好感的少女，并秘密跟踪他，除掉任何迷恋学长的人，与此同时还要保持一个无辜的女学生的形象。可以说是个 非常に変態なゲーム 。<br></p><p>游戏部分内容：</p><p>每个星期，会有一个新女孩爱上你的学长 - 你必须在她周五向学长表白之前消灭她！消灭的方式由你自己决定。你可以让她和另一个男孩约会，毁掉她的名声；以某种方式让她被学校开出；破坏她与学长的互动，直到学长讨厌她；或绑架她并让她被困在你的地下室；或者，如果你喜欢更直接的方法，你可以在没人看到的时候 kill her ！<br></p><p>当你犯下谋杀罪时，你必须自己清理现场。用拖把和一桶水擦去你留下的所有血迹，处理任何带有指纹的谋杀武器，incinerate corpses to cover up all evidence of your crimes！小心 - 有些学生会拍下你的照片，如果他们看到你犯了谋杀罪，就会向警方报案。简直不可思议。<br></p><p><img src=\"/upload/201808/bingjiaomoniqi.jpg\"></p><p><br></p><blockquote><p>游戏官网 - https://yanderesimulator.com</p></blockquote>'),
(7, 7, '<p>《借东西的小人阿莉埃蒂》是日本吉卜力工作室制作的动画电影，也是米林宏昌执导的首部电影。影片于 2010 年 7 月 17 日在日本正式上映。<br></p><p>动漫改编自英国作家玛丽·诺顿的小说作品，讲述生活在郊外房子地板下身长 10 厘米的 14 岁少女，与来此疗养的少年相识的故事。</p><p>本部作品虽然不是宫崎骏亲自导演，但是米林宏昌是他推荐的，虽然没有达到《千与千寻》那样的高度，但是也让人看到了在宫崎骏之后还有优秀的动漫后辈。</p><p>电影虽然只是简单的讲了一个平淡无奇的叙事故事，但是细细想来，世间各种生物包括人类与自然的关系不正是和借物小人一样吗，小情节中蕴藏大道理。</p><p><img src=\"/upload/201808/jiewuxiaoren.jpg\"></p><p><br></p><blockquote><p>动画官网介绍 - http://www.ghibli.jp/karigurashi</p></blockquote>'),
(8, 8, '<p>《声之形》（日语：映画 聲の形）是由京都动画制作的一部动画电影，根据大今良时的漫画《声之形》改编。于 2016 年 9 月 17 日在日本上映。<br></p><p>厌恶“无聊之事”的少年石田将也在小学欺负先天性听觉障碍的转学生西宫硝子并在之后被同学孤立，陷入孤独和自我厌恶中，一度想自杀。而深知自身缺陷怕给别人带来困扰而努力对人微笑的西宫硝子被欺负后也封锁了自己，也想到唯有自杀才是解脱。影片围绕石田将也和西宫硝子，及四周的同学，讲述了 TA 们试图接受自己及接受他人的故事。电影还与日本文部科学省展开合作，在日本全国的中小学校展开宣传，以起到防止校园欺凌及自杀，并对残障儿童的关怀进行普及的作用。</p><p>影片中各角色性格鲜明，男主角石田将也年少不羁，女主角西宫硝子柔弱的让人怜爱，各个配角也性格迥异，各个角色的分量意外的均衡。</p><p>全片氛围较为沉重，但也有快了和煽情片段，尤其是在下半场女主经过精心打扮，还留了马尾辫跑到男主面前用蹩脚的发音对男主说“我喜欢你”时，感觉有点欣慰，也有点伤感，又有点共鸣，竟一度哽咽。像雨后阳光穿过乌云投射的光芒，背后的艰辛谁人能知呢。</p><p><img src=\"/upload/201808/koenokatachi2.jpg\"></p><p>整体来看，电影画面精良，信手截屏就可得壁纸，剧中对人物心理的刻画很细致，在不同情境下人物会有不同的小动作。片中除主角外其他角色都或多或少有自己的问题，接受自己，接受别人，活下去，这大概就是影片要讲的吧。</p><p><img src=\"/upload/201808/koenokatachi.jpg\"></p><p><br></p><blockquote><p>电影官网 - http://koenokatachi-movie.com</p></blockquote>'),
(9, 9, '<p>《你的名字。》（日语：君の名は。）是由新海诚导演的， <mark data-id=\"7\">CoMix Wave Films</mark> 制作的动画电影。并有小说、漫画等衍生作品。</p><p>影片围绕千年彗星撞地球这一灾难，讲述了向往大都市生活的糸守町高中生宫水三叶及住在东京的高中生立花泷之间的穿越时空的爱情故事。</p><p>如果看过新海诚其他的作品，可能会知道新海诚的作品一向立意比较深，很难看懂，一般是整剧都看完了，还不知道故事讲的是什么，而且故事中的主角很难有圆满的结局。然而在《你的名字。》中却是个催泪的还算完美的结局。</p><p>新海诚的作品向来作画美轮美奂，有着“每一帧都是屏保”的高赞誉，当然《你的名字。》不仅仅有唯美的画面，而且还有着耐听的配乐、思维缜密的故事构思。相比于以往的作品，本作品叙事完整清晰，故事跌宕起伏，剧情分镜衔接恰当，步步带入。电影的取景参照了很多日本的真实地点，当时引发了很多人到日本实地巡礼。</p><p><img src=\"/upload/201808/yourname3.jpg\"></p><p>电影于 2016 年 8 月 26 日在日本上映。电影的原著小说由角川文库于 2016 年 6 月 18 日发行。</p><p><img src=\"/upload/201808/yourname2.jpg\"></p><p><br></p><blockquote><p>动画官网 - http://www.kiminona.com</p></blockquote>'),
(10, 10, '<p>《Fate / stay night》（日语：フェイト/ステイナイト)，简称 stay night ，是由 <mark data-id=\"9\">TYPE-MOON</mark> 于 2004 年 1 月 30 日发售的 PC 平台文字冒险游戏/视觉小说。现在想想早在 04 年的游戏，人物画风放到今日仍旧跟得上人们的审美。</p><p>游戏故事发生在冬木市，在那里被圣杯选中参加仪式的 7 位魔术师，会由圣杯赐予从者，并与之订立契约，之后互相厮杀，最后成功活下来的一组会得到传说中可实现持有者一切愿望的宝物 - 圣杯。<br></p><p>作品中的主线共三条： Fate （命运）、 Unlimited Blade Works （无限剑制）、 Heaven&#39;s Feel （天之杯），分别对应 Saber 、远坂凛、间桐樱三位女主角， 5 个线路结局（ Fate 一个： True End - 梦的延续、 Unlimited Blade Works 两个： Good End - sunny day 和 True End - brilliant years 、 Heaven&#39;s Feel 两个： Normal End - 樱之梦 和 True End - 春天归来）。每一条线都会带给玩家深深的震撼及感动。<br></p><p>游戏中每一条线都会带给玩家深深的震撼及感动，特色鲜明的人物，扣人心弦的剧情，恰到其份的背景音乐，往往玩到一个结局不知不觉已泪流满面。这就是 Fate 成功的原因吧。</p><p><video src=\"http://music.163.com/song/media/outer/url?id=35270622.mp3\" poster=\"/upload/201808/fate-saber1.jpg\" controls=\"controls\"></video></p><p>游戏三条线的顺序是固定的，一<mark data-id=\"8\">周目</mark>进入 Fate 线，通过后，二周目会进入 Unlimited Blade Works 线，三周目进入 Heaven&#39;s Feel 线。</p><p>本部游戏最成功的就是将 Saber （中文：阿尔托利亚·潘德拉贡 - 日文：アルトリア・ペンドラゴン ）女性化了，塑造了一个温文尔雅、端庄秀丽、温柔贤淑的形象。生前为大不列颠国王，由于目睹了国家的灭亡，所以将死之际与阿赖耶定下契约，即使付出永堕轮回的代价，也希望得到圣杯许下愿望「重回选王之日」。因此人们亲切的称为“吾王”， Saber 也成了 Fate 系列的代表人物。尤其是头上的一束呆毛更为 Saber 增加了呆萌的属性。</p><p><img src=\"/upload/201808/fate-saber2.jpg\"></p><p>游戏之外的亚瑟王神话小说 （以下内容参考《亚瑟王之死》小说）<br></p><p>亚瑟·潘德拉贡 (Arthur Pendragon) ，父亲是尤瑟·潘德雷根，母亲是依格林。亚瑟王传说体系庞大，前后涉及 150 名圆桌骑士、 12 场大型战役，它的形成经历了数百年漫长的演变。《亚瑟王之死》是第一部完整记录亚瑟王及其圆桌骑士传奇故事的小说，由英格兰骑士托马斯·马洛礼爵士汇编而成。<br></p><p>《亚瑟王之死》在内容编排上分为“亚瑟称王 - 圆桌骑士 - 圣杯传奇 - 亚瑟之死”四个核心章节，架构了亚瑟王在魔法师梅林的辅佐下结束国内混战，统一英格兰，聚拢圆桌骑士开创盛世，在辉煌时代追寻圣杯，最后遭遇背叛身亡的完整故事。<br></p><p>传说亚瑟王墓碑上有这样两句碑文：<br></p><p>亚瑟长眠于此。曾经为王，终将成王。</p><p>亚瑟称王：<br></p><p>尤瑟·潘德雷根国王死后，王国处于危机之中，许多有权势的人想篡夺皇位。梅林提议让所有骑士贵族在圣诞节齐聚伦敦最大的教堂。教堂正中矗立着一方形巨石，巨石中央插着一把剑身出鞘的宝剑，剑身刻有两行金字：拔剑离石者，即生而为英格兰命定之王。所有人都没能撼动宝剑，唯有亚瑟将剑拔了出来，在梅林的拥护下当上了英格兰王。<br></p><p>获得王者之剑 Excalibur ：<br></p><p>亚瑟王外出期间与一位名叫帕林诺的骑士格斗，最终获胜，但自己的宝剑（石中剑）被骑士砍断，身体也受了伤。梅林指引亚瑟王来到圣湖，跟随湖中仙女在湖中心得到了被称为“王者之剑“的圣剑和剑鞘 Excalibur 。<br></p><p>梅林问亚瑟王更喜欢剑还是剑鞘，亚瑟王回答更喜欢剑。梅林说：“你错了，这鞘的价值超过剑十倍，只要你将剑鞘带在身边，不管受到多重的伤，都不会流一滴血，你千万要将剑鞘保管好”。传说该剑在阿瓦隆所铸。有关阿瓦隆相关的信息可以在玛丽昂·齐默·布拉德利（ Marion Zimmer Bradley ）著作的《阿瓦隆迷雾》系列小说了解，但须注意不同小说对神话故事的阐述是不同的，内容关联性不是很强。<br></p><p>圣杯传奇：<br></p><p>在小说《亚瑟王之死》中，只要圣杯出现，便会赐予人们美酒佳肴，它光芒万丈，散发幽香，使人如沐圣灵，人们视圣杯如上帝般存在。但是圣杯只会突然出现又突然消失，没人真正见到过圣杯，所以亚瑟王的圆桌骑士们想去寻找圣杯，一睹真容。由此骑士们踏上了寻找圣杯的冒险之旅。<br></p><p>亚瑟之死：<br></p><p>在亚瑟王攻打兰斯洛特爵士的时候，莫德雷德假造信函说亚瑟王在交战中阵亡。莫德雷德强迫众大臣推选自己为全英格兰王。亚瑟王听说后放弃围攻兰斯洛特，准备讨伐莫德雷德。双方数十万人在索尔兹伯里附近的平原进行前了所未闻的激烈战斗，亚瑟方最终只剩下亚瑟王和卢坎、贝德维尔三人，莫德雷德方只剩他自己一人。亚瑟王一心想亲手杀掉莫德雷德，用长矛刺中了莫德雷德的身体，莫德雷德知道自己受了致命伤，使尽全力用宝剑刺穿了亚瑟王的头盔。<br></p><p>亚瑟王受了重伤，他让贝德维尔把“王者之剑“丢回湖中去，并回来报告看到的情况。贝德维尔口中答应但觉得丢了这宝剑可惜，于是将宝剑藏到了一棵树下。亚瑟问贝德维尔看到了什么，贝德维尔说除了水波什么也没有。亚瑟王知道贝德维尔说谎，又让他去扔一次剑。贝德维尔又没下决心扔掉，回去报告情况，亚瑟王认为贝德维尔骗了自己两次，认为贝德维尔是一个不诚实的骑士，发怒说要是不扔了宝剑就亲手杀了贝德维尔。贝德维尔最后将一根腰带系在剑柄上朝湖中投去，水面忽然伸出一只手，接住宝剑挥动了三次后沉入水中不见了。之后贝德维尔向亚瑟王报告了情况，亚瑟王才安心。之后贝德维尔将亚瑟王带到湖边，湖边停泊着一条小船，船上的人将亚瑟王接走了。贝德维尔问自己以后怎么办，亚瑟王说：“你好自为之吧，我这次要去阿瓦隆山谷疗伤，为我祈祷吧”。之后贝德维尔做了修道士，一直在教堂生活。<br></p><p>出场人物：</p><p>尤瑟·潘德雷根 （ Uther Pendragon ）：前英格兰王，亚瑟王父亲<br></p><p>依格林：原康沃尔领主丁塔吉尔公爵的妻子，后嫁给尤瑟·潘德雷根<br></p><p>梅林 （ Merlin ）：亚瑟王的引导者，不列颠魔法师，精通魔法甚至能预知生死<br></p><p>摩根勒菲 （ Morgan le Fay ）：亚瑟王的同母异父的姐姐，依格林与丁塔吉尔公爵的女儿<br></p><p>兰斯洛特 （ Lancelot ）：亚瑟王最伟大的圆桌骑士之一，后因与桂妮薇儿地下恋情曝光，被亚瑟王围攻<br></p><p>桂妮薇儿 （ 或称 桂妮维娅 英文： Guinevere ）：凯姆里德王国罗德格伦斯王的女儿，亚瑟王王后<br></p><p>莫德雷德 （ Medraut 、 Mordred ）：亚瑟王与奥克尼王国罗特王后玛格丝的私生子<br></p><p>贝德维尔 （ 或称 贝狄威尔 英文： Bedivere ）：亚瑟王圆桌骑士之一，看护亚瑟王到最后的骑士之一<br></p><p>卢坎 （ Lucan ）：卢坎是亚瑟王手下的圆桌骑士之一，同时也是亚瑟王的御厨<br></p><p><br></p><blockquote><p>《亚瑟王之死》</p><p>FSN 官网 - http://www.fate-sn.jp</p><p>游戏原声 - https://music.163.com/#/album?id=2915183</p></blockquote>'),
(11, 11, '<p>《大鱼海棠》于 2016-07-08 上映，单从电影的构思，引入了平行世界观，有了其他种族和人类的互动，定位已经不再是老少咸宜了，主打成人市场，可以说在国产动画里很创新了。<br></p><p>影片讲述了居住在“神之围楼”里的一个名叫椿的女孩变作一条海豚到人间巡礼，被网困住，人类男孩因为救她死去。为了报恩而帮助死后男孩的灵魂 - 一条拇指那么大的小鱼，成长为一条比鲸更大的鱼并回归大海的故事。中间还穿拆了爱情的纠葛。<br></p><p>从讲故事层面说说《大鱼海棠》</p><p>好故事一定是构建自己的模型，而不是论述陈贵俗套：<br></p><p>这点《大鱼海棠》做的就很好，如果只是老生常谈的叙述一个爱情故事，观众早已审美疲劳，估计不会有什么共鸣。《大鱼海棠》则标新立异，大胆引入人类之外的新世界、新元素，让人眼前一亮。</p><p>人们往往乐于沉浸在虚构的世界，一旦进入这个世界，就会在各种人物及其冲突的深处重新发现自己，找到另一个人性，体验另一种生活，在这里可以充分发挥想想，宣泄感情。</p><p>动漫之所以受欢迎，就是因为它可以构建出现实世界描绘不出的场景。想想以前看过的令你印象深刻的日本动漫，是不是在结局时，你还沉浸其中，不能自拔。这也是异世界的魅力。<br></p><p>好故事一定是一丝不苟的：<br></p><p>一个故事从灵感闪现到最终定稿，是一个漫长的过程，需要创作出缜密的世界，人物和故事，后期还要反复修正雕琢。《大鱼海棠》的故事的设定相对于其构建的世界来说，显得分量轻了一点，故事没能完美的衬托起宏大的世界观，故事叙说不够细腻，情节发展显得比较突兀。如果好好雕琢丰富一下故事本体，可能就好多了。<br></p><p>好故事一定是独创，而非复制：</p><p>独创性是内容（创意、场景、人物）和形式（事件安排、表现手法）的组合，《大鱼海棠》内容选材颇具古中国风，建筑、服饰、舞蹈的加入等都有所体现，尤其是主场景取景福建土楼，圆形古老土楼本身就很符合奇幻片风格，和主题很大调，可以说很出彩。</p><p>好估时足以避开令人震撼的观众：<br></p><p>观众一旦在黑暗的影院中坐定，其集体智商则能瞬间飙升几个档次。想想你去电影院是不是常常觉得自己比荧幕上看到的更聪明，人物还没行动，你就知道他要干什么，影片还没过半，你就知道结局了。好的影片一定会预判观众的反应和预期，基于此来展开创作。《大鱼海棠》来说一半一半吧。<br></p><p>整体来说，《大鱼海棠》加入了很多中国元素，作画也很精美，还是值得一看的。期待国漫发光发热。<br></p><p><br></p><blockquote><p>官网 - http://www.xxbt.com</p></blockquote>'),
(12, 12, '<p>《工作细胞》（日语：はたらく細胞）是由日本漫画家清水茜于漫画杂志《月刊少年天狼星》（月刊少年シリウス）上连载的一部细胞拟人漫画。后由 david production 改编成电视动画。<br></p><p>动画围绕白血球和红血球，以拟人化的手法讲述了人体内的细胞每天和侵入体内的细菌、病毒、异物战斗的故事。<br></p><p>本作将各种细胞投射到不同的虚拟人物上，让细胞有拥有了人的外貌，一身白装的白细胞、愣头愣脑的红细胞、萌到心融的萝莉血小板，还有各种性格迥异的其他细胞。<br></p><p>可以说这是一部治愈系的动画，但显然它不只是一部动画这么简单，从题材来说可以将它看做一部科普片。可能这里面专业知识介绍有限，但这不就是科普的特性嘛，不像权威期刊那样叙述详尽的理论，而是以下里巴人的形式广而告之。<br></p><p>隔行如隔山，谁会去拿一本非本专业的权威指南去研读？<br></p><p>早些时候读过一本书《医生最懂你的“心”：心脏故事》，一位中山医院的教授撰写的医学科普书籍，书里用讲故事的叙述方式穿插着将晦涩难懂的医学知识作了阐述。大多时候人们并不需要很专业的其他领域知识，也懒得去看，但科普给了人们一个契机去了解其他领域。比如你看过《医生最懂你的“心”：心脏故事》这本书，当拿到医院的诊断单看到「窦性心率不齐 」会知道这并不是心脏有病，从而不会提心吊胆。<br></p><p>回到动画本身，《工作细胞》内容标新立异，场景和人物塑造也相当成功，萌萌的血小板本身就具有治愈属性，从不认方向的红细胞也给本片带来了很多欢笑。从 B 站对该动画的反响我们也可对其成败窥探一二。相比于科普读物，以动画的形式更能吸引观众，寓教于乐于潜移默化间。<br></p><p><img src=\"/upload/201808/gongzuoxibao.jpg\"></p><p><br></p><blockquote><p>动画官网 - https://hataraku-saibou.com</p><p>月刊少年天狼星 - http://shonen-sirius.com/series/sirius/saibou</p></blockquote>'),
(13, 13, '<p>《 Fate/stay night 》（日语：フェイト/ステイナイト)，简称 stay night ，是由 <mark data-id=\"9\">TYPE-MOON</mark> 于 2004 年 1 月 30 日发售的 PC 平台文字冒险游戏/视觉小说。游戏一共三条线路： Fate 、Unlimited Blade Works 、Heaven\'s Feel ，分别对应 Saber 、远坂凛、间桐樱三位女主角。</p><p><b>电视电影衍生作品：</b></p><p><b>Studio DEEN 版电视动画 《 Fate/stay night 》</b></p><p>2006 年 <mark data-id=\"10\">Studio DEEN</mark> 将其改编为同名电视动画，共 24 集，该作以原作的 Fate 路线为主轴，讲述了第五次圣杯战争的历程以及卫宫士郎和 Saber 之间的羁绊。</p><p><b>Studio DEEN 版剧场动画 《 Fate/stay night - Unlimited Blade Works 》</b></p><p>2010 年 Studio DEEN 将其改编为剧场版动画，并于 2010 年 1 月 23 日上映。作品以原作的 Unlimited Blade Works 线为主轴，讲述了卫宫士郎和远坂凛之间的故事。</p><p><b>ufotable 版电视动画 《 Fate/stay night [Unlimited Blade Works] 》</b></p><p>2014 年 <mark data-id=\"11\">ufotable</mark> 将其改编为电视动画，作品内容以原游戏的 Unlimited Blade Works 线为主，加入了原作未曾描写到的新剧情与新设定，还包括一些原本隶属于伊莉雅线路的剧情与设定。作品分两季放送，第一季于东京时间 2014 年 10 月 4 日 24:00 在日本国内放送，第二季于东京时间 2015 年 4 月 4 日 24:00 在日本国内放送。</p><p><b>ufotable 版剧场动画 《 Fate/stay night [Heaven\'s Feel] 》</b></p><p>TYPE-MOON 于 2014 年 7 月 27 日发表决定由 ufotable 制作 Heaven\'s Feel 剧场版动画。 2016 年 3 月 27 日，于 AnimeJapan 2016 上的 FATE PROJECT 发表会宣布剧场版分三章分章上映。动画以间桐樱为女主角，从她的视角来描述与 Fate 和 Unlimited Blade Works 完全不同的圣杯战争，樱线揭示了圣杯战争的真相，也是最为阴暗的路线。</p><p>第一章「 Fate/stay night [Heaven\'s Feel] 」 .presage flower 于 2017 年 10 月 14 日在日本上映。第二章「 Fate/stay night [Heaven\'s Feel] 」 .lost butterfly 于 2019 年 1 月 12 日在日本上映。</p><p><img src=\"/upload/201809/fate.jpg\"></p><p><br></p><blockquote><p>「 Fate/stay night - UNLIMITED BLADE WORKS 」剧场版官网 - http://www.fatestaynight.jp</p><p>「 Fate/stay night [Heaven\'s Feel] 」 剧场版官网 - https://www.fate-sn.com</p></blockquote>'),
(14, 14, '<p>《 Paprika 》（中文：红辣椒 或 盗梦侦探）是日本著名动画导演今敏所导的动画电影。于 2006 年 9 月在威尼斯国际电影节首映， 2006 年 11 月 25 日在日本放映。<br></p><p>电影改编自筒井康隆所著的同名科幻小说《 Paprika 》，故事开始于东京的精神医疗综合研究所，美女医生千叶敦子和天才科学家池田浩作共同开发出一种可以反映他人梦境的机器 DCMINI 。利用这种机器医生治疗了很多患有精神问题的患者。不料，有两台 DCMINI 被盗贼走了，不法分子利用机器入侵人们的梦境，使人变的疯狂，千叶敦子的同事也未能幸免，为了找出不法分子阻止其进一步作恶，千叶敦子变身另一重身份“红辣椒”，进入受害者的梦境寻找不法分子并展开斗争。<br></p><p>故事并没有多复杂，但还是要推荐一下。<br></p><p>一是《红辣椒》这部作品可能鲜为人知，但《盗梦空间》相对来说就家喻户晓了，《红辣椒》和《盗梦空间》题材相同，都是潜入他人梦境，讲述在梦中世界发生的故事的科幻片。相较于《盗梦空间》真人出演的局限，《红辣椒》以动漫形式呈现，构思更加天马行空，场景更加复杂多变。并且《红辣椒》早在 2006 年就上映了，《盗梦空间》 2010 年才上映。<br></p><p>二是因为剧中涉及到了精神病学领域，这也是有趣的地方。阿尼尔·阿南塔斯瓦米（ Anil Ananthaswamy ）所著的《不存在的人》（英文： The Man Who Wasn&#39;t There: Investigations into the Strange New Science of the Self ）一书中以直接叙述和间接叙述的手法用和纪录片类似的形式记录了各种精神疾病案例，在书中会发现一个有意思的现象：站在精神病学领域前沿的人并不一定是一线的医生，而是各大院校的哲学教授。大脑可以知道我是我，而不是别人。同样哲学家也在思考这些问题，他们试图解释大脑的运作机制，所以可以看到精神病学领域的成果，大都出自各大哲学家。<br></p><p><img src=\"/upload/201809/YVibJZ20180912055736.jpg\"></p><p><br></p><blockquote><p>参考 - 《不存在的人》</p></blockquote>'),
(15, 15, '<p>游戏分级是一种用于分别视频游戏对各年龄人士的合适度的分级。大部份分级系统都是由政府资助非营利性组织。大部分国家都会对视频游戏做内容分级。<br></p><p><b>娱乐软件分级委员会（ ESRB ）分级制度</b></p><p>适用于 美国 加拿大 等</p><p>娱乐软件分级委员会（英文： Entertainment Software Rating Board ( ESRB ) ） 是美国的一个给消费者电子游戏评分的自律组织，于 1994 年成立。 ESRB 使用六个基于年龄的级别组合，对游戏进行评级。<br></p><p>ESRB 评级主要通过图标来识别，图标显示在游戏的包装和宣传材料上。每个图标都包含一个代表评级的字母。<br></p><p><img src=\"/upload/201809/esrb.png\"></p><p>从图上可以明显的区别适应的人群：</p><p>EC (early childhood) 适用于儿童，不包含任何家长认为不适宜的内容</p><p>(E) everyone 适用于 6 岁以上的所有人，此类别也许包含极少的卡通、幻想、轻微的暴力，或者很少的轻度不良语言</p><p>(E10+) everyone10+ 适合 10 岁以上所有人，此类别也许包含更多的卡通、幻想、轻微的暴力，或者极少的暗示性主题</p><p>(T) teen 适合 13 岁以上的人，此类别也许包含暴力、暗示性主题、 粗鲁的幽默、极少的血腥、模拟的赌博，或者很少的粗话</p><p>(M) mature 适合 17 岁以上人群，此类别也许包含强烈的暴力、血腥与血液飞溅、性主题，或者粗话</p><p>(AO)&nbsp;adults only 只适合 18 岁以上成人，此类别也许包含长时间的强烈暴力，或者生动的的性主题与裸体</p><p>(RP) rating pending 表示定级还没有最终确定<br></p><p><b>计算机娱乐分级机构（ CERO ）分级制度</b><br></p><p>适用于 日本<br></p><p>计算机娱乐分级机构（英文： Computer Entertainment Rating Organization (CERO) ）是日本娱乐分级组织，成立于 2002 年 7 月，总部设在东京，对视频游戏内容进行评级，告知用户游戏的性质和适合的年龄段。</p><p>CERO 使用拉丁字母作为符号，一目了然地传达游戏对用户的适合性。<br></p><p><img src=\"/upload/201809/cero.png\"></p><p>CERO 制度分为 A B C D Z 五个等级和三个特殊级别。</p><p>五个等级分别对应全年龄段、 12 岁以上、 15 岁以上、 17 岁以上、 18 岁以上。</p><p>三个特殊等级，审查予定用于未发售的游戏的宣传物品。表示该作品准备会取得 CERO 的正式级别。 CERO 规定适合用于未发售的游戏的试玩版。表示该作品准备会取得 CERO 的正式级别，教育用于在游戏主机中推出的，没有特别指定年龄层的对象的非游戏类教育软件和工具书。</p><p><b>游戏软体分级管理办法（ GSRR ）分级制度</b><br></p><p>适用于 台湾 香港 东南亚 等<br></p><p>《游戏软体分级管理办法》（ Game Software Rating Management Regulations ），该办法对游戏内容划分五个等级，对应不同的适用人群。<br></p><p><img src=\"/upload/201809/gsrr.png\"></p><p>管理办法依其内容分为下列五级：</p><p>一、限制级（以下简称限级）：十八岁以上之人始得使用</p><p>二、辅导十五岁级（以下简称辅十五级）：十五岁以上之人始得使用<br></p><p>三、辅导十二岁级（以下简称辅十二级）：十二岁以上之人始得使用<br></p><p>四、保护级（以下简称护级）：六岁以上之人始得使用<br></p><p>五、普遍级（以下简称普级）：任何年龄皆得使用<br></p><p><br></p><blockquote><p>ESRB - https://www.esrb.org</p><p>CERO - http://www.cero.gr.jp/en/</p><p>GSRR - http://www.gamerating.org.tw/gsgi_way.php</p></blockquote>'),
(16, 16, '<p>《卫宫家今天的饭》（日语：衛宮さんちの今日のごはん）是漫画家 TAa 的漫画作品。后由 ufotable 将其改变为电视动画。<br></p><p>「Fate」×「料理」＝「温柔」<br></p><p>不同于 Fate 系列紧张刺激的打斗场面，《卫宫家今天的饭》营造了一个温柔的世界观，不管春秋冬夏，卫宫士郎家都会端出美味的料理，冬木的居民和从者们沉浸在美食带来的温馨气氛中，身周不经意便萦绕出满足的光晕。<br></p><p>整个作品都是祥和的氛围， master 和 servant 和平共处，没有战争，有的只是美食，很治愈系。<br></p><p>相比于其他美食番来说，《卫宫家今天的饭》中的美食就比较真实了，里面附有详细的食谱和做法，这些食谱都是可以在现实中做成成品的。想试试吗？<br></p><p><img src=\"/upload/201809/weigongfan.jpg\"></p><p><br></p><p><b>衍生动画</b><br></p><p><mark data-id=\"11\">ufotable</mark> 在 2017 年将漫画作品改编成了同名电视动画，并从 2018 年 2 月开始，每月 1 日在 <mark data-id=\"12\">AbemaTV</mark> 播送。可以说这是一部很任性的月番，根本不够看。</p><p><img src=\"/upload/201809/weigongfan2.jpg\"></p><p><br></p><p>参考</p><blockquote><p>漫画信息 - https://web-ace.jp/youngaceup/contents/1000010/</p><p>动画官网 - https://emiya-gohan.com</p></blockquote>'),
(17, 17, '<p>KADOKAWA 作品《约会大作战》中主角之一的「時崎狂三」，在<mark data-id=\"13\">富士见文库</mark> （日文：ファンタジア文庫） 30 周年纪念之际，按照 1:7 比例手办化，手办按照原作第 11 集的插图，在 5 年前的世界与主角‧五河士道相遇的狂三制作而成。</p><p>细细看来，被微风吹拂的头发、飘扬的裙子以及颇具神秘之处的眼罩，整体皆以高品质制作呈现。除此之外，脸部部件是可拆卸的，可以看到「无眼罩」的狂三样貌。</p><p><img src=\"http://wx3.sinaimg.cn/mw690/77719d27ly1fvzsypenf7j20go0m8n0f.jpg\"></p><p>商品信息</p><p>名称：时崎狂三 Fantasia30 周年记念 Ver.</p><p>出自作品：约会大作战 DATE A LIVE</p><p>制造商：&nbsp;KADOKAWA</p><p>分类：&nbsp;1/7 比例模型</p><p>价格：&nbsp;14,352 日圆 + 消费税</p><p>商品规格： PVC 制涂装完成品・ 1/7 比例模型・附专用台座・全高：约 250mm</p><p>贩卖商：&nbsp;<span style=\"color: rgb(87, 79, 75); font-family: メイリオ, Meiryo, Arial, &quot;ＭＳ Ｐゴシック&quot;, &quot;MS PGothic&quot;, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, osaka, sans-serif; font-size: 13px; letter-spacing: normal;\">Good Smile Company</span></p><p><span style=\"color: rgb(87, 79, 75); font-family: メイリオ, Meiryo, Arial, &quot;ＭＳ Ｐゴシック&quot;, &quot;MS PGothic&quot;, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, osaka, sans-serif; font-size: 13px; letter-spacing: normal;\"><br></span></p><p><font color=\"#574f4b\" face=\"メイリオ, Meiryo, Arial, ＭＳ Ｐゴシック, MS PGothic, ヒラギノ角ゴ Pro W3, Hiragino Kaku Gothic Pro, osaka, sans-serif\"><span style=\"font-size: 13px; letter-spacing: normal;\">摘除眼罩</span></font></p><p><img src=\"http://wx2.sinaimg.cn/mw690/77719d27ly1fvzszotnvfj20go0m80wi.jpg\"></p><p>背面</p><p><img src=\"http://wx4.sinaimg.cn/mw690/77719d27ly1fvzsysjrhvj20go0m841x.jpg\"></p><p>侧面</p><p><img src=\"http://wx1.sinaimg.cn/mw690/77719d27ly1fvzsywrkx0j20fa0m8n00.jpg\"></p><p><br></p><blockquote><p>正版出售地址 - <a target=\"_blank\" href=\"http://www.goodsmile.info/ja/product/7602/%E6%99%82%E5%B4%8E+%E7%8B%82%E4%B8%89+%E3%83%95%E3%82%A1%E3%83%B3%E3%82%BF%E3%82%B8%E3%82%A230%E5%91%A8%E5%B9%B4%E8%A8%98%E5%BF%B5Ver.html\">http://www.goodsmile.info/ja/product/7602/%E6%99%82%E5%B4%8E+%E7%8B%82%E4%B8%89+%E3%83%95%E3%82%A1%E3%83%B3%E3%82%BF%E3%82%B8%E3%82%A230%E5%91%A8%E5%B9%B4%E8%A8%98%E5%BF%B5Ver.html</a></p><p>富士见书房 - <a target=\"_blank\" href=\"http://www.fujimishobo.co.jp\">http://www.fujimishobo.co.jp</a></p></blockquote>'),
(18, 18, '<p>「如果樱花掉落的速度是每秒 5 厘米，那么两颗心需要多久才能靠近？」<br></p><p>《秒速5厘米》（日语：秒速びょうそく5センチメートル）是由新海诚创作和制作的一部动画电影，于 2007 年 3 月 3 日在日本上映，并有小说、漫画等衍生作品。<br></p><p>新海诚的作品一向多幻想及科幻元素，但本部作品则偏重写实，用动画的方式描写了从 1990 年代至今的日本，动画中也运用了不少实景素材。<br></p><p data-role=\"danger\">以下内容涉及剧透成分</p><p><img src=\"/upload/201810/miaosu2.jpg\"></p><p>影片讲述了原本为同班同学的远野贵树与筱原明里从小学毕业之后，两人因搬家天各一方不能见面。分隔两地的两人靠着书信往来保持联络，直到贵树得知即将跟随家人搬到距离明里更远的鹿儿岛时，两人约定再见一面。原本万事俱备，但当天却遇上了暴风雪。云收天转，时光推移，贵树与明里各自有了新的生活，但对彼此的思念，一直留在心中。<br></p><p>整个作品被分为三部分短篇：樱花抄、宇航员、秒速五厘米。</p><p>樱花抄篇讲述了远野贵树与筱原明里小学时期相遇、相知，懵懂爱情的产生到由于家人搬家缘故不得不分开的故事。</p><p>宇航员篇通过默默喜欢远野贵树的澄田花苗的视角讲述了中学时期的远野贵树的生活。</p><p>秒速五厘米篇讲述了远野贵树与筱原明里长大成人各自过着新生活，在一个樱花盛开的季节，两人在铁道口偶遇，由于火车阻挡，错过相认留有遗憾的结局故事。</p><p>影片并没有给出一个美好的结局，带有淡淡的忧伤，但并不影响它带来的感动。美妙的配乐、细腻的画面、青涩的初恋，带有遗憾的结局。。。多数人或多或少会从中发现自己的影子，青春，不就是这样子吗？<br></p><p><img src=\"/upload/201810/miaosu1.jpg\"></p><p>聚散苦匆匆，此恨无穷。今年花胜去年红。可惜明年花更好，知与谁同？<br></p><p><br></p><blockquote><p>电影官方网站 - http://www.cwfilms.jp/5cm</p></blockquote>'),
(19, 19, '<p>《她和她的猫》（日语：彼女と彼女の猫）原本是由新海诚自主制作的 5 分钟黑白动画。<br></p><p><b>TV 动画</b><br></p><p>2016 Lidenfilms 将原动画重新制作，内容相当于原黑白动画之前的故事。并于 2016 年 3 月 4 日 ~ 25 日在 TOKYO MX 等媒体播送，每话时长约 8 分钟，全 4 话。</p><p><img src=\"/upload/201810/hercat.jpg\"></p><p data-role=\"danger\">以下内容含有剧透成分</p><p>她一直很孤单，从小失去父亲，为了不给母亲添麻烦选择了出去租住。合租室友突然搬走，她开始一个人生活。每个清晨独自走出家门，独自上学，独自放学，独自在公园的秋千上发呆。街道上三五成群的小孩追逐嬉戏，伴着笑声穿过她身旁，一切似乎与她无关。<br></p><p><img src=\"/upload/201810/hercat3.jpg\"></p><p>它是一只黑色的小流浪猫，被她的母亲领养回家，送给她。最初她并不喜欢它，甚至想把它丢弃，但最后没能狠下心。由于它，她也交到了朋友。它很喜欢她，熟悉她的味道，喜欢依偎在她身旁睡觉，它会用自己的方式为她加油鼓气，但往往弄巧成拙。<br></p><p>时间流逝，它变成了大猫，她也毕业开始寻找工作，虽然尽力争取每一个岗位，但一切并不如意，四处碰壁的失落感，只能化为夜深人静中孤单无助的抽泣，它是她唯一的陪伴和慰藉。<br></p><p>光阴荏苒，成为猫爷爷的它在她怀里去世了。她又变得孤单一人，夜深人静的晚上会梦到它而惊醒。它虽然去世了，但仍留有她的记忆，依然熟悉她的味道。<br></p><p><img src=\"/upload/201810/hercat4.jpg\"></p><p>雨天的河边天桥下，旧箱子里，熟悉的眼眸，轮回一般，白色小猫撞进了她的视线。“一起回家吧”，它成为了她的猫。<br></p><p><img src=\"/upload/201810/hercat2.jpg\"></p><p>动画全篇以猫的一生视角讲述了女主的生活。以小清新的画风描绘了一个略带伤感的故事，但开放的结尾仍留了一丝温暖，也许岁月并没有那么多安好，抛开鸡汤回归原本的生活，你珍惜的 TA 也在珍惜着你吗？<br></p><p><br></p><blockquote><p>原作动画官方 - http://shinkaimakoto.jp/hercat<br></p><p>TV 动画官网 - http://kanoneko.com<br></p></blockquote><p><br></p>');

-- --------------------------------------------------------

--
-- 表的结构 `t_tips`
--

CREATE TABLE `t_tips` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `intro` varchar(400) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_tips`
--

INSERT INTO `t_tips` (`id`, `title`, `intro`) VALUES
(1, 'mediaworks', 'MediaWorks 是日本角川控股集团旗下以次文化、游戏为主拥有“电击”等品牌的出版社， ASCII 公司为日本一家以电脑杂志为主的出版社。2008 年 4 月 1 日， MediaWorks 吸收合并 ASCII ，商号变更为“株式会社 ASCII MEDIA WORKS”'),
(2, 'niconico', 'niconico 动画，（日文：ニコニコ動画）由日本 Dwango 公司的子公司 Niwango 运营，以亚文化视频为主要内容的弹幕式视频分享网站'),
(3, 'ova', 'Original Video Animation 即原创视频动画的简称，一般通过 DVD 或蓝光光碟发行，内容较精良，无时长限制，多见于番外剧集用以补充原著剧情'),
(4, 'leaf', 'Leaf 社是出版商 Aquaplus 旗下的日本视觉小说工作室，在 Yodogawa-ku ， Osaka 和 Tokyo 设有办事处'),
(5, 'tokyomx', 'Tokyo MX 指东京首都电视台'),
(6, 'feng', 'feng 社是一家位于日本千叶县市川市的游戏制作公司'),
(7, 'CoMix Wave Films', 'CoMix Wave Films，Inc。是一家日本动画电影制片厂和发行公司，总部位于日本东京千代田区。该工作室以其动漫故事片，短片和电视广告而闻名。官方网站 - http://www.cwfilms.jp'),
(8, '周目', '周目（日文：しゅうめ）最开始被游戏所用，自无存档状态开始玩第一次叫一周目，第二次为二周目，以此类推。原则上不通关不算一次'),
(9, 'TYPE-MOON', 'TYPE-MOON （中文：型月）原为日本的同人游戏社团。后来商业化， 2003 年同人社团 TYPE-MOON 解散，同时成立游戏公司 Notes. ， TYPE-MOON 成为 Notes. 旗下品牌'),
(10, 'Studio DEEN', 'STUDIO DEEN 是日本的动画制作公司，由长谷川洋在 1975 年 3 月 14 日创立，从事动画的企划和制作、绘画、完成、 3D 、摄影、编辑等'),
(11, 'ufotable', 'ufotable 是一家日本动画制作公司，简称 UFO 社或幽浮社。由近藤光于 2000 年创立'),
(12, 'AbemaTV', 'AbemaTV 是一个面向 PC 和智能手机的实时流媒体互联网电视。它由 AbemaTV 有限公司运营，该公司由网络代理商和朝日电视台共同出资'),
(13, '富士见书房', '富士见书房是日本的的出版商，角川集团品牌之一');

-- --------------------------------------------------------

--
-- 表的结构 `t_topic`
--

CREATE TABLE `t_topic` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT '0' COMMENT '用户id',
  `topic_cate_id` int(11) DEFAULT '0' COMMENT '帖子分类id',
  `title` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `brief` varchar(200) CHARACTER SET utf8 DEFAULT '',
  `ip` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `essence` tinyint(4) DEFAULT '0' COMMENT '精华',
  `praise` int(11) DEFAULT '0' COMMENT '赞',
  `status` tinyint(4) DEFAULT '1',
  `comment_number` int(11) DEFAULT '0' COMMENT '评论数',
  `post_time` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_topic`
--

INSERT INTO `t_topic` (`id`, `uid`, `topic_cate_id`, `title`, `brief`, `ip`, `essence`, `praise`, `status`, `comment_number`, `post_time`) VALUES
(1, 1, 1, '纪录片《人在三和》', '', '219.143.129.48', 0, 0, 1, 0, 1537532389),
(2, 1, 1, '《出包王女第三季 OVA 》无修版在线', '', '36.98.35.72', 0, 0, 1, 0, 1538577565),
(3, 1, 1, '缘之空 下载', '', '36.98.35.72', 0, 0, 1, 0, 1538627792),
(4, 1, 3, '《约会大作战》狂三睡衣手办 2019 年即将开售', '', '36.98.35.72', 0, 0, 1, 0, 1538628617);

-- --------------------------------------------------------

--
-- 表的结构 `t_topic_category`
--

CREATE TABLE `t_topic_category` (
  `id` int(11) NOT NULL,
  `title` varchar(40) CHARACTER SET utf8 DEFAULT '',
  `brief` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  `thumb` varchar(200) CHARACTER SET utf8 DEFAULT '' COMMENT '话题图标',
  `is_recommand` tinyint(4) DEFAULT '0' COMMENT '是否推荐',
  `post_time` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_topic_category`
--

INSERT INTO `t_topic_category` (`id`, `title`, `brief`, `thumb`, `is_recommand`, `post_time`) VALUES
(1, '分享', '', '/dist/m/images/item-article.jpg', 0, 0),
(2, '求助', '', '/dist/m/images/item-article.jpg', 0, 0),
(3, '杂谈', '', '/dist/m/images/item-user.jpg', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_topic_content`
--

CREATE TABLE `t_topic_content` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_topic_content`
--

INSERT INTO `t_topic_content` (`id`, `topic_id`, `content`) VALUES
(1, 1, '三和是深圳龙华区的一个劳动力市场，临时工的天堂。一些青年背景离乡来到深圳打拼，钱带的不多，找工作不好意思，有的又不想做 ，身上钱又花完了，没办法就来到三和人才市场找工作！这里的人一般都被外人称为三和大神，这里充满剥削，充满颓废，也见证了漂流在外的部分人的艰辛…… 播放地址 \nhttps://www.youtube.com/watch?v=uVWVQv810FI'),
(2, 2, '《出包王女第三季 OVA 》讲述平凡高中生结城梨斗与统帅银河系的戴比路库族的王女菈菈偶然相遇，由此而卷入各式各样的麻烦中，私下偷偷关心着结城的春菜，被委托抹杀梨斗而来到地球的金色之暗，超有魅力的女主角等众多角色将悉数登场。\n[img src=\"http://img8.dm530.net/pic/uploadimg/2015-4/4944.jpg\"]\nhttp://m.fcdm.cc/show/4944.html'),
(3, 3, '简体中文种子\nhttps://dl.dmhy.org/2016/01/05/4c7c3f28c0497fd977e625e59038af3b9c9a0025.torrent\n繁体中文\nhttps://dl.dmhy.org/2016/07/10/8a175e718760ab5291b6e1e8b54eb8dede0edeaa.torrent\n[img src=\"http://pic.xiaomingming.org/FileUpload/3964.jpg\"]'),
(4, 4, 'Alphamax 制作《约会大作战》狂三睡衣手办正式开订，售价 13,800 日元（ 855 元），预计 2019 年 5 月发售\n[img src=\"https://wx4.sinaimg.cn/orj360/006tTwHFgy1fvtxsnw91jj30et0m8qk2.jpg\"]\n[img src=\"https://wx2.sinaimg.cn/orj360/006tTwHFgy1fvtxtt1msfj30xc1dtnpe.jpg\"]\n[img src=\"https://wx2.sinaimg.cn/orj360/006tTwHFgy1fvtxrzkaf2j30p011inpd.jpg\"]\n[img src=\"https://wx2.sinaimg.cn/orj360/006tTwHFgy1fvtxt3ysoqj30et0m8k9b.jpg\"]\n[img src=\"https://wx1.sinaimg.cn/orj360/006tTwHFgy1fvtxscllwwj30et0m8qev.jpg\"]\n[img src=\"https://wx2.sinaimg.cn/orj360/006tTwHFgy1fvtxshaoihj30et0m84ej.jpg\"]');

-- --------------------------------------------------------

--
-- 表的结构 `t_topic_reply`
--

CREATE TABLE `t_topic_reply` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论那篇话题',
  `uid` int(11) NOT NULL DEFAULT '0',
  `content` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `floor` int(11) NOT NULL DEFAULT '0' COMMENT '楼层',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `post_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `gender` tinyint(4) DEFAULT '1' COMMENT '0女 1男 2保密',
  `username` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `password` char(32) CHARACTER SET utf8 DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `avatar` varchar(200) CHARACTER SET utf8 DEFAULT '',
  `truename` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `phone` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `shortintro` varchar(200) CHARACTER SET utf8 DEFAULT '',
  `regtime` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`id`, `gender`, `username`, `password`, `email`, `avatar`, `truename`, `phone`, `shortintro`, `regtime`, `status`) VALUES
(1, 1, '小白', '200820e3227815ed1756a6b531e7e0d2', 'xiaobai@gmail.com', '', '', '', '', 1537004001, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_credit`
--

CREATE TABLE `t_user_credit` (
  `uid` int(11) DEFAULT '0',
  `score` double DEFAULT '0',
  `experience` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分表';

--
-- 转存表中的数据 `t_user_credit`
--

INSERT INTO `t_user_credit` (`uid`, `score`, `experience`) VALUES
(1, 120, 107);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_level`
--

CREATE TABLE `t_user_level` (
  `levelname` varchar(20) CHARACTER SET utf8 DEFAULT '',
  `minscore` int(11) DEFAULT '0',
  `maxscore` int(11) DEFAULT '0',
  `levelnum` int(11) DEFAULT '1' COMMENT '等级编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户等级表';

--
-- 转存表中的数据 `t_user_level`
--

INSERT INTO `t_user_level` (`levelname`, `minscore`, `maxscore`, `levelnum`) VALUES
('白丁', 0, 5, 1),
('童生', 6, 12, 2),
('案首', 13, 20, 3),
('监生', 21, 30, 4),
('生员', 31, 50, 5),
('禀生', 51, 60, 6),
('贡生', 61, 70, 7),
('举人', 71, 90, 8),
('解元', 91, 110, 9),
('进士', 111, 130, 10),
('二甲', 131, 160, 11),
('会员', 161, 190, 12),
('探花', 191, 220, 13),
('榜眼', 221, 270, 14),
('状元', 271, 320, 15),
('大神', 321, 1000, 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_ad`
--
ALTER TABLE `t_ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_links`
--
ALTER TABLE `t_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_nav`
--
ALTER TABLE `t_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_post`
--
ALTER TABLE `t_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_post_comment`
--
ALTER TABLE `t_post_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_post_content`
--
ALTER TABLE `t_post_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_tips`
--
ALTER TABLE `t_tips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_topic`
--
ALTER TABLE `t_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_topic_category`
--
ALTER TABLE `t_topic_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_topic_content`
--
ALTER TABLE `t_topic_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_topic_reply`
--
ALTER TABLE `t_topic_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_credit`
--
ALTER TABLE `t_user_credit`
  ADD UNIQUE KEY `userid` (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `t_ad`
--
ALTER TABLE `t_ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `t_links`
--
ALTER TABLE `t_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `t_nav`
--
ALTER TABLE `t_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `t_post`
--
ALTER TABLE `t_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `t_post_comment`
--
ALTER TABLE `t_post_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `t_post_content`
--
ALTER TABLE `t_post_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `t_tips`
--
ALTER TABLE `t_tips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `t_topic`
--
ALTER TABLE `t_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `t_topic_category`
--
ALTER TABLE `t_topic_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `t_topic_content`
--
ALTER TABLE `t_topic_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `t_topic_reply`
--
ALTER TABLE `t_topic_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
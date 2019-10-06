<?php
/**
 * 静态资源目录
 */
define('RES', 'http://localhost/fateblog-share/web/dist');

/**
 * 1 or 0 , 优化路由 开启需要配置 nginx 或 apache
 * when 1 then path like: /home/123 , when 0 then path like: /index.php?r=home&uid=123
 */
define('FAKE_PATH', '0');

/**
 * 核心配置
 */
$main = [
    /**
     * 应用的唯一标识
     */
    'id' => '1',
    /**
     * 密钥 重要 尽量设置成一个别人很难猜到的随机字符串
     */
    'securityKey' => 'something',
    /**
     * cookie 前缀
     */
    'cookiePrefix' => 'fate_',
    /**
     * cookie 时效 100H
     */
    'cookieLife' => 360000,
    'modules' => [
        'admin' => 'app\\modules\\admin',
        'adminapi' => 'app\\modules\\adminapi'
    ],
    /**
     * 数据库配置 数据库名、用户名、密码
     */
    'db' => [
        'main' => [
            'dsn' => 'mysql:host=localhost;dbname=fateblog',
            'username' => 'root',
            'password' => 'root',
            'charset' => 'utf8'
        ]
    ],
    /**
     * 邮箱配置
     */
    'mail' => [
        'safecode' => '_fs_',
        'host' => 'smtp.126.com',
        'port' => '25',
        'username' => 'devemail@126.com',
        'password' => '_devemail',
        'sender_email' => 'devemail@126.com',
        'sender_name' => '番薯社'
    ]
];

/**
 * 全局变量配置
 */
$_G = [
    'sys' => [
        // 主题
        'theme' => 'default',
        // 开放注册
        'openreg' => 1,
        // 发文章经验值
        'exponpost' => 3,
        // 开启文章审核
        'openreview' => 0
    ],
    'seo' => [
        'sitetitle' => '番薯社 - (F) - 二次元图鉴',
        'keywords' => '二次元 动画 动漫 游戏 图鉴 电视动画 动画电影 剧场版动画',
        'desc' => 'F站 番薯社 用心撰写最新最特别的次元世界',
        'generator' => '番薯社',
        'author' => '番薯社',
        'copyright' => '番薯社'
    ],
    'footer' => '<p>本站为非盈利个人博客，不提供任何上传下载服务，所有内容均来自网络公开分享或网友的投稿。</p><p>如果您发现本站某些文章资源或图片违规或侵犯了您的权益，请发送消息到下面邮箱</p>'
];
$_G['now_time'] = isset($_SERVER['REQUEST_TIME']) ? $_SERVER['REQUEST_TIME'] : time();

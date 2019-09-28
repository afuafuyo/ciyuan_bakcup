<?php
define('IN_APP', true);
define('FATE_DEBUG', true);

// res
define('RES', 'http://localhost/fateblog-share/web/dist');

$_G = [];
$_G['sys'] = [
    'openreg' => 1,
    'exponpost' => 3,
    'openreview' => 0
];
$_G['seo'] = [
    'sitetitle' => '番薯社 - (F) - 二次元图鉴',
    'navtitle' => '番薯社',
    'keywords' => '二次元 动画 动漫 游戏 图鉴 电视动画 动画电影 剧场版动画',
    'desc' => 'F站 番薯社 用心撰写最新最特别的次元世界',
    'generator' => '番薯社',
    'author' => '番薯社',
    'copyright' => '番薯社'
];
$_G['footer'] = '<p>本站为非盈利个人博客，不提供任何上传下载服务，所有内容均来自网络公开分享或网友的投稿。</p><p>如果您发现本站某些文章资源或图片违规或侵犯了您的权益，请发送消息到下面邮箱</p><p>531251662#qq.com</p>';
$_G['now_time'] = isset($_SERVER['REQUEST_TIME']) ? $_SERVER['REQUEST_TIME'] : time();

require(__DIR__ . '/../../fateblog-share/vendor/afuafuyo/fatephp/Fate.php');
require(__DIR__ . '/../../fateblog-share/vendor/autoload.php');
include __DIR__ . '/../../fateblog-share/core/common.php';

$res = (new fate\web\Application([
    // 加密用
    'securityKey' => 'something',
    'cookiePrefix' => 'fate_',
    'cookieLife' => 360000,  // 100 hour
    
    'id' => '2333',
    'layout' => __DIR__ . '/../../fateblog-share/app/layout/layout.php',
    'appPath' => __DIR__ . '/../../fateblog-share/app',
    //'errorHandler' => 'app\controllers\ErrorPage',
    'routesMap' => [
        'anime' => [
            'classPath' => 'app\controllers\category\IndexController',
            'navid' => 1
        ],
        'game' => [
            'classPath' => 'app\controllers\category\IndexController',
            'navid' => 8
        ]
    ],
    'modules' => [],
    'db' => [
        'main' => [
            'dsn' => 'mysql:host=localhost;dbname=fateblog',
            'username' => 'root',
            'password' => 'root',
            'charset' => 'utf8'
        ]
    ],
    'mail' => [
        'safecode' => '_fs_',
        'host' => 'smtp.126.com',
        'port' => '25',
        'username' => 'devemail@126.com',
        'password' => '_devemail',
        'sender_email' => 'devemail@126.com',
        'sender_name' => '番薯社'
    ]
]))->run();

if(is_array($res)) {
    echo json_encode($res);
}
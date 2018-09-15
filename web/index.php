<?php
define('IN_APP', true);
define('FATE_DEBUG', true);

// res
define('RES', 'http://localhost/fateblog-share/web/dist');

$_G = [];
$_G['seo'] = [
    'sitetitle' => '番薯社',
    'navtitle' => '番薯社',
    'keywords' => '新番 动画 动漫',
    'desc' => '番薯社 用心撰写二次元点滴',
    'generator' => '番薯社',
    'author' => '番薯社',
    'copyright' => '番薯社'
];
$_G['footer'] = [
    'about' => '<p>Powered by <a href="https://gitee.com/tailipu/fateblog" target="_blank">fateblog</a></p>'
];
$_G['nowTime'] = isset($_SERVER['REQUEST_TIME']) ? $_SERVER['REQUEST_TIME'] : time();
$_G['theme'] = 'y-theme-afternoon';

require(__DIR__ . '/../../fateblog-share/vendor/afuafuyo/fatephp/Fate.php');
include __DIR__ . '/../../fateblog-share/core/common.php';

$agent = $_SERVER['HTTP_USER_AGENT'];
$_G['isMobile'] = (strpos($agent, 'iPhone') || strpos($agent, 'Android')) ? true : false;

$res = (new fate\web\Application([
    // 加密用
    'securityKey' => 'AsdF_',
    
    'id' => 1,
    'appPath' => __DIR__ . '/../../fateblog-share/app',
    //'errorHandler' => 'app\controllers\ErrorPage',
    'routesMap' => [
        'anime' => [
            'classPath' => 'app\controllers\classify\IndexController',
            'navid' => 1
        ],
        'game' => [
            'classPath' => 'app\controllers\classify\IndexController',
            'navid' => 2
        ],
        'around' => [
            'classPath' => 'app\controllers\classify\IndexController',
            'navid' => 3
        ]
    ],
    'modules' => [
        'admin' => 'app\\modules\\admin',
    ],
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
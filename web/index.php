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
$_G['nowTime'] = isset($_SERVER['REQUEST_TIME']) ? $_SERVER['REQUEST_TIME'] : time();
$_G['theme'] = 'y-theme-afternoon';
$_G['nav'] = [
    [
        'id' => 1,
        'pid' => 0,
        'title' => '动漫',
        'navurl' => 'anime',
        'listorder' => 0,
        'linktype' => 1  // 1 本站链接 2 站外链接
    ],
    [
        'id' => 2,
        'pid' => 0,
        'title' => '游戏',
        'navurl' => 'game',
        'listorder' => 0,
        'linktype' => 1
    ],
    [
        'id' => 3,
        'pid' => 0,
        'title' => '鲜事',
        'navurl' => 'around',
        'listorder' => 0,
        'linktype' => 1
    ],
    [
        'id' => 4,
        'pid' => 0,
        'title' => 'Cosplay',
        'navurl' => 'cosplay',
        'listorder' => 0,
        'linktype' => 1
    ]
];

require(__DIR__ . '/../../fateblog-share/vendor/afuafuyo/fatephp/Fate.php');
include __DIR__ . '/../../fateblog-share/core/common.php';

$res = (new fate\web\Application([
    // 加密用
    'securityKey' => 'AsdF_',
    
    'id' => 1,
    'appPath' => __DIR__ . '/../../fateblog-share/app',
    //'errorHandler' => 'app\controllers\ErrorPage',
    'routesMap' => [
        'anime' => [
            'classPath' => 'app\controllers\classify\IndexController',
            'viewPath' => 'classify',
            'navid' => 1
        ],
        'game' => [
            'classPath' => 'app\controllers\classify\IndexController',
            'viewPath' => 'classify',
            'navid' => 2
        ],
        'around' => [
            'classPath' => 'app\controllers\classify\IndexController',
            'viewPath' => 'classify',
            'navid' => 3
        ],
        'cosplay' => [
            'classPath' => 'app\controllers\classify\IndexController',
            'viewPath' => 'classify',
            'navid' => 4
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
    ]
]))->run();

if(is_array($res)) {
    echo json_encode($res);
}
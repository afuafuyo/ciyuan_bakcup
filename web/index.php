<?php
define('FATE_DEBUG', true);
define('VENDOR_PATH', __DIR__ . '/../vendor');

/**
 * 配置
 */
require(__DIR__ . '/../core/siteconf.php');

/**
 * 核心框架
 */
require(__DIR__ . '/../../fateblog-share/vendor/afuafuyo/fatephp/Fate.php');
require(__DIR__ . '/../../fateblog-share/vendor/autoload.php');

/**
 * 主题
 */
Fate::setPathAlias('@themes', __DIR__ . '/../../fateblog-share/app/themes/' . $_G['sys']['theme']);

// 入口
$appConf = array_merge($main, [
    'appPath' => __DIR__ . '/../../fateblog-share/app',
    'layout' => __DIR__ . '/../../fateblog-share/app/themes/'. $_G['sys']['theme'] .'/layout.php',
    'framePassportLayout' => __DIR__ . '/../../fateblog-share/app/themes/'. $_G['sys']['theme'] .'/framepassportlayout.php',
    //'errorHandler' => 'app\controllers\ErrorPage',
    // 自定义路由
    'routesMap' => []
]);
$res = (new fate\web\Application($appConf))->run();

if(is_array($res)) {
    echo json_encode($res);
}

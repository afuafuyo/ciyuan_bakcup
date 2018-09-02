<?php
$url = isset($_GET['url']) ? $_GET['url'] : '';
if(!empty($url)) {
    if(1 === strpos($url, 'ttp')) {
        header('Location: '. $url);
    } else {
        header('Location: http://'. $url);
    }
}


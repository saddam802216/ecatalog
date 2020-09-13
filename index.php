<?php

    require_once('include/include.php');
    $isLogin = Helper::getLoginUser();
    
    if(!$isLogin) {
        include (DIR_INCLUDE_PATH."pages/login.php");
        exit;
    }else {
        header('Location: '.BASE_URL.'customer/index.php');
        exit;
    }

    if(isset($_GET['page']) && !empty($_GET['page'])) {
        build_page($_GET['page']);
    }else {
        build_page();
    }

    function build_page($thispage='index'){
        include DIR_INCLUDE_PATH."header.php";
        
        if (file_exists(DIR_INCLUDE_PATH."pages/".$thispage.".php")) { 
            include (DIR_INCLUDE_PATH."pages/".$thispage.".php");
        } else { 
            echo "<div style=\"margin:10px;\">";
            echo "You are not authorized to view this page!<br />";
            echo "</div>";
        }
        
        include DIR_INCLUDE_PATH."footer.php";
    }


?>
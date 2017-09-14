<?php
	header('Access-Control-Allow-Origin:*');
	header("Content-Type: text/html;charset=utf-8"); 
	$html = file_get_contents("http://wx.dudubashi.com/index.php/line/city");
	echo $html;
?>
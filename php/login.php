<?php
    header("Content-Type: text/html;charset=utf-8"); 
    header('Access-Control-Allow-Origin:*');
	$Users =$_GET['aaa'];
	$Passwords =$_GET['bbb'];
	
       $db = mysqli_connect('localhost','root','root','dudubus');
	if(!$db){
		echo '数据库链接错误';
		return ;
	}
	$result = Mysqli_query($db,"select*from maseruser where name='".$Users."' and pass='".$Passwords."'");
	if(!$result){
		echo '密码或用户名错误';
		echo $Users;
		echo $Passwords;
		return ;
	}
	$arrs = [];
	while($srows = Mysqli_fetch_array($result)){
		array_push($arrs,$srows);
	}
	echo json_encode($arrs); 
	Mysqli_free_result($result);
	Mysqli_close($db);
?>
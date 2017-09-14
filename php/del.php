<?php
	$connect = mysqli_connect("localhost","root","root","test_db");
	$result = mysqli_query($connect,"select * from mian where tel='".$_GET['m']."' and password='".$_GET['mm']."' limit 1");
	mysqli_close($connect);
	echo $result; 
?>
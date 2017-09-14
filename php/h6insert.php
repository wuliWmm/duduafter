<?php
	header('Access-Control-Allow-Origin:*');
	$connect = mysqli_connect("localhost","root","root","dudubus");
	$result = mysqli_query($connect,"INSERT INTO city(shi,sheng,shiid) VALUES('".$_GET["shi"]."','".$_GET["sheng"]."','".$_GET["shiid"]."')");
	
	
	mysqli_close($connect);
	echo $result; 
?>

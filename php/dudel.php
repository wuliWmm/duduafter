<?php
	header('Access-Control-Allow-Origin:*');
	$connect = mysqli_connect("localhost","root","root","dudubus");
	$result = mysqli_query($connect,"DELETE FROM city WHERE id = '".$_GET["id"]."'");
	mysqli_close($connect);
	echo $result; 
?>
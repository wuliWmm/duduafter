<?php
	header('Access-Control-Allow-Origin:*');
	$connect = mysqli_connect("localhost","root","root","dudubus");
	$result = mysqli_query($connect,"INSERT INTO waystation(zhandian,nth,lineid,postion) VALUES('".$_GET["a"]."','".$_GET["b"]."','".$_GET["c"]."','".$_GET["d"]."')");
	
	
	mysqli_close($connect);
	echo $result; 
?>

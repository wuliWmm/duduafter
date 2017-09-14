<?php
	header('Access-Control-Allow-Origin:*');
	$connect = mysqli_connect("localhost","root","root","dudubus");
	$result = mysqli_query($connect,"INSERT INTO cityline(linename,shiid,lineid,buser) VALUES('".$_GET["ln"]."','".$_GET["li"]."','".$_GET["ls"]."','".$_GET["si"]."')");
	
	
	mysqli_close($connect);
	echo $result; 
?>

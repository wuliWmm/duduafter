<?php
	header('Access-Control-Allow-Origin:*');
	$connect = mysqli_connect("localhost","root","root","dudubus");
	$result = mysqli_query($connect,"SELECT * FROM waystation WHERE lineid='".$_GET["bus"]."'");
	
	$rows= [];
	while($row = mysqli_fetch_assoc($result)){
	$rows[]=$row;	
	};
	mysqli_free_result($result);
	mysqli_close($connect);
	echo json_encode($rows);
	
?>
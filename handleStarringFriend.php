<?php

$host = "sophia";
$username = "cchen";
$password = "girigiri";
$database = "cchen";

mysql_connect($host,$username,$password);

mysql_select_db($database) or die("Unable to select database");
    
	$friendid = $_GET['friendid'];
	$newval = $_GET['newval'];
	$query	=	"UPDATE	friends	SET	starred= '$newval'	WHERE	friendID= $friendid;";
	mysql_query($query) or die("Unable to execute query");
	
	$query1 = "SELECT name FROM friends WHERE starred='Y';";
	$result1 = mysql_query($query1) or die("Unable to execute query");
	while ($row = mysql_fetch_array($result1, MYSQL_ASSOC)){
		print "<li>".$row['name']."</li>";
	}
	
   mysql_close();
   
  
?>
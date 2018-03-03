<?php

$host = "sophia";
$username = "cchen";
$password = "girigiri";
$database = "cchen";

mysql_connect($host,$username,$password);

mysql_select_db($database) or die("Unable to select database");
    
	$query = "SELECT name FROM friends WHERE starred='Y';";
	$result = mysql_query($query) or die("Unable to execute query");
	while ($row = mysql_fetch_array($result, MYSQL_ASSOC)){
		print "<li>".$row['name']."</li>";
	}
	
   mysql_close();
   
  
?>
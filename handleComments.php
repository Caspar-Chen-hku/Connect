<?php

$host = "sophia";
$username = "cchen";
$password = "girigiri";
$database = "cchen";

mysql_connect($host,$username,$password);

mysql_select_db($database) or die("Unable to select database");

if ( isset($_GET["postid"]) && isset($_GET["content"])){
    
	$postid = $_GET["postid"];
    $content = $_GET["content"];
	
	$query = "SELECT MAX(commentID) AS maxid FROM comments;";
	$result = mysql_query($query) or die("Unable to execute query");
	$row = mysql_fetch_array($result, MYSQL_ASSOC);
	$commid = $row['maxid']+1;
	
	$time = date("F d Y");
	
   $query1 = "INSERT INTO  `comments` (  `commentID` ,  `postID` ,  `time` ,  `commContent` ) 
VALUES ( $commid, $postid, \"$time\", \"$content\" );";
	
   mysql_query($query1) or die("Unable to execute query1");
   
   print "<h4><i>You said: </i> <b>$content</b> </h4>";
   print "<h5>$time</h5>";
   
   mysql_close();
   
}
  
?>
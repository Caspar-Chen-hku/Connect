<?php

$host = "sophia";
$username = "cchen";
$password = "girigiri";
$database = "cchen";

mysql_connect($host,$username,$password);

mysql_select_db($database) or die("Unable to select database");

if ( isset($_GET["index_start"]) && isset($_GET["index_end"])){
    
	$start = $_GET["index_start"];
    $end = $_GET["index_end"];
	
   $query1 = "SELECT DISTINCT * FROM posts p, friends f WHERE p.postID >=".$start." AND p.postID<=".$end." AND p.friendID=f.friendID;";
   
   $result1 = mysql_query($query1) or die("Unable to execute query");
   
   while($row = mysql_fetch_array($result1, MYSQL_ASSOC))
{
	print "<li id='post".$row['postID']."'><div>";
	$postid = $row['postID'];
	$friendid = $row['friendID'];
	$starred = $row['starred'];
	
	if ($row['starred']=='N'){
		print "<div><img id='star".$row['postID']."' src='images/grey_star.png' title='click to star or unstar' onclick='changeStar(this,$friendid);'></div>";
	}
	else {
		print "<div><img id='star".$row['postID']."' src='images/yellow_star.gif' title='click to star or unstar' onclick='changeStar(this,$friendid);'></div>";
	}
	
    print "<h3><i>".$row['name']."</i></h3>";
	
	print "<span><div><b>time</b>: ".$row['time']."</div><div> <b> location</b>: ".$row['location']."</div></span>";
	print "<p>".$row['content']."</p>";
	print "<img src='".$row['image']."' >";
	
	$query2 = "SELECT * FROM comments WHERE postID=".$row['postID'];
	$result2 = mysql_query($query2) or die("Unable to execute query");
	while ($row2 = mysql_fetch_array($result2, MYSQL_ASSOC)){
		print "<h4><i>You said: </i> <b>".$row2['commContent']."</b></h4>";
		print "<h5>".$row2['time']."</h5>";
	}
	
	print "<h6 id='commHolder".$row['postID']."'></h6>";
	//print "<form action='handleComments.php' id='commentForm' onsubmit='addComment();'>";
	print "<input id='comm_post".$row['postID']."' type='text' name='comm' placeholder='write a comment here...'> ";
	///print "<input type='submit'>";
	//print "</form>"
	
	print "	<button class='buttons' id='post_btn".$row['postID']."' onclick='addComment($postid);' title='click to post'>";
	print "<p>post</p></button>";
		
	print "</div></li>";
} 
   
   mysql_close();
   
}
  
?>
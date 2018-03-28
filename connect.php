<?php
session_start();
if(!isset($_SESSION['mail'])){
	header("location:index.php");
}

require "connection.php";
$ema=$_SESSION['mail'];
$sql="select * from user where email='$ema'";
$dataObj = $conn->query($sql);
$user = $dataObj->fetch_row();
function getTime($time){
	$now =strtotime("now");
	$lastWeek = strtotime($time);
	$difference = abs($now - $lastWeek)/3600;
	$agoTime=getAgoTime($difference/24);
	return $agoTime;
}
function getAgoTime($time)
{
	if (floor($time)>=1)
	{
		return floor($time)." days ago";
	}
	else{
		if(floor($time*24>=1)){
		return floor($time*24)." hours ago";
	}
	else{
		return floor($time*60*24)." minutes ago";
	}

}
}
function getPostType($type)
{
	if($type==0)
	{
		return "I";
	}
	else{
		return "T";	 
	}
}
$sql="select post.post_data, post.post_type, post.post_time,feed.email from post inner JOIN feed on post.post_id=feed.post_id order by post.post_time DESC;";
$dataObj = $conn->query($sql);
while ($row = $dataObj->fetch_assoc()) {

        $data[] = $row;
    }

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="author" content="Team Hestabit">
    <meta name="description" content="">
	<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>Hestabit &copy;</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!--CDN FOR Font Awesom-->
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <link rel="stylesheet"  type="text/css" href="connect.css"/>
    <style >
    	body{
    		background-image:url("img/bg-img5.jpg");
    		height: 100px;
    	}
    </style>
	</head>
<body>

<div class="header-section">
<div class="container">
	<div class="row">
		<div class="col-md-9">
			<div class="header-text">
			<p><strong>Face<span>Look</span></strong></p>
			</div>
		</div>
		<div class="col-md-3">
			<div class="logout">
			<p> <a href="logout.php" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> Log out
        </a>    </p>
			</div>
		</div>		
	</div>
</div>
</div>
<br>
<div class="post-body">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="user-details">
					<ul>
						<li> <div class="profile">
							
							<img src="<?= $user[8];?>" width="100px" height="100px" alt="profile picture"/></div></li>
							<?php 
								foreach($user as $services){
									if($user[9]==$services || $user[0]==$services){
									continue;
									}
									else 
									{
										echo "<li>$services</li>";
									}
								}
							?>
    				</ul>		
  					<button type="button" class="btn btn-success btn btn-md"  data-toggle="modal" data-target="#myModal"
  					>Open Edit</button><br>
 				</div>
 				
			</div>
			<div class="col-md-offset-1 col-md-6">
				<form action="newsfeed.php" method="POST">
					<div class="input-group">
   						<input type="text" class="form-control" name="feed" id="upost">
   						<span class="input-group-btn">
       					<button class="btn btn-default" type="submit" name="post-button">Post Here!!</button>
   						</span>
					</div>
				</form>
					<p>
  						<label for="comment">Your Post</label>
  					</p>
  					<div class="timeline">
						<ul>
<?php foreach ($data as $key) :?>
							<li>
<?php 
	$pic= $key['post_data'];
	$post_mail=$key['email'];
	$qry="select name from user where email='$post_mail';";
	$dataval=$conn->query($qry);
	$row=$dataval->fetch_assoc();
?>
						<div class="post">
							<span id="type"><?php echo getPostType($key['post_type']);?></span>
<?php if($key['post_type']==1)
{
	echo "<p>$pic</p>";
}
else {
	echo '<img src='.$pic.' alt="image" class="img-responsive"/ >';
}
?>
						<p><span>Posted by <strong><?php echo $row['name'];?></strong></span><span>     Posted at <?php echo getTime($key['post_time']);?></span></p>
		</div>
	</li>
	<?php endforeach;?>
</ul>
</div>	
					s
			</div>
		</div>
	</div>
</div>

<!--edit buuton form!-->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
<div id="dialog" title="Edit Details">
  	<form  action="update.php" method="POST" role="form">
			<div class="form-group">
				<input type="text" name="name" id="name" class="form-control" placeholder="Name" value="<?= $user[1]?>">
				<input type="submit" name="update_name">
			</div>
			<div class="form-group">
				<input type="password" name="password" id="password" class="form-control" placeholder="passsword" value="<?= $user[7]?>">
				<input type="submit" name="update_password">
			</div>
			<div class="form-group">
				<input type="text" name="description" id="description" class="form-control" placeholder="Description" value="<?= $user[8]?>">
				<input type="submit" name="update_desc">
			</div>									
			<div class="form-group">
				<input type="text" name="address" id="address" class="form-control" placeholder="address" value="<?= $user[5]?>">
				<input type="submit" name="update_addr">
			</div>
	</form>
</div>
</div>
</div>
<script type="text/javascript">

$("#picture").change(function() {

   	var val = $(this).val();
	switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
      case 'gif': case 'jpg': case 'png': case 'jpeg':
       alert("an image");
       break;
      default:
       $(this).val('');
            // error message here
       alert("not an image");
       break;
    }
});
$(document).ready(function(){
	setInterval(function(){
		$('.timeline').load('time.php')
	}, 30000);
});
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

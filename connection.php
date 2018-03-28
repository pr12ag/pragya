<?php
$password="root";
$username="root";
$server="localhost";
$dbname="pragyadb";
$conn = new mysqli($server, $username, $password, $dbname);
if ($conn->connect_error) 
	{
    	die("Connection failed: " . $conn->connect_error);
	} 
else
	{
		
	}
?>
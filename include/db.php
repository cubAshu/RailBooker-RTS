<?php
// Database connection
$host = $_ENV['HOST'];
$username = $_ENV['USERNAME'];
$password = $_ENV['PASSWORD'];
$database = $_ENV['DATABASE'];

$conn = mysqli_connect($host, $username, $password, $database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
session_start();
?>

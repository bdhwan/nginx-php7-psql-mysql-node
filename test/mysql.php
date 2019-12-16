<?php
$conn = mysqli_connect(
  'url',
  'id',
  'password',
  'dbname');
$sql = "SELECT * FROM test";
$result = mysqli_query($conn, $sql);
var_dump($result->num_rows);
?>
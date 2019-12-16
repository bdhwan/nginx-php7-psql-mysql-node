<?php

// Connection details
$conn_string = "host=hosturl port=port dbname=dbname user=user password=password options='--client_encoding=UTF8'";

// Establish a connection with MySQL server
$dbconn = pg_connect($conn_string);

// Check connection status. Exit in case of errors
if(!$dbconn) {
echo "Error: Unable to open database\n";
} else {
echo "Opened database successfully\n";
}


$query = "SELECT name FROM \"_User\" limit 10";
$cities = pg_query($query) or die('Query failed: ' . pg_last_error());
$myarray = array();
while ($row = pg_fetch_assoc($cities)) {
$myarray[] = $row;
}

// Encode response into JSON array
echo json_encode($myarray);




// Close connection
pg_close($dbconn);

?>
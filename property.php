

























































<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname= "onlineflatselling";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
 
//insert query stored in a string
$sql = "INSERT INTO property (district,street)VALUES ('$_POST[district]','$_POST[street]')";
//insert data
if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
?>
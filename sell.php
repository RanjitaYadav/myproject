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

$name = "";
$phone=0;
$email = "";
$district="";
$street="";
$size="";
$prize=0;
$rooms=0;
$floor=0;
$errors = array();


if (isset($_POST['reg_user'])) {
  // receive all input values from the form
  $name = mysqli_real_escape_string($conn, $_POST['name']);
  $phone = mysqli_real_escape_string($conn, $_POST['phone']);
  $email = mysqli_real_escape_string($conn, $_POST['email']);
  $district = mysqli_real_escape_string($conn, $_POST['district']);
  $street = mysqli_real_escape_string($conn, $_POST['street']);
  $size = mysqli_real_escape_string($conn, $_POST['size']);
  $prize = mysqli_real_escape_string($conn, $_POST['prize']);
  $rooms = mysqli_real_escape_string($conn, $_POST['rooms']);
  $floor = mysqli_real_escape_string($conn, $_POST['floor']);
  

  // for1m validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  
  if (empty($name)) { array_push($errors, "Name is required"); }
  if (empty($phone)) { array_push($errors, "Phone is required"); }
  if (empty($email)) { array_push($errors, "Name is required"); }
  if (empty($district)) { array_push($errors, "District is required"); }
  if (empty($street)) { array_push($errors, "Street is required"); }
  if (empty($size)) { array_push($errors, "Size is required"); }
  if (empty($prize)) { array_push($errors, "Prize is required"); }
  if (empty($rooms)) { array_push($errors, "Rooms is required"); }
  if (empty($floor)) { array_push($errors, "Floors is required"); }
}


if (count($errors) == 0){







 
//insert query stored in a string
$sql = "INSERT INTO seller (name,phone,email) VALUES ('$_POST[name]','$_POST[phone]','$_POST[email]')"; //insert data
if ($conn->query($sql) === TRUE) {
	
	$sql2 = "INSERT INTO property (district,street)VALUES ('$_POST[district]','$_POST[street]')";
	if ($conn->query($sql2) === TRUE) {
		$sql3 ="INSERT INTO flat(size,prize,rooms,floor) VALUES ('$_POST[size]','$_POST[prize]','$_POST[rooms]','$_POST[floor]')";
 if ($conn->query($sql3) === TRUE) {
	 header("Location: image.php");
 }
	}
}
 else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
}
//header("Location: image.php");
?>
<?php
session_start();
$connect = new mysqli("localhost","root","","rental");
header("Access-Control-Allow-Origin: *");

$action = $_POST["action"]; //action determines what to do on the database
if("Login" == $action){ //For the login screen
	//Check if entered informations matches on database
	$stmt = $connect->prepare("SELECT * FROM user WHERE username = ? and password = ?");
	$stmt->bind_param("ss", $username, $password);
	$username=$_POST['username'];
	$password=$_POST['password'];
	$stmt->execute();
	$result = $stmt->get_result();
	$data = $result->fetch_assoc();
	if ($result) {
  	if ($result->num_rows > 0) {
  	  	echo 'success';
  	} else {
  	  	echo 'not found';
 	 }
	} else {
  		echo 'Error: '.mysql_error();
	}
	$stmt->close();
	$connect->close();
}

if("Get" == $action){ //if there is user match on database, send back user as json
	$username=$_POST['username'];
	$password=$_POST['password'];
	//Check if entered informations macthes on database
	$consult = $connect->query("SELECT * FROM user WHERE username ='".$username."' and password = '".$password."'");

	$result = array();
	while ($extractdata = $consult->fetch_assoc()) {
	$result[] = $extractdata;
}
	echo json_encode($result);
	$connect->close();
}
if("Register" == $action){// Register a new user
	$username=$_POST['username'];
	$password=$_POST['password'];
	$mail=$_POST['email'];
	$age=$_POST['age'];
	//$level=$_POST['level'];
	//$number=$_POST['number'];
	//$address=$_POST['address'];
	$user_check = "SELECT * FROM user WHERE username='$username' OR email='$mail' LIMIT 1";
	$res = $connect->query($user_check);
	$user = mysqli_fetch_assoc($res);
	
	if ($user) { // if user already exists
	  if ($user['username'] == $username) {
		echo "Username already exists!";
	  }
	  if ($user['email'] == $mail) {
		echo "E-mail already exists!";
	  }
	} else {
	$sql = "INSERT INTO user (password, email, username, age) VALUES ('$password', '$mail', '$username', '$age')";
	
	$result = $connect ->query($sql);
	echo "success";
	}
	$connect ->close();
	return;
}
if("Update_User" == $action){ //update user details
	$id = $_POST['id'];
	$oldUsername = $_POST["oldUsername"];
	$oldMail=$_POST['oldMail']; //oldMail and oldUsername will be used to compare between other users

	//Entered details
	$username = $_POST["username"];
	$password = $_POST["password"];
	$mail=$_POST['email'];
	$age=$_POST['age'];

	$user_check = "SELECT * FROM user WHERE username='$username' OR email='$mail' LIMIT 1";
	$res = $connect->query($user_check);
	$user = mysqli_fetch_assoc($res);
	
	 // if user already exists
	if (($user['username'] == $username && $username != $oldUsername) ||
	($user['email'] == $mail && $mail != $oldMail)) {
	  if ($user['username'] == $username && $username != $oldUsername) {
		echo "Username already exists!";
	  }
	  if ($user['email'] == $mail && $mail != $oldMail) {
		echo "E-mail already exists!";
	  }
	} else { //if a user doesn't exists with details entered, update the details
		$sql = "UPDATE user SET username = '$username', password = '$password', email = '$mail', age = '$age'
		 WHERE user_id = '$id'";
		if($connect->query($sql) === TRUE){
			echo "success";
		}else{
			echo "error";
		}
	}
	$connect->close();
	return;
}
if("List_Users" == $action){ //send back all users as json list
	$db_data = array();
	$sql = "SELECT * FROM user ORDER BY user_id ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_Categories" == $action){ //send back all categories as json list
	$db_data = array();
	$sql = "SELECT * FROM category ORDER BY category_id ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_Brands" == $action){ //send back all brands as json list
	$db_data = array();
	$sql = "SELECT * FROM brand ORDER BY brand_id ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_Vehicles" == $action){ //send back all vehicles as json list
	$db_data = array();
	$sql = "SELECT * FROM vehicle ORDER BY vehicle_id ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_Locations" == $action){ //send back all locations as json list
	$db_data = array();
	$sql = "SELECT * FROM `location` ORDER BY location_id ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_Rents" == $action){ //send back all rents as json list
	$db_data = array();
	$sql = "SELECT * FROM rent ORDER BY rent_id ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_Rents_Sorted" == $action){ //send back all rents as json list
	$sort=$_POST['sort'];
	$db_data = array();
	$sql = "SELECT * FROM rent ORDER BY $sort ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_Rents_Filtered" == $action){ //send back all rents as json list
	$filter=$_POST['filter'];
	$sort=$_POST['sort'];
	$db_data = array();
	$sql = "SELECT * FROM rent WHERE vehicle_id IN (
		SELECT vehicle_id FROM vehicle WHERE brand_id IN(
			SELECT brand_id FROM brand WHERE brand_name='$filter'
		)
	) 
	ORDER BY $sort ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_Created_Rents" == $action){ //send back all created rents as json list
	$db_data = array();
	$sql = "SELECT * FROM created_rent ORDER BY user_id ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("Get_Created_Rent" == $action){ //find the created_rent by corresponding rent_id
	$rent_id= (int)($_POST['rent_id']);
	$db_data = array();
	$sql = "SELECT * FROM `created_rent` WHERE rent_id='$rent_id' LIMIT 1";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("Get_Rent_Location" == $action){ //find the category of vehicle by corresponding vehicle_id
	$rent_id= (int)($_POST['rent_id']);
	$db_data = array();
	$sql = "SELECT * FROM `location` WHERE location_id=(SELECT location_id FROM rent WHERE rent_id='$rent_id' LIMIT 1)";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("Get_Vehicle_Brand" == $action){ //find the brand of vehicle by corresponding vehicle_id
	$vehicle_id= (int)($_POST['vehicle_id']);
	$db_data = array();
	$sql = "SELECT * FROM brand WHERE brand_id=(SELECT brand_id FROM vehicle WHERE vehicle_id='$vehicle_id' LIMIT 1)";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("Get_Vehicle_Category" == $action){ //find the category of vehicle by corresponding vehicle_id
	$vehicle_id= (int)($_POST['vehicle_id']);
	$db_data = array();
	$sql = "SELECT * FROM category WHERE category_id=(SELECT category_id FROM vehicle WHERE vehicle_id='$vehicle_id' LIMIT 1)";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("Get_Vehicle_With_ID" == $action){ //find the vehicle by corresponding vehicle_id
	$vehicle_id= (int)($_POST['vehicle_id']);
	$db_data = array();
	$sql = "SELECT * FROM vehicle WHERE vehicle_id='$vehicle_id' LIMIT 1";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("Get_Rent_With_ID" == $action){ //find the rent by corresponding rent_id
	$rent_id= (int)($_POST['rent_id']);
	$db_data = array();
	$sql = "SELECT * FROM rent WHERE rent_id='$rent_id' LIMIT 1";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("Get_Category_id" == $action){ //find the category_id by corresponding category_name
	$category_name=$_POST['category_name'];
	$db_data = array();
	$sql = "SELECT category_id FROM category WHERE category_name='$category_name' LIMIT 1";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("Get_Brand_id" == $action){ //find the brand_id by corresponding brand_name
	$brand_name= $_POST['brand_name'];
	$db_data = array();
	$sql = "SELECT brand_id FROM brand WHERE brand_name='$brand_name' LIMIT 1";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_User_Orders" == $action){ //send back all orders of a user as json list
	$ordered_user= (int)($_POST['ordered_user']);
	$db_data = array();
	$sql = "SELECT * FROM `order` WHERE ordered_user='$ordered_user' ORDER BY end_Time ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("List_User_Rents" == $action){ //send back all rents of a user as json list
	$id= (int)$_POST['id'];
	$db_data = array();
	$disable = "SET FOREIGN_KEY_CHECKS=0";
	$connect ->query($disable);
	$sql = "SELECT * FROM `rent` WHERE rent_id IN(SELECT rent_id FROM created_rent WHERE user_id='$id') ORDER BY rent_id ASC";
	$result = $connect->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$db_data[] = $row;
		}
		echo json_encode($db_data);
	}else{
		echo "error";
	}
	$connect->close();
	return;
}
if("Create_Rent" == $action){// Create a new rent
	$image=$_POST['image'];
	$category_id= (int)$_POST['category_id'];
	$brand_id= (int)$_POST['brand_id'];
	$vehicle_name=$_POST['vehicle_name'];
	$model_year= (int)$_POST['model_year'];
	$color=$_POST['color'];
	$horse_power=$_POST['horse_power'];
	$city=$_POST['city'];
	$district=$_POST['district'];
	$neighborhood=$_POST['neighborhood'];
	$contact_number=$_POST['contact_number'];
	$price= (int)$_POST['price'];
	$user_id= (int)$_POST['user_id'];

	$sql1 = "INSERT INTO `vehicle` (vehicle_name, horse_power, model_year, color, image, category_id, brand_id) 
	VALUES ('$vehicle_name', '$horse_power', '$model_year', '$color', '$image', '$category_id', '$brand_id')";
	$result = $connect ->query($sql1);
	$vehicle_id=$connect->insert_id;
	if($result === TRUE){
		$sql2 = "INSERT INTO `location`(city, district, neighborhood) 
		VALUES ('$city', '$district', '$neighborhood')";
		$result = $connect ->query($sql2);
		$location_id=$connect->insert_id;

		if($result === TRUE){
			$disable = "SET FOREIGN_KEY_CHECKS=0";
			$connect ->query($disable);
			$sql3 = "INSERT INTO rent (price, contact_number, vehicle_id, location_id) VALUES ('$price', '$contact_number', '$vehicle_id', '$location_id')";
			$result = $connect ->query($sql3);
			$rent_id=$connect->insert_id;
			if($result === TRUE){
				$sql4 = "INSERT INTO `created_rent` (user_id, rent_id, create_time) VALUES ('$user_id', '$rent_id', now())";
				$result = $connect ->query($sql4);
				if($result === TRUE){
					echo "success";
				}else{
					echo "Error4 ". $vehicle_id;
				}
			}else{
				echo "error3". $vehicle_id;
			}
		}else{
			echo "error2";
		}
	}else{
		echo "error1";
	}

	$connect ->close();
	return;
}

if("Update_Rent" == $action){// Update the rent by corresponding rent_id
	$rent_id= (int)$_POST['rent_id'];
	$vehicle_id= (int)$_POST['vehicle_id'];
	$location_id= (int)$_POST['location_id'];
	$image=$_POST['image'];
	$category_id= (int)$_POST['category_id'];
	$brand_id= (int)$_POST['brand_id'];
	$vehicle_name=$_POST['vehicle_name'];
	$model_year= (int)$_POST['model_year'];
	$color=$_POST['color'];
	$horse_power=$_POST['horse_power'];
	$city=$_POST['city'];
	$district=$_POST['district'];
	$neighborhood=$_POST['neighborhood'];
	$contact_number=$_POST['contact_number'];
	$price= (int)$_POST['price'];


	$sql1 = "UPDATE `vehicle` SET vehicle_name='$vehicle_name', horse_power='$horse_power', model_year='$model_year', color='$color', image='$image', category_id='$category_id', brand_id='$brand_id'
	WHERE vehicle_id='$vehicle_id'";
	$result = $connect ->query($sql1);
	if($result === TRUE){
		$sql2 = "UPDATE `location` SET city='$city', district='$district', neighborhood='$neighborhood'
		WHERE location_id='$location_id'";
		$result = $connect ->query($sql2);

		if($result === TRUE){
			$sql3 = "UPDATE rent SET price='$price', contact_number='$contact_number', vehicle_id='$vehicle_id', location_id='$location_id'
			WHERE rent_id='$rent_id'";
			$result = $connect ->query($sql3);
			$rent_id=$connect->insert_id;
			if($result === TRUE){
				echo "success";
			}else{
				echo "error3". $vehicle_id;
			}
		}else{
			echo "error2";
		}
	}else{
		echo "error1";
	}

	$connect ->close();
	return;
}

if("Delete_Rent" == $action){// Delete the rent
	$rent_id= (int)$_POST['rent_id'];
	$disable = "SET FOREIGN_KEY_CHECKS=0";
	$connect ->query($disable);
	$sql1 = "DELETE FROM `rent` WHERE rent_id='$rent_id'";
	$sql2 = "DELETE FROM `created_rent` WHERE rent_id='$rent_id'";
	$result = $connect ->query($sql1);
	if($result === TRUE){
		if($connect->query($sql2) === TRUE){
			echo "success";
		}else{
			echo "error2";
		}
	}else{
		echo "error1";
	}
	$connect ->close();
	return;
}
if("Delete_Order" == $action){// Delete the order
	$order_id= (int)$_POST['order_id'];
	$disable = "SET FOREIGN_KEY_CHECKS=0";
	$connect ->query($disable);
	$sql1 = "DELETE FROM `order` WHERE order_id='$order_id'";
	$result = $connect ->query($sql1);
	if($result === TRUE){
		echo "success";

	}else{
		echo "error1";
	}
	$connect ->close();
	return;
}

if("Delete_Vehicle" == $action){// Delete the vehicle
	$vehicle_id= (int)$_POST['vehicle_id'];
	$disable = "SET FOREIGN_KEY_CHECKS=0";
	$connect ->query($disable);
	$sql = "DELETE FROM `vehicle` WHERE vehicle_id='$vehicle_id'";
	$result = $connect ->query($sql);
	if($result === TRUE){
	}else{
		echo "error1";
	}
	$connect ->close();
	return;
}
?>
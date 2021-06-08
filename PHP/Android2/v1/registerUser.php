
<?php 

require_once '../includes/DbOperations.php';

$response = array(); 

if($_SERVER['REQUEST_METHOD']=='POST'){
	if(
		    isset($_POST['consumer_no']) and
			isset($_POST['lpg_id']) and 
			isset($_POST['first_name']) and 
			isset($_POST['last_name']) and 
			isset($_POST['contact_no']) and 
			isset($_POST['email_id']) and 
			isset($_POST['state']) and 
			isset($_POST['city']) and 
			isset($_POST['pincode']) and 
			isset($_POST['landmark']) and 
			isset($_POST['addressline1']) and 
			isset($_POST['addressline2']) and 
			isset($_POST['adhaar_no']) and 
			isset($_POST['gst_no']) and 
			
				isset($_POST['password']))
		{
		//operate the data further 

		$db = new DbOperations(); 

		$result = $db->createUser(
		                $_POST['consumer_no'],
						$_POST['lpg_id'],
						$_POST['first_name'],
						$_POST['last_name'],
						$_POST['contact_no'],
						$_POST['email_id'],
						$_POST['state'],
						$_POST['city'],
						$_POST['pincode'],
						$_POST['landmark'],
						$_POST['addressline1'],
						$_POST['addressline2'],
						$_POST['adhaar_no'],
						$_POST['gst_no'],
						$_POST['password']
								);
		if($result == 1){
			$response['error'] = false; 
			$response['message'] = "Consumer registered successfully";
		}elseif($result == 2){
			$response['error'] = true; 
			$response['message'] = "Some error occurred please try again";			
		}elseif($result == 0){
			$response['error'] = true; 
			$response['message'] = "It seems you are already registered, please choose a different email and username";						
		}

	}else{
		$response['error'] = true; 
		$response['message'] = "Required fields are missing";
	}
}else{
	$response['error'] = true; 
	$response['message'] = "Invalid Request";
}

echo json_encode($response);

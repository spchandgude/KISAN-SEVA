<?php 

require_once '../includes/DbOperations.php';

$response = array(); 

if($_SERVER['REQUEST_METHOD']=='POST'){
	if(isset($_POST['email_id']) and isset($_POST['password'])){
		$db = new DbOperations(); 

		if($db->userLogin($_POST['email_id'], $_POST['password'])){
			$user = $db->getUserByUsername($_POST['email_id']);
			$response['error'] = false; 
			
			$response['consumer_no']=$user['Consumer_no'];
			$response['lpg_id']=$user['Consumer_LPG_ID'];
			$response['first_name']=$user['Consumer_first_name'];
			$response['last_name']=$user['Consumer_last_name'];
			$response['contact_no']=$user['Consumer_contact_no'];
			$response['email_id']=$user['Consumer_email_id'];
			$response['state']=$user['Consumer_State'];
			$response['city']=$user['Consumer_City'];
			$response['pincode']=$user['Consumer_PINCODE'];
			$response['landmark']=$user['Consumer_landmark'];
			$response['addressline1']=$user['Consumer_addressline1'];
			$response['addressline2']=$user['Consumer_addressline2'];
			$response['adhaar_no']=$user['Consumer_Adhaar_no'];
			$response['gst_no']=$user['Consumer_GST_no'];
			
			
		}else{
			$response['error'] = true; 
			$response['message'] = "Invalid email or password";			
		}

	}else{
		$response['error'] = true; 
		$response['message'] = "Required fields are missing";
	}
}
else{
	$response['error'] = true; 
	$response['message'] = "Invalid Request";
}

echo json_encode($response);
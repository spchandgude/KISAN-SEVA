<?php 

	class DbOperations{

		private $con; 

		function __construct(){

			require_once dirname(__FILE__).'/DbConnect.php';

			$db = new DbConnect();

			$this->con = $db->connect();

		}

		/*CRUD -> C -> CREATE */

		public function createUser($consumer_no,$lpg_id,$first_name,$last_name,$contact_no,$email_id,$state,$city, $pincode, $landmark, $addressline1, $addressline2, $adhaar_no, $gst_no, $pass){
			if($this->isUserExist($contact_no,$email_id)){
				return 0; 
			}else{
				$password = md5($pass);
				$stmt = $this->con->prepare("INSERT INTO `Consumer` (`Consumer_no`, `Consumer_LPG_ID`, `Consumer_first_name`, `Consumer_last_name`, `Consumer_contact_no`, `Consumer_email_id`, `Consumer_State`, `Consumer_City`, `Consumer_PINCODE`, `Consumer_landmark`, `Consumer_addressline1`, `Consumer_addressline2`, `Consumer_Adhaar_no`, `Consumer_GST_no`, `Consumer_password`) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				$stmt->bind_param("sssssssssssssss",$consumer_no,$lpg_id,$first_name,$last_name,$contact_no,$email_id,$state,$city, $pincode, $landmark, $addressline1, $addressline2, $adhaar_no, $gst_no, $password);
				if($stmt->execute()){
					return 1; 
				}else{
					return 2; 
				}
			}
		}

		public function userLogin($email, $pass){
			$password = md5($pass);
			$stmt = $this->con->prepare("SELECT Consumer_no FROM Consumer WHERE Consumer_email_id = ? AND Consumer_password = ?");
			$stmt->bind_param("ss",$email,$password);
			$stmt->execute();
			$stmt->store_result(); 
			return $stmt->num_rows > 0; 
		}

		public function getUserByUsername($email){
			$stmt = $this->con->prepare("SELECT * FROM Consumer WHERE Consumer_email_id = ?");
			$stmt->bind_param("s",$email);
			$stmt->execute();
			return $stmt->get_result()->fetch_assoc();
		}
		

		private function isUserExist($contact_no, $email){
			$stmt = $this->con->prepare("SELECT Consumer_no FROM Consumer WHERE Consumer_email_id = ? OR Consumer_contact_no = ?");
			$stmt->bind_param("ss", $email,$contact_no);
			$stmt->execute(); 
			$stmt->store_result(); 
			return $stmt->num_rows > 0; 
		}

	}
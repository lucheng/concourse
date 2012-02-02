<?php 
class Payments {
	function __construct(){
		redirect(GetSettValue ( "Payments_url" ),3,'Your order has been submitted successfully!');
	}
 

}
?>



<?php
session_start();

// Store the submitted data in a session variable
$_SESSION['submitted_data'] = $_POST;

// Redirect back to the form page
header("Location: payment_requisition.php");
exit;
<?php
// Connect to the database
$conn = mysqli_connect("localhost", "root", "", "bugema_university");

// Check connection
if (!$conn) {
    die("Connection failed: ". mysqli_connect_error());
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $requested_by = $_POST['requested_by'];
    $amount_in_words = $_POST['amount_in_words'];
    $amount = $_POST['amount'];
    $reason = $_POST['reason'];
    $date = $_POST['date'];
    $tel_no = $_POST['tel_no'];
    $signature = $_POST['signature'];
    $checked_by = $_POST['checked_by'];
    $approved_by = $_POST['approved_by (Supervisor)'];
    $charged_to = $_POST['charged_to'];
    $paid_by = $_POST['paid_by (Cashier)'];
    $received_by = $_POST['received_by (Full Names)'];
    $bank_ac_no = $_POST['bank_ac_no'];
    $bank_name = $_POST['bank_name'];
    $voucher_no = $_POST['voucher_no'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO requisitions (requested_by, amount_in_words, amount, reason, date, tel_no, signature, checked_by, approved_by, charged_to, paid_by, received_by, bank_ac_no, bank_name, voucher_no) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    $stmt->bind_param("sssssssssssssss", $requested_by, $amount_in_words, $amount, $reason, $date, $tel_no, $signature, $checked_by, $approved_by, $charged_to, $paid_by, $received_by, $bank_ac_no, $bank_name, $voucher_no);

    if ($stmt->execute()) {
        echo "<div class='success-message'>Form submitted successfully!</div>";
        // Redirect to a new page or refresh the current page
        header("Location: submit.php");
        exit;
    } else {
        echo "Error: ". $stmt->error;
    }

    $stmt->close();
    mysqli_close($conn);
}


// Create a function to display the form
function displayForm() {
    ?>
    <html>
    <head>
        <title>Bugema University Payment/Disbursement Requisition</title>
        <style>
            body {
                font-family: 'Times New Roman', Times;
            }
            .form-container {
                width: 75%;
                margin: 150px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .form-header {
                text-align: center;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 20px;
                display: flex;
                flex-wrap: wrap;
            }
            .form-group > div {
                flex: 1;
                min-width: 200px;
                padding: 0 10px;
            }
            .form-label {
                display: block;
                margin-bottom: 10px;
            }
            .form-input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .form-button {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .form-button:hover {
                background-color: #3e8e41;
            }
            .success-message {
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #4CAF50;
                border-radius: 10px;
                background-color: #dff0d8;
                color: #3c763d;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h2 class="form-header">BUGEMA UNIVERSITY<br> PAYMENT/DISBURSMENT REQUISITION</h2>
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                <p style="color: black;">TO:THE DVC-FINANCE</p>
                <div class="form-group">
                    <div>
                        <label class="form-label" for="requested_by">Requested by:</label>
                        <input type="text" id="requested_by" name="requested_by" class="form-input">
                    </div>
                    <div>
                        <label class="form-label" for="amount">Ushs:</label>
                        <input type="number" id="amount" name="amount" class="form-input">
                    </div>
                    <div>
                        <label class="form-label" for="tel_no">Tel/No.:</label>
                        <input type="tel" id="tel_no" name="tel_no" class="form-input">
                    </div>
                </div>
                    <div>
                        <label class="form-label" for="amount_in_words">Amount in words:</label>
                        <input type="text" id="amount_in_words" name="amount_in_words" class="form-input">
                    </div>
                    <div>
                        <label class="form-label" for="reason">Reason:</label>
                        <textarea id="reason" name="reason" class="form-input"></textarea>
                    </div>
                    <div>
                        <label class="form-label" for="signature">Signature:</label>
                        <input type="text" id="signature" name="signature" class="form-input">
                    </div>
                    <div class="form-groups">
                    </div>
                <div class="form-group">
                    <div>
                        <label class="form-label" for="checked_by">Checked by: (Supervisor)</label>
                        <input type="text" id="checked_by" name="checked_by" class="form-input">
                    </div>
                    <div class="form-groups">
                    </div>
                    <div>
                        <label class="form-label" for="aproved_by">Approved by:</label>
                        <input type="text" id="approved_by" name="approved_by" class="form-input">
                    </div>
                </div>
                <div class="form-group">
                    <div>
                        <label class="form-label" for="charged_to">Charged to:</label>
                        <input type="text" id="charged_to" name="charged_to" class="form-input">
                        <label class="form-label" for="charged_to">:</label>
                        <input type="text" id="charged_to" name="charged_to" class="form-input">
                    </div>
                    <div class="form-groups">
                    </div>
                    <div>
                        <label class="form-label" for="bank_ac_no">A/C No:</label>
                        <input type="text" id="bank_ac_no" name="bank_ac_no" class="form-input">
                        <label class="form-label" for="bank_ac_no">A/C No:</label>
                        <input type="text" id="bank_ac_no" name="bank_ac_no" class="form-input">
                    </div>
                </div>
                <div class="form-group">
                <div>
                        <label class="form-label" for="payed_by">Payed by (Cashier):</label>
                        <input type="text" id="payed_by" name="payed_by" class="form-input">
                    </div>
                    <div>
                        <label class="form-label" for="received_by">Received by (Full Names):</label>
                        <input type="text" id="received_by" name="received_by" class="form-input">
                    </div>
                    <div>
                        <label class="form-label" for="received_by">Signature:</label>
                        <input type="text" id="signature" name="signature" class="form-input">
                    </div>
                </div>
                <div class="form-group">
                    <div>
                       <label class="form-label" for="date">Date:</label>
                       <input type="date" id="date" name="date" class="form-input">
                    </div>
                    <div class="form-groups">
                    </div>
                    <div class="form-groups">
                    </div>
                </div>
                <div class="form-group">
                    <div>
                        <label class="form-label" for="received_by">Signature:</label>
                        <input type="text" id="signature" name="signature" class="form-input">
                        <label class="form-label" for="voucher_no">VOUCHER NO.:</label>
                        <input type="text" id="voucher_no" name="voucher_no" class="form-input">
                    </div>
                    <div class="form-groups">
                    </div>
                    <div class="form-groups">
                        <label class="form-label" for="received_by">Bank A/C No.:</label>
                        <input type="text" id="signature" name="signature" class="form-input">
                        <label class="form-label" for="bank_name">Bank Name:</label>
                        <input type="text" id="bank_name" name="bank_name" class="form-input">
                    </div>
                </div>      
                </div>
            </form>
        </div>
    </body>
    </html>
    <?php
}

// Call the function to display the form
displayForm();
?>

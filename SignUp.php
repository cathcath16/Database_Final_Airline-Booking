<?php
// Get form data from POST request
$firstname = $_POST["first_name"] ?? '';
$lastname = $_POST["last_name"] ?? '';
$Phone_No = $_POST["phone_no"] ?? '';
$username = $_POST["username"] ?? '';  // Fixed variable name
$password = $_POST["password"] ?? '';
$email_id = $_POST["email_id"] ?? '';

// Validate inputs (optional but recommended)
if (empty($firstname) || empty($lastname) || empty($username) || empty($password) || empty($email_id) || empty($Phone_No)) {
    echo "<p style='color: red;'>All fields are required.</p>";
    exit;
}

// Hash the password for security
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Database connection
$conn = mysqli_connect("localhost", "root", "", "Ticket_Booking");

if (!$conn) {
    die("Connection Failed: " . mysqli_connect_error());
}

// Prepare the SQL query (excluding U_id if it's auto-incremented)
$stmt = $conn->prepare("INSERT INTO Users (first_name, last_name, phone_no, username, password, email_id) 
                        VALUES (?, ?, ?, ?, ?, ?)");
if (!$stmt) {
    die("Statement preparation failed: " . $conn->error);
}

// Bind parameters
$stmt->bind_param("ssssss", $firstname, $lastname, $Phone_No, $username, $hashed_password, $email_id);

// Execute the query
if ($stmt->execute()) {
    echo "<p style='color: green;'>SIGN UP SUCCESSFUL.</p>";
} else {
    echo "<p style='color: red;'>ERROR: " . $stmt->error . "</p>";
}

// Close the statement and connection
$stmt->close();
$conn->close();
?>



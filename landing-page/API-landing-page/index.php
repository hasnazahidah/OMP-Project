<?php
// index.php

// API endpoint
$api_url = 'http://localhost/omp-3.3/index.php/OMP/api/v1/_submissions';

// Authentication token
$token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjFjZDE2YjU5MmE0YzIyNWYyYWRiMzNjZTVlMmJmNzI5MGM4NDg1NmUi.rKcfYjyUaSaM8fASSvpM95pDRvI5QVPTAikpeV9drEs';

// Set up headers with the token using cURL
$ch = curl_init($api_url);
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Authorization: Bearer ' . $token]);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Execute cURL session
$response = curl_exec($ch);

// Close cURL session
curl_close($ch);

// Include the HTML template
include 'header.php';

// Check if the request was successful
if (!$response) {
    echo 'Error accessing the API.';
} else {
    // Decode the JSON response
    $data = json_decode($response, true);

    // Display the book details
    if (isset($data['items']) && is_array($data['items'])) {
        include 'book.php'; // Include a separate file for the book list
    } else {
        echo '<p>No books found.</p>';
    }
}

// Include the HTML footer
include 'footer.php';
?>
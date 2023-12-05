<!DOCTYPE html>
<html>

<head>
    <title>Data dari Database</title>
</head>

<body>

    <h2>Data dari Database</h2>

    <?php
    // Replace the database credentials with your own
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "omp314";

    // Create a connection to the database
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check if the connection was successful
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Execute the SQL query to retrieve the setting_value
    $sql = "SELECT * FROM `new_releases`";
    $result = $conn->query($sql);

    // Check if any rows were returned
    if ($result->num_rows > 0) {
        // Output the data
        while ($row = $result->fetch_assoc()) {
            echo "abstract: " . $row["setting_value"] . "<br>";
        }
    } else {
        echo "No results found.";
    }

    // Close the database connection
    $conn->close();

    ?>

</body>

</html>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Semangat ea, pasti bisa !</title>
</head>

<body>
  <h1>OMP Book List</h1>

  <?php
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "omp3";

  $conn = new mysqli($servername, $username, $password, $dbname);

  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }

  // Mengambil dan menampilkan data buku 
  $sql = "SELECT * FROM files";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      echo "<p>file ID: " . $row["file_id"] . "</p>";
      echo "<p>path: " . $row["path"] . "</p>";
      echo "<p>mimetype: " . $row["mimetype"] . "</p>";
      // echo "<p>Genre: " . $row["genre_id"] . "</p>"; 
      // echo "<p>file: " . $row["file_id"] . "</p>"; 
      // ... tambahkan atribut lain sesuai kebutuhan 
      echo "<hr />";
    }
  } else {
    echo "<p>No books found.</p>";
  }
  $conn->close();
  ?>
</body>

</html>
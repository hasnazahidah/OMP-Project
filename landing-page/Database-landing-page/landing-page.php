<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Book Release</title>

</head>

<body>

    <!-- Header -->
    <header>
        <h1>New Book Release</h1>
    </header>

    <!-- Content -->
    <div id="content">
        <?php
        // Koneksi ke database
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "omp314";
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Memeriksa koneksi
        if ($conn->connect_error) {
            die("Koneksi gagal: " . $conn->connect_error);
        }

        // Query untuk mengambil data title dan abstract
        $query_title_abstract = "SELECT * FROM publication_settings WHERE setting_name IN ('title', 'abstract');";
        $result_title_abstract = $conn->query($query_title_abstract);

        // Menampilkan hasil title dan abstract
        echo "<h2>Data Title dan Abstract:</h2>";
        while ($row = $result_title_abstract->fetch_assoc()) {
            echo "<p><strong>{$row['setting_name']}:</strong> {$row['setting_value']}</p>";
        }

        // Query untuk mengambil data category
        $query_category = "SELECT * FROM category_settings WHERE setting_name IN ('title');";
        $result_category = $conn->query($query_category);

        // Menampilkan hasil category
        echo "<h2>List Data Category:</h2>";
        while ($row = $result_category->fetch_assoc()) {
            echo "<p> {$row['setting_value']}</p>";
        }

        // Query untuk mengambil data publication date
        $query_publication_date = "SELECT * FROM publications WHERE date_published";
        $result_publication_date = $conn->query($query_publication_date);

        // Menampilkan hasil publication date
        echo "<h2>Data Publication Date:</h2>";
        while ($row = $result_publication_date->fetch_assoc()) {
            echo "<p>{$row['date_published']}</p>";
        }

        // Query untuk mengambil data announcement
        $query_announcement = "SELECT * FROM announcement_settings WHERE setting_name IN ('title', 'descriptionShort');";
        $result_announcement = $conn->query($query_announcement);

        // Menampilkan hasil announcement
        echo "<h2>Data Announcement:</h2>";
        while ($row = $result_announcement->fetch_assoc()) {
            echo "<p><strong>{$row['setting_name']}:</strong> {$row['setting_value']}</p>";
        }

        // Query untuk mengambil data series
        $query_series = "SELECT * FROM series_settings WHERE setting_name IN ('title');";
        $result_series = $conn->query($query_series);

        // Menampilkan hasil series
        echo "<h2>Data Series:</h2>";
        while ($row = $result_series->fetch_assoc()) {
            echo "<p> {$row['setting_value']}</p>";
        }

        // Query untuk mengambil data author
        $query_author = "SELECT * FROM author_settings WHERE setting_name IN ('givenName');";
        $result_author = $conn->query($query_author);

        // Menampilkan hasil author
        echo "<h2>Data Author:</h2>";
        while ($row = $result_author->fetch_assoc()) {
            echo "<p> {$row['setting_value']}</p>";
        }

        $conn->close();
        ?>
    </div>

    <!-- Footer -->
    <footer>
        <!-- Konten footer, seperti informasi hak cipta, dll. -->
    </footer>

</body>

</html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Display</title>
</head>

<body>

    <?php
    // API endpoint
    $api_url = 'http://localhost/ojs-3.4.0-3/index.php/ojs/api/v1/_submissions';

    // Authentication token
    $token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImYyN2U1YmY0MzBiNzcxY2U3ZjhmZTZiNWNhMjVjY2U4OTEyNWQ0MjMi.ggml56w5GNxVb1-xJ6Fi3CQ5a20dWIz4jd1BIdkiU5w';

    // Set up headers with the token
    $options = [
        'http' => [
            'header' => "Authorization: Bearer $token\r\n",
        ],
    ];

    $context = stream_context_create($options);

    // Make a GET request to the API with headers
    $response = file_get_contents($api_url, false, $context);

    // Check if the request was successful
    if ($response === false) {
        echo 'Error accessing the API.';
    } else {
        // Decode the JSON response
        $data = json_decode($response, true);

        // Check if the JSON decoding was successful
        if ($data === null) {
            echo 'Error decoding JSON.';
        } else {
            // Display the book titles and cover images
            echo '<h2>Books:</h2>';
            echo '<ul>';
            foreach ($data['items'] as $book) {
                $title = isset($book['publications'][0]['fullTitle']['en']) ? $book['publications'][0]['fullTitle']['en'] : 'Untitled';
                // $tanggal = isset($book['publications'][0]['datePublished']) ? $book['publications'][0]['datePublished'] : 'Tanggal tidak ada';
                $coverData = isset($book['publications'][0]['coverImage']['en']['uploadName']) ? $book['publications'][0]['coverImage']['en']['uploadName'] : null;
                // Step 1: Initialize $coverData (example: as an array)
    
                var_dump($coverData);
                $tanggal = isset($book['publications'][0]['coverImage']['en']['dateUploaded']) ? $book['publications'][0]['coverImage']['en']['dateUploaded'] : null;

                if ($coverData && is_array($coverData) && isset($coverData['uploadName'])) {
                    // Memeriksa apakah $coverData ada, merupakan array, dan memiliki kunci 'uploadName'
    
                    $coverURL = $coverData['uploadName'];
                    // Jika pemeriksaan berhasil, mengambil nilai 'uploadName' dari $coverData
    
                    echo '<li><img src="' . htmlspecialchars($coverURL) . '" alt="Cover Image"></li>';
                    // Menampilkan tag <li> yang berisi tag <img> dengan atribut src sesuai dengan 'uploadName'
                } else {
                    // Jika pemeriksaan gagal, menampilkan pesan bahwa cover tidak valid
                    echo '<li>Cover tidak valid';

                    // Menambah pesan kesalahan yang lebih rinci
                    if (!$coverData) {
                        echo ': $coverData tidak ada';
                    } elseif (!is_array($coverData)) {
                        echo ': $coverData bukan array';
                    } elseif (!isset($coverData['uploadName'])) {
                        echo ': Kunci "uploadName" tidak ada dalam $coverData';
                    }

                    echo '</li>';
                }


                echo '<li>' . htmlspecialchars($title) . '</li>';
                echo '<li>' . htmlspecialchars($tanggal) . '</li>';
                echo '<li>' . htmlspecialchars($coverData) . '</li>';


                // // Tampilkan gambar menggunakan tag <img>
                // echo '<li><img src="' . htmlspecialchars($cover) . '" alt="Cover Image"></li>';
    
                // echo '<br> </br>';
            }

            echo '</ul>';
        }
    }
    ?>
</body>

</html>
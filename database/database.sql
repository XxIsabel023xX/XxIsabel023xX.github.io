<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database_name";

// Maak verbinding met de database
$conn = new mysqli($servername, $username, $password, $dbname);

// Controleer de verbinding
if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}

// Haal de zoekterm op
$search = $_POST['search'];

// Zoek in de database
$sql = "SELECT firstName, lastName, birthYear, city, note FROM persons WHERE firstName LIKE '%$search%' OR lastName LIKE '%$search%'";
$result = $conn->query($sql);

$persons = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $persons[] = $row;
    }
}

$conn->close();

// Stuur de resultaten terug als JSON
echo json_encode($persons);
?>

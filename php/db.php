<!-- Connexion du serveur à la base de données (Docker MySQL) -->

<?php 
$host = 'db';
$dbname = 'minibank';
$user = 'root';
$password = 'root';

$conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);

?>
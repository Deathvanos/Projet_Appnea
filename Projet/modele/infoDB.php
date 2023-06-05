<?php

    function connectionToDB() {
        $servername = "91.121.230.45";
        $username = "pftxpg_appneawe_db";
        $password = "%PMZ0U7w1px-t3_!";
        $dbname = "pftxpg_appneawe_db";

        try {
            $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conn;
        }
        catch (PDOException $e) {
            errorPage();
        }
    }


?>

<?php

require_once 'Philip-database.php';


try{

    $sQuery = $db->prepare('UPDATE users
                            SET name = "aa"
                            WHERE name = "ccccc"');
    $sQuery->execute();
    // $aUsers = $sQuery->fetchAll();
    // echo json_encode($aUsers);
    echo 'done';

}catch(PDOException $ex){
    echo 'something went wrong';
}
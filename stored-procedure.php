<?php

require_once 'database.php';

// Testing and practicing procedures with phpMyAdmin

/*
try{


    $sQuery = $db->prepare('CALL getUsers()');
    $sQuery->execute();
    $aUsers = $sQuery->rowCount();
    echo json_encode($aUsers);


}catch(PDOException $ex){
    echo 'error....';
}
*/

// Here I create a routine/procedure where I get the number of users:

/*
try{

$sQuery = $db->prepare('CALL getNumberOfUsers()');
$sQuery->execute();
$aUsers = $sQuery->fetch(); // fetch gets 1 result. fetchAll gets all the results.
// echo json_encode($aUsers);
$iNumberOfUsers = $aUsers['numberOfUsers'];
// You have x users in the system
echo "You have $iNumberOfUsers users in the system";

}catch(PDOException $ex){
echo 'error....';
}
*/


// Below I create a routine/procedure that gets an email and returns the whole user

try{

    $_GET['email'] = 'aa@aa.com';
    $sQuery = $db->prepare('CALL getUserFromEmail(:email)'); // :email is a placeholder
    $sQuery->bindValue(':email',  $_GET['email']);
    $sQuery->execute();
    $aUser = $sQuery->fetchAll(); // fetch gets 1 result. fetchAll gets all the results.
    if( count($aUser) ){
      echo json_encode($aUser);  
    }else{
        echo 'user not found';
    }
    
}catch(PDOException $ex){
echo 'error....';
}



CREATE VIEW alldata AS
SELECT * FROM products
INNER JOIN colors ON products.id = colors.products_fk
INNER JOIN sizes ON products.id = sizes.products_fk
ORDER BY products.name
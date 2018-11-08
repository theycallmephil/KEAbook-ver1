<?php

// CHECK THAT THE USER IS LOGGED


// TODO: Validate if the id of the post is a valid id
// filter validate int

// $_GET['postId'] = 2;
session_start();

require_once '../database.php';
try{

  $sQuery = $db->prepare('DELETE 
                          FROM posts 
                          WHERE id = :iPostId
                          AND user_id = :iUserId');
  $sQuery->bindValue(':iPostId', $_GET['postId']);
  $sQuery->bindValue(':iUserId', $_SESSION['jUser']['id']);
  $sQuery->execute();
  if( !$sQuery->rowCount() ){
    echo '{"status":0, "message":"could not delete post"}';
    exit;
  }
  echo '{"status":1, "message":"post deleted"}';

}catch(PDOException $ex){
  echo '{"status":0, "message":"exception"}';
}
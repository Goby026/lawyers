<?php
class Database
{
    public static function StartUp()
    {
//        **************local**************
       $pdo = new PDO('mysql:host=localhost;dbname=systemcase;charset=utf8', 'root', '');

//        **************servidor**************
         $pdo = new PDO('mysql:host=localhost;dbname=systemcase;charset=utf8', 'frank19', '784SzAUn6X5cjY2');
        
//        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    }
}
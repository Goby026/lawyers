<?php
class Database
{
    public static function StartUp()
    {
//        **************local**************
       $pdo = new PDO('mysql:host=localhost;dbname=lawyers;charset=utf8', 'root', '');

//        **************servidor**************
        // $pdo = new PDO('mysql:host=localhost;dbname=bdtecnoserv;charset=utf8', 'bdtecnoserv', '123456');
        
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);	
        return $pdo;
    }
}

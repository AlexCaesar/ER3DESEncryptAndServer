<?php 
include "Crypt3Des.php";
class Encrypt
{
    public static $key = "I love you.";

    public static function decode($string){
        $crypt = new Crypt3Des(Encrypt::$key);
        $decryptStr = $crypt->decrypt($string);
        return $decryptStr;
    }

    public static function encode($string){
        $crypt = new Crypt3Des(Encrypt::$key);
        $encryptStr = $crypt->encrypt($string);
        return $encryptStr;
    }

}

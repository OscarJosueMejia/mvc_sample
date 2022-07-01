<?php 
/**
 * @author: Oscar Mejia
 */

namespace Dao\Mnt;
use Dao\Table;

class Funciones extends Table {

    public static function getAll(){
        $sqlstr = "select * from funciones;";  
        return self::obtenerRegistros($sqlstr, array());
    }

    public static function getById($fncod){
        $sqlstr = "SELECT * from `funciones` where fncod=:fncod;";
        $sqlParams = array("fncod" => $fncod);
        
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }

    public static function insert($fndsc,$fnest,$fntyp,){
        $sqlstr = "INSERT INTO `funciones` (`fndsc`,`fnest`,`fntyp`)
        VALUES(:fndsc,:fnest,:fntyp);";
        
        $sqlParams =[
        "fndsc" => $fndsc,
        "fnest" => $fnest,
        "fntyp" => $fntyp,
        ];

        return self::executeNonQuery($sqlstr, $sqlParams);
    }


    public static function update($fndsc,$fnest,$fntyp,$fncod){

        $sqlstr = "UPDATE `funciones` SET
        `fndsc` = :fndsc, `fnest` = :fnest, `fntyp` = :fntyp
        where `fncod`=:fncod;";

        $sqlParams =[
        "fndsc" => $fndsc,
        "fnest" => $fnest,
        "fntyp" => $fntyp,
        "fncod" => $fncod
        ];

        return self::executeNonQuery($sqlstr, $sqlParams);
    }


    public static function delete($fncod){
        $sqlstr = "DELETE from `funciones` where fncod=:fncod;";

        $sqlParams = [
        "fncod" => $fncod
        ];

        return self::executeNonQuery($sqlstr, $sqlParams);
        }
}
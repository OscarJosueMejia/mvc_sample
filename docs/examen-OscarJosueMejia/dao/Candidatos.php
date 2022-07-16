<?php 
/**
 * PHP Version 7.2
 * Mnt
 *
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @student  Oscar Josué Mejía Serén
 */

namespace Dao\Mnt;
use Dao\Table;

class Candidatos extends Table {

    public static function getAll()
    {
        $sqlstr = "select * from `candidato`;";  
        return self::obtenerRegistros($sqlstr, array());
    }


    public static function getById($id_candidato)
    {
        $sqlstr = "SELECT * from `candidato` where id_candidato=:id_candidato;";
        $sqlParams = array("id_candidato" => $id_candidato);
        
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }


    public static function insert(
        $identidad,
			$nombre,
			$edad,
			
    ){
        $sqlstr = "INSERT INTO `candidato` (
            `identidad`,
			`nombre`,
			`edad`)
        VALUES(
            :identidad,
			:nombre,
			:edad);";
        
        $sqlParams =[
            "identidad" => $identidad,
			"nombre" => $nombre,
			"edad" => $edad,
			
        ];

        return self::executeNonQuery($sqlstr, $sqlParams);
    }


    public static function update(
        $identidad,
			$nombre,
			$edad,
			
        $id_candidato 
    ){

        $sqlstr = "UPDATE `candidato` SET

        `identidad` = :identidad, `nombre` = :nombre, `edad` = :edad

        where `id_candidato`=:id_candidato;";


        $sqlParams =[
            "identidad" => $identidad,
			"nombre" => $nombre,
			"edad" => $edad,
			
            "id_candidato" => $id_candidato
        ];

        return self::executeNonQuery($sqlstr, $sqlParams);
    }


    public static function delete($id_candidato){
        $sqlstr = "DELETE from `candidato` where id_candidato=:id_candidato;";

        $sqlParams = [
        "id_candidato" => $id_candidato
        ];
        
        try {
        return self::executeNonQuery($sqlstr, $sqlParams);
        } catch (\Throwable $th) {
            echo "<h2>ERROR: No se puede eliminar este registro.</h2>"."\n"."$th";
            die;
        }
    }
}?>
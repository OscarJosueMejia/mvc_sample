<?php
/**
 * PHP Version 7
 * Modelo de Datos para tabla 'Pianos'
 *
 * @category Data_Model
 * @package  Models${1:modelo}
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @student  Oscar Josué Mejía Serén
 * @license  Comercial http://
 *
 *
 * @link http://url.com
 */

namespace Dao\Mnt;
use Dao\Table;


class Pianos extends Table
{
    /**
     * Obtiene todos los registros de Pianos
     *
     * @return array
     */
    public static function getAll()
    {
        $sqlstr = "Select * from pianos;";
        return self::obtenerRegistros($sqlstr, array());
    }
    /**
     * Get Piano By Id
     *
     * @param int $pianoid ID del Piano
     *
     * @return array
     */
    public static function getById(int $pianoid)
    {
        $sqlstr = "SELECT * from `pianos` where pianoid=:pianoid;";
        $sqlParams = array("pianoid" => $pianoid);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }

    /**
     * Inserts in 'pianos'
     */
    public static function insert(
        $pianodsc,
        $pianobio,
        $pianosales,
        $pianoimguri,
        $pianoimgthb,
        $pianoprice,
        $pianoest
    ) {

        $sqlstr = "INSERT INTO `pianos`
        (`pianodsc`, `pianobio`,
        `pianosales`, `pianoimguri`, `pianoimgthb`,
        `pianoprice`, `pianoest`)
        VALUES
        (:pianodsc, :pianobio,
        :pianosales, :pianoimguri, :pianoimgthb,
        :pianoprice, :pianoest);";

        $sqlParams = [
            "pianodsc" => $pianodsc,
            "pianobio" => $pianobio,
            "pianosales" => $pianosales,
            "pianoimguri" => $pianoimguri,
            "pianoimgthb" => $pianoimgthb,
            "pianoprice" => $pianoprice,
            "pianoest" => $pianoest
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    /**
     * Updates 'pianos'
     */

    public static function update(
        $pianodsc,
        $pianobio,
        $pianosales,
        $pianoimguri,
        $pianoimgthb,
        $pianoprice,
        $pianoest,
        $pianoid
    ) {

        $sqlstr = "UPDATE `pianos` SET
        `pianodsc`=:pianodsc, `pianobio`=:pianobio,
        `pianosales`=:pianosales, `pianoimguri`=:pianoimguri, `pianoimgthb`=:pianoimgthb,
        `pianoprice`=:pianoprice, `pianoest`=:pianoest
        where `pianoid`=:pianoid;";

        $sqlParams = [
            "pianodsc" => $pianodsc,
            "pianobio" => $pianobio,
            "pianosales" => $pianosales,
            "pianoimguri" => $pianoimguri,
            "pianoimgthb" => $pianoimgthb,
            "pianoprice" => $pianoprice,
            "pianoest" => $pianoest,
            "pianoid" => $pianoid
        ];
        
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    /**
     * Deletes 'pianos'
     */
    public static function delete($pianoid){
        $sqlstr = "DELETE from `pianos` where pianoid=:pianoid;";

        $sqlParams = [
            "pianoid" => $pianoid
        ];

        return self::executeNonQuery($sqlstr, $sqlParams);
    }
}
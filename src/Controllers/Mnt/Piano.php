<?php
/**
 * PHP Version 7.2
 * Mnt
 *
 * @category Controller
 * @package  Controllers\Mnt
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @student  Oscar Josué Mejía Serén
 * @license  Comercial http://
 * @version  CVS:1.0.0
 * @link     http://url.com
 */
 namespace Controllers\Mnt;

// ---------------------------------------------------------------
// Sección de imports
// ---------------------------------------------------------------
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Validators;
use Dao\Mnt\Pianos;

/**
 * Piano
 *
 * @category Public
 * @package  Controllers\Mnt;
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Piano extends PublicController
{
    private $viewData = array();
    private $arrModeDesc = array();
    private $arrEstados = array();

    /**
     * Runs the controller
     *
     * @return void
     */
    public function run():void
    {
        // code
        $this->init();
        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        if ($this->isPostBack()) {
            $this->procesarPost();
        }

        $this->processView();
        Renderer::render('mnt/piano', $this->viewData);
    }

    private function init()
    {
        $this->viewData = array();
        $this->viewData["mode"] = "";
        $this->viewData["mode_desc"] = "";
        $this->viewData["crsf_token"] = "";

        $this->viewData["pianoid"] = "";
        $this->viewData["pianodsc"] = "";
        $this->viewData["error_pianodsc"] = array();
        $this->viewData["pianobio"] = "";
        $this->viewData["error_pianobio"] = array();
        $this->viewData["pianosales"] = "";
        $this->viewData["error_pianosales"] = array();
        $this->viewData["pianoimguri"] = "";
        $this->viewData["pianoimgthb"] = "";
        $this->viewData["pianoprice"] = "";
        $this->viewData["error_pianoprice"] = array();
        $this->viewData["pianoest"] = "";
        $this->viewData["pianoestArr"] = array();

        $this->viewData["btnEnviarText"] = "Guardar";
        $this->viewData["readonly"] = false;
        $this->viewData["showBtn"] = true;

        $this->arrModeDesc = array(
            "INS"=>"Nuevo Piano",
            "UPD"=>"Editando %s %s",
            "DSP"=>"Detalle de %s %s",
            "DEL"=>"Eliminando %s %s"
        );

        $this->arrEstados = array(
            array("value" => "ACT", "text" => "Activo"),
            array("value" => "INA", "text" => "Inactivo"),
        );

        $this->viewData["pianoestArr"] = $this->arrEstados;
    }


    private function procesarGet()
    {
        if (isset($_GET["mode"])) {
            $this->viewData["mode"] = $_GET["mode"];
            if (!isset($this->arrModeDesc[$this->viewData["mode"]])) {
                error_log('Error: (Piano) El modo solicitado no existe.');
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=mnt_pianos",
                    "No se puede procesar su solicitud!"
                );
            }
        }
        if ($this->viewData["mode"] !== "INS" && isset($_GET["id"])) {
            $this->viewData["pianoid"] = intval($_GET["id"]);
            $tmpPiano = Pianos::getById($this->viewData["pianoid"]);
            error_log(json_encode($tmpPiano));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpPiano, $this->viewData);
        }
    }


    private function procesarPost()
    {
        $hasErrors = false;
        \Utilities\ArrUtils::mergeArrayTo($_POST, $this->viewData);
        if (isset($_SESSION[$this->name . "crsf_token"])
            && $_SESSION[$this->name . "crsf_token"] !== $this->viewData["crsf_token"]
        ) {
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt_pianos",
                "ERROR: Algo inesperado sucedió con la petición. Intente de nuevo."
            );
        }
        
        // Validation Zone
        if (Validators::IsEmpty($this->viewData["pianodsc"])) {
            $this->viewData["error_pianodsc"][]
                = "Ingrese la Descripción del Piano";
            $hasErrors = true;
        }
        if (Validators::IsEmpty($this->viewData["pianobio"])) {
            $this->viewData["error_pianobio"][]
                = "Ingrese la Biografía del Piano";
            $hasErrors = true;
        }
        if (Validators::IsEmpty($this->viewData["pianosales"])) {
            $this->viewData["error_pianosales"][]
                = "La cantidad de ventas es requerida.";
            $hasErrors = true;
        }
        if (Validators::IsEmpty($this->viewData["pianoprice"])) {
            $this->viewData["error_pianoprice"][]
                = "El precio de venta es requerido.";
            $hasErrors = true;
        }


        if (!$hasErrors) {
            $result = null;
            switch($this->viewData["mode"]) {
            case 'INS':
                $result = Pianos::insert(
                    $this->viewData["pianodsc"],
                    $this->viewData["pianobio"],
                    $this->viewData["pianosales"],
                    $this->viewData["pianoimguri"],
                    $this->viewData["pianoimgthb"],
                    $this->viewData["pianoprice"],
                    $this->viewData["pianoest"],
                );

                if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=mnt_pianos",
                            "Piano Guardado Satisfactoriamente!"
                        );
                }
                break;

            case 'UPD':
                $result = Pianos::update(
                    $this->viewData["pianodsc"],
                    $this->viewData["pianobio"],
                    $this->viewData["pianosales"],
                    $this->viewData["pianoimguri"],
                    $this->viewData["pianoimgthb"],
                    $this->viewData["pianoprice"],
                    $this->viewData["pianoest"],
                    intval($this->viewData["pianoid"])
                );
                if ($result) {
                    \Utilities\Site::redirectToWithMsg(
                        "index.php?page=mnt_pianos",
                        "Piano Actualizado Satisfactoriamente"
                    );
                }
                break;

            case 'DEL':
                $result = Pianos::delete(
                    intval($this->viewData["pianoid"])
                );
                if ($result) {
                    \Utilities\Site::redirectToWithMsg(
                        "index.php?page=mnt_pianos",
                        "Piano Eliminado Satisfactoriamente"
                    );
                }
                break;
            }
        }
    }

    private function processView()
    {
        if ($this->viewData["mode"] === "INS") {
            $this->viewData["mode_desc"]  = $this->arrModeDesc["INS"];
            $this->viewData["btnEnviarText"] = "Guardar Nuevo";
        } else {
            $this->viewData["mode_desc"]  = sprintf(
                $this->arrModeDesc[$this->viewData["mode"]],
                $this->viewData["pianoid"],
                $this->viewData["pianodsc"]
            );

            $this->viewData["pianoestArr"]
                = \Utilities\ArrUtils::objectArrToOptionsArray(
                    $this->arrEstados,
                    'value',
                    'text',
                    'value',
                    $this->viewData["pianoest"]
            );

            if ($this->viewData["mode"] === "DSP") {
                $this->viewData["readonly"] = true;
                $this->viewData["showBtn"] = false;
            }
            if ($this->viewData["mode"] === "DEL") {
                $this->viewData["readonly"] = true;
                $this->viewData["btnEnviarText"] = "Eliminar";
            }
            if ($this->viewData["mode"] === "UPD") {
                $this->viewData["btnEnviarText"] = "Actualizar";
            }
        }
        $this->viewData["crsf_token"] = md5(getdate()[0] . $this->name);
        $_SESSION[$this->name . "crsf_token"] = $this->viewData["crsf_token"];
    }
}
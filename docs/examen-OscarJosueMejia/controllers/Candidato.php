<?php 
/**
 * PHP Version 7.2
 * Mnt
 *
 * @category Controller
 * @package  Controllers\Mnt
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @student  Oscar Josué Mejía Serén
 */

namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;
use Utilities\Validators;
use Dao\Mnt\Candidatos;


class Candidato extends PublicController{

    private $viewData = array();
    private $arrModeDesc = array();

 
    public function run():void
    {
        $this->init();

        if (!$this->isPostBack()) {
            $this->procesarGet();
        }
        
        if ($this->isPostBack()) {
            $this->procesarPost();
        }

    $this->processView();
    Renderer::render("mnt/candidato", $this->viewData);
}
    private function init(){
        $this->viewData = array();
        $this->viewData["mode"] = "";
        $this->viewData["mode_desc"] = "";
        $this->viewData["crsf_token"] = "";

        //Var set guided by Table Info
		$this->viewData["id_candidato"] = "";
			$this->viewData["identidad"] = "";
			$this->viewData["error_identidad"] = array();
			$this->viewData["nombre"] = "";
			$this->viewData["error_nombre"] = array();
			$this->viewData["edad"] = "";
			$this->viewData["error_edad"] = array();
	       
        // ------
        
        $this->viewData["btnEnviarText"] = "Guardar";
        $this->viewData["readonly"] = false;
        $this->viewData["showBtn"] = true;

        $this->arrModeDesc = array(
            "INS"=>"Nuevo Candidato",
            "UPD"=>"Editando %s %s",
            "DSP"=>"Detalle de %s %s",
            "DEL"=>"Eliminando %s %s"
        );

        

    }
    
    private function procesarGet(){
        if (isset($_GET["mode"])) {
            $this->viewData["mode"] = $_GET["mode"];
            if (!isset($this->arrModeDesc[$this->viewData["mode"]])) {
                error_log("Error: El modo solicitado no existe.");
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=mnt_candidatos",
                    "No se puede procesar su solicitud!"
                );
            }
        }
        if ($this->viewData["mode"] !== "INS" && isset($_GET["id"])) {
            $this->viewData["id_candidato"] = intval($_GET["id"]);
            $tmpArray = Candidatos::getById($this->viewData["id_candidato"]);
            \Utilities\ArrUtils::mergeFullArrayTo($tmpArray, $this->viewData);
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
                "index.php?page=mnt_candidatos",
                "ERROR: Algo inesperado sucedió con la petición. Intente de nuevo."
            );
        }

        if (Validators::IsEmpty($this->viewData["identidad"])) {
            $this->viewData["error_identidad"][]
                = "Este campo es requerido.";
            $hasErrors = true;
        }  

        if (Validators::IsEmpty($this->viewData["nombre"])) {
            $this->viewData["error_nombre"][]
                = "Este campo es requerido.";
            $hasErrors = true;
        }  
        
        if (Validators::IsEmpty($this->viewData["edad"])) {
            $this->viewData["error_edad"][]
                = "Este campo es requerido.";
            $hasErrors = true;
        }  
        
        if (!$hasErrors) {
            $result = null;

            switch($this->viewData["mode"]) {
            case "INS":
                $result = Candidatos::insert(
                    $this->viewData["identidad"],
						$this->viewData["nombre"],
						$this->viewData["edad"],
						
                );

                if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=mnt_candidatos",
                            "Candidato Guardado Satisfactoriamente!"
                        );
                }
                break;

            case "UPD":
                $result = Candidatos::update(
                    $this->viewData["identidad"],
						$this->viewData["nombre"],
						$this->viewData["edad"],
						
                    intval($this->viewData["id_candidato"])
                );

                if ($result) {
                    \Utilities\Site::redirectToWithMsg(
                        "index.php?page=mnt_candidatos",
                        "Candidato Actualizado Satisfactoriamente!"
                    );
                }
                break;

            case "DEL":
                $result = Candidatos::delete(
                    intval($this->viewData["id_candidato"])
                );

                if ($result) {
                    \Utilities\Site::redirectToWithMsg(
                        "index.php?page=mnt_candidatos",
                        "Candidato Eliminado Satisfactoriamente!"
                    );
                }
                break;
            }
        }
    }
    private function processView(){
        
        if ($this->viewData["mode"] === "INS") {
            $this->viewData["mode_desc"]  = $this->arrModeDesc["INS"];
            $this->viewData["btnEnviarText"] = "Guardar Nuevo";
        } else {
            $this->viewData["mode_desc"]  = sprintf(
                $this->arrModeDesc[$this->viewData["mode"]],
                $this->viewData["id_candidato"],
                $this->viewData["nombre"],
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
}?>
<?php
namespace Controllers\NW202202;

use Controllers\PublicController;
use Views\Renderer;

class FirstForm extends PublicController {
    public function run(): void
    {
        $viewData = array();
        $viewData["txtNombre"] = "Fulanito";
        $viewData["txtApellido"] = "De Tal";

        /*  */
        
        if (isset($_POST["btnEnviar"])) {
            $viewData["txtNombre"] = $_POST["txtNombre"];
        }
        
        if ($this->isPostBack()) {
            $viewData["txtApellido"] = $_POST["txtApellido"];
        }

        Renderer::render('nw202202/FirstForm', $viewData);
        // die("It works!");
    }
}
?>
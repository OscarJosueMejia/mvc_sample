<?php 
namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Mnt\Funciones as DaoFunciones;
use Views\Renderer;

class Funciones extends PublicController
{
    public function run():void
    {
        $viewData = array();
        $viewData["Funciones"] = DaoFunciones::getAll();
        
        Renderer::render("mnt/funciones", $viewData);
    }
}

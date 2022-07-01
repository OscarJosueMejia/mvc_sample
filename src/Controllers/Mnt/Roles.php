<?php 
/**
 * @author: Oscar Mejia
 */

namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Mnt\Roles as DaoRoles;
use Views\Renderer;

class Roles extends PublicController
{
    public function run():void
    {
        $viewData = array();
        $viewData["Roles"] = DaoRoles::getAll();
        
        Renderer::render("mnt/roles", $viewData);
    }
}

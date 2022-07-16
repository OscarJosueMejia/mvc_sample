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
use Dao\Mnt\Candidatos as DaoCandidatos;
use Views\Renderer;

class Candidatos extends PublicController
{
    public function run():void
    {
        $viewData = array();
        $viewData["Candidatos"] = DaoCandidatos::getAll();
        
        Renderer::render("mnt/candidatos", $viewData);
    }
}
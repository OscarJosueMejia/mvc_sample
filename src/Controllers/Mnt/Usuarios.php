<?php
      /**
       * PHP Version 7.2
       * Mnt
       *
       * @category Controller
       * @package  Controllers\Mnt
       * @author   
       * @license  Comercial http://
       * @version  CVS:1.0.0
       * @link     http://url.com
       */
       namespace Controllers\Mnt;
      
      // ---------------------------------------------------------------
      // Sección de imports
      // ---------------------------------------------------------------
      use Controllers\PublicController;
      use Dao\Security\Security as DaoSecurity;
      use Views\Renderer;
      
      /**
       * Usuarios
       *
       * @category Public
       * @package  Controllers\Mnt;
       * @author   
       * @license  MIT http://
       * @link     http://
       */
      class Usuarios extends PublicController
      {
          /**
           * Runs the controller
           *
           * @return void
           */
          public function run():void
          {
              // code
              $viewData = array();
              $viewData["Usuarios"] = DaoSecurity::getUsuarios();
              error_log(json_encode($viewData));
            
              Renderer::render("mnt/Usuarios", $viewData);
          }
      }
      
      ?>
      
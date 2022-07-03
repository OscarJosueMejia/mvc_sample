<h1 class="center">{{mode_desc}}</h1>
<section>
  <form action="index.php?page=mnt_Usuario" method="post" class="row offset-3 col-6"
    style="background-color:#F4F4F4; border-radius:1rem; padding:1rem; font-size:1.1rem">
    <input type="hidden" name="mode" value="{{mode}}" />
    <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
    <input type="hidden" name="usercod" value="{{usercod}}" />

    <fieldset class="row" style="border-color:transparent;">
      <label class="col-4" for="useremail">Email</label>
      <input class="col-8" {{if readonly}} readonly {{endif readonly}} {{if readonlyEmail}} readonly {{endif readonlyEmail}} type="text" id="useremail" name="useremail"
        placeholder="Email" value="{{useremail}}" style="border-radius: 0.4rem; border:none;" />
      {{if error_useremail}}
      {{foreach error_useremail}}
      <div class="error">{{this}}</div>
      {{endfor error_useremail}}
      {{endif error_useremail}}
    </fieldset>

    <fieldset class="row" style="border-color:transparent;">
      <label class="col-4" for="username">Nombre Usuario</label>
      <input class="col-8" {{if readonly}} readonly {{endif readonly}} type="text" id="username" name="username"
        placeholder="Nombre de Usuario" value="{{username}}" style="border-radius: 0.4rem; border:none;" />
      {{if error_username}}
      {{foreach error_username}}
      <div class="error">{{this}}</div>
      {{endfor error_username}}
      {{endif error_username}}
    </fieldset>

    <fieldset class="row" style="border-color:transparent;">
      <label class="col-4" for="userpswd">Contraseña</label>
      <input class="col-8" {{if readonly}} readonly {{endif readonly}} type="text" id="userpswd" name="userpswd"
        placeholder="Contraseña" style="border-radius: 0.4rem; border:none;" />
      {{if error_userpswd}}
      {{foreach error_userpswd}}
      <div class="error">{{this}}</div>
      {{endfor error_userpswd}}
      {{endif error_userpswd}}
    </fieldset>

    <fieldset class="row" style="border-color:transparent;">
      <label class="col-4" for="userest">Estado</label>
      <select class="col-8" name="userest" id="userest" {{if readonly}} readonly disabled {{endif readonly}}
        style="border-radius: 0.4rem; border:none;">
        {{foreach userestArr}}
        <option value="{{value}}" {{selected}}>{{text}}</option>
        {{endfor userestArr}}
      </select>
    </fieldset>


    <fieldset class="row" style="border-color:transparent;">
      <label class="col-4" for="usertipo">Tipo</label>
      <select class="col-8" name="usertipo" id="usertipo" {{if readonly}} readonly disabled {{endif readonly}}
        style="border-radius: 0.4rem; border:none;">
        {{foreach usertipoArr}}
        <option value="{{value}}" {{selected}}>{{text}}</option>
        {{endfor usertipoArr}}
      </select>
    </fieldset>



    <fieldset class="row flex-center" style="border: none;">
      {{if showBtn}}
      <button type="submit" name="btnEnviar"
        style="border-radius: 0.4rem; background-color:#ffce00; border-color:transparent; color:black;">{{btnEnviarText}}</button>
      &nbsp;
      {{endif showBtn}}
      <button name="btnCancelar" id="btnCancelar">Cancelar</button>
    </fieldset>
  </form>
</section>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("btnCancelar").addEventListener("click", function (e) {
      e.preventDefault(); e.stopPropagation();
      window.location.href = "index.php?page=mnt_Usuarios";
    });
  });
</script>
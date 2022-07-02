<h1 class="center">{{mode_desc}}</h1>
<section>
    <form action="index.php?page=mnt_rol" method="post" class="row offset-3 col-6"
        style="background-color:#F4F4F4; border-radius:1rem; padding:1rem; font-size:1.1rem">

        <input type="hidden" name="mode" value="{{mode}}" />
        <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
        <input type="hidden" name="rolescod" value="{{rolescod}}" />

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="rolescod">Código</label>
            <input class="col-8" type="text" id="rolescod" name="rolescod" placeholder="Código" value="{{rolescod}}"
                {{if readonly}} readonly {{endif readonly}} style="border-radius: 0.4rem; border:none;" />
            {{if error_rolescod}} {{foreach error_rolescod}} <div class="error">{{this}}</div>
            {{endfor error_rolescod}}
            {{endif error_rolescod}}
        </fieldset>

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="rolesdsc">Descripción del Rol</label>
            <input class="col-8" type="text" id="rolesdsc" name="rolesdsc" placeholder="Descripción"
                value="{{rolesdsc}}" {{if readonly}} readonly {{endif readonly}}
                style="border-radius: 0.4rem; border:none;" />

            {{if error_rolesdsc}} {{foreach error_rolesdsc}} <div class="error">{{this}}</div>
            {{endfor error_rolesdsc}}
            {{endif error_rolesdsc}}
        </fieldset>
        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="rolesest">Estado</label>
            <select class="col-8" name="rolesest" id="rolesest" {{if readonly}} readonly disabled {{endif readonly}}
                style="border-radius: 0.4rem; border:none;">
                {{foreach rolesestArr}}
                <option value="{{value}}" {{selected}}>{{text}}</option>
                {{endfor rolesestArr}}
            </select>
        </fieldset>


        <fieldset class="row flex-center" style="border: none;">
            {{if showBtn}}
            <button type="submit" name="btnEnviar"
                style="border-radius: 0.4rem; background-color:#ffce00; border-color:transparent; color:black;">{{btnEnviarText}}</button>
            &nbsp;
            {{endif showBtn}}
            <button name="btnCancelar" id="btnCancelar" style="border-radius: 0.4rem; border:none;">Cancelar</button>
        </fieldset>
    </form>
</section>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("btnCancelar").addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.href = "index.php?page=mnt_roles";
        });
    });
</script>
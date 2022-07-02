<h1 class="center">{{mode_desc}}</h1>
<section>
    <form action="index.php?page=mnt_funcion" method="post" class="row offset-3 col-6"
        style="background-color:#F4F4F4; border-radius:1rem; padding:1rem; font-size:1.1rem">

        <input type="hidden" name="mode" value="{{mode}}" />
        <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
        <input type="hidden" name="fncod" value="{{fncod}}" />

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="fncod">Código</label>
            <input class="col-8" type="text" id="fncod" name="fncod" placeholder="Código" value="{{fncod}}"
                {{if readonly}} readonly {{endif readonly}} style="border-radius: 0.4rem; border:none;" />
            {{if error_fncod}} {{foreach error_fncod}} <div class="error">{{this}}</div>
            {{endfor error_fncod}}
            {{endif error_fncod}}
        </fieldset>

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="fndsc">Descripción</label>
            <input class="col-8" type="text" id="fndsc" name="fndsc" placeholder="Descripción" value="{{fndsc}}"
                {{if readonly}} readonly {{endif readonly}} style="border-radius: 0.4rem; border:none;" />

            {{if error_fndsc}} {{foreach error_fndsc}} <div class="error">{{this}}</div>
            {{endfor error_fndsc}}
            {{endif error_fndsc}}
        </fieldset>

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="fntyp">Tipo</label>
            <select class="col-8" name="fntyp" id="fntyp" {{if readonly}} readonly disabled {{endif readonly}}
                style="border-radius: 0.4rem; border:none;">
                {{foreach fntypArr}}
                <option value="{{value}}" {{selected}}>{{text}}</option>
                {{endfor fntypArr}}
            </select>
        </fieldset>

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="fnest">Estado</label>
            <select class="col-8" name="fnest" id="fnest" {{if readonly}} readonly disabled {{endif readonly}}
                style="border-radius: 0.4rem; border:none;">
                {{foreach fnestArr}}
                <option value="{{value}}" {{selected}}>{{text}}</option>
                {{endfor fnestArr}}
            </select>
        </fieldset>

        <fieldset class=" row flex-center" style="border-color:transparent; margin-top:1rem">
            {{if showBtn}}
            <button type="submit" name="btnEnviar"
                style="border-radius: 0.4rem; background-color:#ffce00; border-color:transparent; color:black;">{{btnEnviarText}}</button>
            &nbsp;
            {{endif showBtn}}
            <button name="btnCancelar" id="btnCancelar" style="border-radius: 0.4rem;">Cancelar</button>
        </fieldset>
    </form>
</section>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("btnCancelar").addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.href = "index.php?page=mnt_funciones";
        });
    });
</script>
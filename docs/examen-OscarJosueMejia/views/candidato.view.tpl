<h1 class="center">{{mode_desc}}</h1>
<section>
    <form action="index.php?page=mnt_candidato" method="post" class="row offset-3 col-6"
        style="background-color:#F4F4F4; border-radius:1rem; padding:1rem; font-size:1.1rem">

        <input type="hidden" name="mode" value="{{mode}}" />
        <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
        <input type="hidden" name="id_candidato" value="{{id_candidato}}" />

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="identidad">Identidad</label>
            <input class="col-8" type="text" id="identidad" name="identidad" placeholder="1001200200094"
                value="{{identidad}}" {{if readonly}} readonly {{endif readonly}}
                style="border-radius: 0.4rem; border:none;" />

            {{if error_identidad}} {{foreach error_identidad}} <div class="error">{{this}}</div>
            {{endfor error_identidad}}
            {{endif error_identidad}}
        </fieldset>

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="nombre">Nombre</label>
            <input class="col-8" type="text" id="nombre" name="nombre" placeholder="Oscar Josue Mejia"
                value="{{nombre}}" {{if readonly}} readonly {{endif readonly}}
                style="border-radius: 0.4rem; border:none;" />

            {{if error_nombre}} {{foreach error_nombre}} <div class="error">{{this}}</div>
            {{endfor error_nombre}}
            {{endif error_nombre}}
        </fieldset>

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="edad">Edad</label>
            <input class="col-8" type="number" id="edad" name="edad" placeholder="20" value="{{edad}}" {{if readonly}}
                readonly {{endif readonly}} style="border-radius: 0.4rem; border:none;" />

            {{if error_edad}} {{foreach error_edad}} <div class="error">{{this}}</div>
            {{endfor error_edad}}
            {{endif error_edad}}
        </fieldset>

        <fieldset class="row flex-center" style="border-color:transparent; margin-top:1rem">
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
            window.location.href = "index.php?page=mnt_candidatos";
        });
    });
</script>
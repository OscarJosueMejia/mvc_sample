<h1>{{mode_desc}}</h1>
<section>
    <form action="index.php?page=mnt_piano" method="post">
        <input type="hidden" name="mode" value="{{mode}}" />
        <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
        <input type="hidden" name="pianoid" value="{{pianoid}}" />

        <fieldset>
            <label for="pianodsc">Descripción</label>
            <input type="text" id="pianodsc" name="pianodsc" placeholder="Descripción" value="{{pianodsc}}"
                {{if readonly}} readonly {{endif readonly}} />
            {{if error_pianodsc}} {{foreach error_pianodsc}} <div class="error">{{this}}</div>
            {{endfor error_pianodsc}}
            {{endif error_pianodsc}}
        </fieldset>

        <fieldset>
            <label for="pianobio">Biografía</label>
            <input type="text" id="pianobio" name="pianobio" placeholder="Biografía" value="{{pianobio}}"
                {{if readonly}} readonly {{endif readonly}} />
            {{if error_pianobio}} {{foreach error_pianobio}} <div class="error">{{this}}</div>
            {{endfor error_pianobio}}
            {{endif error_pianobio}}
        </fieldset>

        <fieldset>
            <label for="pianosales">Cantidad de Ventas</label>
            <input type="number" id="pianosales" name="pianosales" placeholder="Cantidad de Ventas"
                value="{{pianosales}}" {{if readonly}} readonly {{endif readonly}} />
            {{if error_pianosales}} {{foreach error_pianosales}} <div class="error">{{this}}</div>
            {{endfor error_pianosales}}
            {{endif error_pianosales}}
        </fieldset>

        <fieldset>
            <label for="pianoimguri">URL de Imagen</label>
            <input type="url" id="pianoimguri" name="pianoimguri" placeholder="URL de Imagen" value="{{pianoimguri}}"
                {{if readonly}} readonly {{endif readonly}} />
        </fieldset>

        <fieldset>
            <label for="pianoimgthb">URL de Tumbnail</label>
            <input type="url" id="pianoimgthb" name="pianoimgthb" placeholder="URL de Tumbnail" value="{{pianoimgthb}}"
                {{if readonly}} readonly {{endif readonly}} />
        </fieldset>

        <fieldset>
            <label for="pianoprice">Precio</label>
            <input type="number" id="pianoprice" name="pianoprice" placeholder="Precio" value="{{pianoprice}}"
                {{if readonly}} readonly {{endif readonly}} />
            {{if error_pianoprice}} {{foreach error_pianoprice}} <div class="error">{{this}}</div>
            {{endfor error_pianoprice}}
            {{endif error_pianoprice}}
        </fieldset>

        <fieldset>
            <label for="pianoest">Estado</label>
            <select name="pianoest" id="pianoest" {{if readonly}} readonly disabled {{endif readonly}}>
                {{foreach pianoestArr}}
                <option value="{{value}}" {{selected}}>{{text}}</option>
                {{endfor pianoestArr}}
            </select>
        </fieldset>


        <fieldset>
            {{if showBtn}}
            <button type="submit" name="btnEnviar">{{btnEnviarText}}</button>
            &nbsp;
            {{endif showBtn}}
            <button name="btnCancelar" id="btnCancelar">Cancelar</button>
        </fieldset>
    </form>
</section>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('btnCancelar').addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.href = 'index.php?page=mnt_pianos';
        });
    });
</script>
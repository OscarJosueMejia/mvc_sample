<h1>{{mode_desc}}</h1>
<section>
    <form action="index.php?page=mnt_producto" method="post" class="row offset-3 col-6"
        style="background-color:#F4F4F4; border-radius:1rem; padding:1rem; font-size:1.1rem">
        <input type="hidden" name="mode" value="{{mode}}" />
        <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
        <input type="hidden" name="invPrdId" value="{{invPrdId}}" />
        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="invPrdBrCod">Código de Barra</label>
            <input class="col-8" type="text" id="invPrdBrCod" name="invPrdBrCod" placeholder="Código de Barra"
                value="{{invPrdBrCod}}" {{if readonly}} readonly {{endif readonly}}
                style="border-radius: 0.4rem; border:none;" />
            {{if error_invPrdBrCod}} {{foreach error_invPrdBrCod}} <div class="error">{{this}}</div>
            {{endfor error_invPrdBrCod}}
            {{endif error_invPrdBrCod}}
        </fieldset>
        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="invPrdCodInt">SKU</label>
            <input class="col-8" type="text" id="invPrdCodInt" name="invPrdCodInt" placeholder="SKU"
                value="{{invPrdCodInt}}" {{if readonly}} readonly {{endif readonly}}
                style="border-radius: 0.4rem; border:none;" />
            {{if error_invPrdCodInt}}
            {{foreach error_invPrdCodInt}}
            <div class="error">{{this}}</div>
            {{endfor error_invPrdCodInt}}
            {{endif error_invPrdCodInt}}
        </fieldset>
        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="invPrdDsc">Descripción</label>
            <input class="col-8" type="text" id="invPrdDsc" name="invPrdDsc" placeholder="Descripción"
                value="{{invPrdDsc}}" {{if readonly}} readonly {{endif readonly}}
                style="border-radius: 0.4rem; border:none;" />
            {{if error_invPrdDsc}}
            {{foreach error_invPrdDsc}}
            <div class="error">{{this}}</div>
            {{endfor error_invPrdDsc}}
            {{endif error_invPrdDsc}}
        </fieldset>

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="invPrdPrice">Precio de Venta</label>
            <input class="col-8" type="text" id="invPrdPrice" name="invPrdPrice" placeholder="Precio de Venta"
                value="{{invPrdPrice}}" {{if readonly}} readonly {{endif readonly}}
                style="border-radius: 0.4rem; border:none;" />
            {{if error_invPrdPrice}} {{foreach error_invPrdPrice}} <div class="error">{{this}}</div>
            {{endfor error_invPrdPrice}}
            {{endif error_invPrdPrice}}
        </fieldset>

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="invPrdTip">Tipo de Producto</label>
            <select class="col-8" name="invPrdTip" id="invPrdTip" {{if readonly}} readonly disabled {{endif readonly}}
                style="border-radius: 0.4rem; border:none;">
                {{foreach invPrdTipArr}}
                <option value="{{value}}" {{selected}}>{{text}}</option>
                {{endfor invPrdTipArr}}
            </select>
        </fieldset>
        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="invPrdEst">Estado</label>
            <select class="col-8" name="invPrdEst" id="invPrdEst" {{if readonly}} readonly disabled {{endif readonly}}
                style="border-radius: 0.4rem; border:none;">
                {{foreach invPrdEstArr}}
                <option value="{{value}}" {{selected}}>{{text}}</option>
                {{endfor invPrdEstArr}}
            </select>
        </fieldset>
        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="invPrdVnd">Es Vendible</label>
            <select class="col-8" name="invPrdVnd" id="invPrdVnd" {{if readonly}} readonly disabled {{endif readonly}}
                style="border-radius: 0.4rem; border:none;">
                {{foreach invPrdVndArr}}
                <option value="{{value}}" {{selected}}>{{text}}</option>
                {{endfor invPrdVndArr}}
            </select>
        </fieldset>
        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="inv">URL Imágen Producto</label>
            <input class="col-8" {{if readonly}}readonly{{endif readonly}} type="text" id="invPrdImg" name="invPrdImg"
                placeholder="URL" value="{{invPrdImg}}" style="border-radius: 0.4rem; border:none;" />
            {{if error_invPrdImg}}
            {{foreach error_invPrdImg}}
            <div class="error">{{this}}</div>
            {{endfor error_invPrdImg}}
            {{endif error_invPrdImg}}
        </fieldset>
        <fieldset class=" row flex-center" style="border-color:transparent;  margin-top:1rem">
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
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('btnCancelar').addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.href = 'index.php?page=mnt_productos';
        });
    });
</script>
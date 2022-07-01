<h1 class="center">Catálogo de Productos</h1>

<section>
    <form action="index.php?page=mnt_catalogo" method="post" class="row offset-3 col-6"
        style="background-color:#F4F4F4; border-radius:1rem; padding:1rem; font-size:1.1rem">
        <input type="hidden" name="crsf_token" value="{{crsf_token}}" />

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="invPrdDsc">Buscar: </label>
            <input class="col-8" type="text" id="invPrdDsc" name="invPrdDsc" placeholder="Descripción"
                value="{{invPrdDsc}}" style="border-radius: 0.4rem; border:none;" />
        </fieldset>

        <fieldset class="row" style="border-color:transparent;">
            <label class="col-4" for="doubleBasePrice">Precio Base: </label>
            <input class="col-8" type="number" id="doubleBasePrice" min="1" name="doubleBasePrice" placeholder="100"
                value="{{doubleBasePrice}}" style="border-radius: 0.4rem; border:none;" />
        </fieldset>

        <fieldset class=" row" style="border-color:transparent;">
            <label class="col-4" for="doubleMaxPrice">Precio Máximo: </label>
            <input class="col-8" type="number" id="doubleMaxPrice" min="1" name="doubleMaxPrice" placeholder="500"
                value="{{doubleMaxPrice}}" style="border-radius: 0.4rem; border:none;" />
        </fieldset>

        <fieldset class=" row flex-center" style="border-color:transparent; margin-top:1rem">
            <button class="rounded" type="submit" name="btnEnviar"
                style="border-radius: 0.4rem; background-color:#ffce00; border-color:transparent; color:black;">Buscar</button>
            &nbsp;
            <button class="rounded" name="btnCancelar" id="btnCancelar" style="border-radius: 0.4rem;">Cancelar</button>
        </fieldset>
    </form>
</section>

<section style="margin-top:5rem">
    <h3 class="center">Productos</h3>

    <section class="grid" style="justify-content: center !important;">
        {{foreach Productos}}
        <div class="card" style="margin:20px">

            <div class="imgBox">
                <img src="{{invPrdImg}}" alt="No encontrado" class="mouse">
            </div>

            <div class="contentBox">
                <h3>{{invPrdDsc}}</h3>
                <h2 class="price">L. {{invPrdPrice}}</h2>
                <a href="index.php?page=Mnt-Producto&mode=DSP&id={{invPrdId}}" class="buy">Comprar</a>
            </div>

        </div>
        {{endfor Productos}}
    </section>
</section>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('btnCancelar').addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.href = 'index.php?page=mnt_catalogo';
        });
    });
</script>
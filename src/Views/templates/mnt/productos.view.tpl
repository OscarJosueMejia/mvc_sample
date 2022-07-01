<h1 class="center">Trabajar con Productos</h1>
<section>

</section>
<section class="row flex-center"
    style="background-color:#f4f4f4;margin-top: 1rem;border-radius:1rem; padding-top:1rem; padding-bottom:1rem;">
    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Estado</th>
                <th>Precio</th>
                <th>Vendible</th>
                <th><a href="index.php?page=Mnt-Producto&mode=INS">Nuevo</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach Productos}}
            <tr>
                <td>{{invPrdCodInt}}</td>
                <td> <a href="index.php?page=Mnt-Producto&mode=DSP&id={{invPrdId}}">{{invPrdDsc}}</a></td>
                <td>{{invPrdTip}}</td>
                <td>{{invPrdEst}}</td>
                <td>{{invPrdPrice}}</td>
                <td>{{invPrdVnd}}</td>
                <td>
                    <a href="index.php?page=Mnt-Producto&mode=UPD&id={{invPrdId}}">Editar</a>
                    &NonBreakingSpace;
                    <a href="index.php?page=Mnt-Producto&mode=DEL&id={{invPrdId}}">Eliminar</a>
                </td>
            </tr>
            {{endfor Productos}}
        </tbody>
    </table>
</section>
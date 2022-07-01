
<h1>Trabajar con Funciones</h1>
<section>

</section>
<section class="row flex-center"
    style="background-color:#f4f4f4;margin-top: 1rem;border-radius:1rem; padding-top:1rem; padding-bottom:1rem;">
    <table>
        <thead>
            <tr>
        <th>fncod</th>
<th>fndsc</th>
<th>fnest</th>
<th>fntyp</th>

                <th><a href="index.php?page=mnt_funcion&mode=INS">Nuevo</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach Funciones}}
            <tr>
                <td>{{fncod}}</td>
<td><a href="index.php?page=mnt_funcion&mode=DSP&id={{fncod}}">{{fndsc}}</td>
<td>{{fnest}}</td>
<td>{{fntyp}}</td>

                <td>
                    <a href="index.php?page=mnt_funcion&mode=UPD&id={{fncod}}">Editar</a>
                    &NonBreakingSpace;
                    <a href="index.php?page=mnt_funcion&mode=DEL&id={{fncod}}">Eliminar</a>
                </td>
            </tr>
            {{endfor Funciones}}
        </tbody>
    </table>
</section>
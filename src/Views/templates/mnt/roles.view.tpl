<h1 class="center">Trabajar con Roles</h1>
<section>

</section>
<section class="row flex-center"
    style="background-color:#f4f4f4;margin-top: 1rem;border-radius:1rem; padding-top:1rem; padding-bottom:1rem;">
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Descripción</th>
                <th>Estado</th>

                <th><a href="index.php?page=mnt_rol&mode=INS">Nuevo</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach Roles}}
            <tr>
                <td>{{rolescod}}</td>
                <td><a href="index.php?page=mnt_rol&mode=DSP&id={{rolescod}}">{{rolesdsc}}</td>
                <td>{{rolesest}}</td>

                <td>
                    <a href="index.php?page=mnt_rol&mode=UPD&id={{rolescod}}">Editar</a>
                    &NonBreakingSpace;
                    <a href="index.php?page=mnt_rol&mode=DEL&id={{rolescod}}">Eliminar</a>
                </td>
            </tr>
            {{endfor Roles}}
        </tbody>
    </table>
</section>
<h1 class="center">Trabajar con Candidatos</h1>

<section class="row flex-center"
    style="background-color:#f4f4f4;margin-top: 1rem;border-radius:1rem; padding-top:1rem; padding-bottom:1rem;">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Identidad</th>
                <th>Nombre</th>
                <th>Edad</th>
                <th><a href="index.php?page=mnt_candidato&mode=INS">Nuevo</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach Candidatos}}
            <tr>
                <td>{{id_candidato}}</td>
                <td>{{identidad}}</td>
                <td><a href="index.php?page=mnt_candidato&mode=DSP&id={{id_candidato}}">{{nombre}}</td>
                <td>{{edad}}</td>

                <td>
                    <a href="index.php?page=mnt_candidato&mode=UPD&id={{id_candidato}}">Editar</a>
                    &NonBreakingSpace;
                    <a href="index.php?page=mnt_candidato&mode=DEL&id={{id_candidato}}">Eliminar</a>
                </td>
            </tr>
            {{endfor Candidatos}}
        </tbody>
    </table>
</section>
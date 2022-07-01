<h1 class="center">This is my first form</h1>
<form action="index.php?page=NW202202_FirstForm" method="post" class="row offset-3 col-6">
    <fieldset class="row">
        <label class="col-4" for="nombre">Nombre:</label>
        <input class="col-8" type="text" name="txtNombre" id="txtNombre" value="{{txtNombre}}" />
    </fieldset>
    <fieldset class="row">
        <label class="col-4" for="apellido">Apellido:</label>
        <input class="col-8" type="text" name="txtApellido" id="txtApellido" value="{{txtApellido}}" />
    </fieldset>
    <fieldset class="row">
        <button type="submit" name="btnEnviar">Enviar</button>
    </fieldset>
</form>
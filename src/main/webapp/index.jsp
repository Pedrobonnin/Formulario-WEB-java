<%@page contentType="text/html" pageEncoding= "UTF-8"  %>
<%@page import ="java.util.List"  %>

    <%  //etiquetas JSP para colocar codigo Java
        List <String> errores = (List<String>)request.getAttribute("errores");

         //siempre hay que hacer un cash de los atibutos que obtenemos

    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario Web con java</title>
</head>

<style>
        body{
            font-family: Arial, Helvetica, sans-serif;
            background-image: linear-gradient(to right, rgb(20, 147, 220), rgb(17, 54, 71));

        }
        .box{
            color: white;
            position: absolute;
            top: 60%;
            left: 50%;
            transform: translate(-50%,-50%);
            background-color: rgba(0, 0, 0, 0.6);
            padding: 15px;
            border-radius: 15px;
            width: 20%;

        }
        fieldset{
            border: 3px solid dodgerblue;
        }
        legend{
            border: 1px solid dodgerblue;
            padding: 10px;
            text-align: center;
            background-color: dodgerblue;
            border-radius: 8px;
        }
        .inputBox{
            position: relative;
        }
        .inputUser{
            background: none;
            border: none;
            border-bottom: 1px solid white;
            outline: none;
            color: white;
            font-size: 15px;
            width: 100%;
            letter-spacing: 2px;
        }
        .labelInput{
            position: absolute;
            top: 0px;
            left: 0px;
            pointer-events: none;
            transition: .5s;
        }
        .inputUser:focus ~ .labelInput,
        .inputUser:valid ~ .labelInput{
            top: -20px;
            font-size: 12px;
            color: dodgerblue;
        }
        #data_nascimento{
            border: none;
            padding: 8px;
            border-radius: 10px;
            outline: none;
            font-size: 15px;
        }
        #submit{
            background-image: linear-gradient(to right,rgb(0, 92, 197), rgb(90, 20, 220));
            width: 100%;
            border: none;
            padding: 15px;
            color: white;
            font-size: 15px;
            cursor: pointer;
            border-radius: 10px;
        }
        #submit:hover{
            background-image: linear-gradient(to right,rgb(0, 80, 172), rgb(80, 19, 195));
        }
    </style>
</head>
<body>
<%
if(errores!= null && errores.size()>0){
%>
<ul>
<%
for(String error:errores){
%>

<li>
<%out.print(error);  %>
</li>

<%}%>
</ul>
<%}%>


<div class="box">
    <form action="/formulario/registro" method="POST">
        <fieldset>
            <legend><b>Fórmulário</b></legend>
            <br>
            <div class="inputBox">
                <input type="text" name="usuario" id="username" class="inputUser" required>
                <label for="username" class="labelInput">Usuario</label>
            </div>
            <br><br>
            <div class="inputBox">
                <input type="text" name="apellido" id="apellido" class="inputUser" required>
                <label for="apellido" class="labelInput">Apellido</label>
            </div>
            <br><br>
            <div class="inputBox">
                <input type="password" name="password" id="contraseña" class="inputUser" >
                <label for="Contraseña" class="labelInput">Contraseña</label>
            </div>
            <br><br>
            <div class="inputBox">
                <input type="text" name="email" id="email" class="inputUser" required>
                <label for="email" class="labelInput">Email</label>
            </div>
            <br><br>
            <div class="inputBox">
                <input type="tel" name="telefono" id="telefono" class="inputUser" required>
                <label for="telefono" class="labelInput">Telefono</label>
            </div>
            <br>
            <div>
                <label><h4>Roles</h4></label>
                <br>
                <div>
                    <input type="checkbox" name="roles" value="ADMINISTRADOR">
                    <label>Administrador</label>
                </div>
                <br>
                <div>
                    <input type="checkbox" name="roles" value="USUARIO">
                    <label>Usuario</label>
                </div>
                <br>
                <div>
                    <input type="checkbox" name="roles" value="MODERADOR">
                    <label>Moredador</label>
                </div>
            </div>
            <br>
            <div class="inputBox">
                <h4>Lenguajes</h4>
                <select name="lenguajes" id="lang" multiple>
                    <option value="javascript">JavaScript</option>
                    <option value="php">PHP</option>
                    <option value="java">Java</option>
                    <option value="golang">Golang</option>
                    <option value="python">Python</option>
                    <option value="c#">C#</option>
                    <option value="C++">C++</option>
                    <option value="erlang">Erlang</option>
                </select>
            </div>
            <div class="inputBox">
                <h4 class="inputBox">Pais</h4>
                <select class="inputBox"  id='secondList' name='pais' >
                    <option class="inputBox" value="Argentina">Argentina</option>
                    <option value="Brasil">Brasil</option>
                    <option value="Chile">Chile</option>
                    <option value="Uruguay">Uruguay</option>
                </select>
            </div>
            <br>
            <input type="submit" name="submit" id="submit">
        </fieldset>
    </form>
</div>
</body>
</html>
<%-- 
    Document   : menu
    Created on : 26/07/2020, 05:58:40 PM
    Author     : CHRISTIAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form name="f_datos" action="valida.jsp" method="POST">
            <table border="1" align="center" cellspacing="0" celpagging="0" >
                <thead>
                    <tr>
                        <th colspan="2">PRÁCTICA</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Datos Estudiante</td>
                        <td><a href="datosestudiante.jsp">ingresar</a></td>
                    </tr>
                    <tr>
                        <td>Datos Curso</td>
                        <td><a href="datoscurso.jsp">Ingresar</a></td>
                    </tr>
                    <tr>
                        <td>Datos Carrera</td>
                        <td><a href="datoscarrera.jsp">Ingresar</a></td>
                    </tr>
                    <tr>
                        <td>Datos Matricula</td>
                        <td><a href="datosmatricula.jsp">Ingresar</a></td>
                    </tr>
                    <tr align ="center">
                        <td colspan="2"><a href="login.jsp">Volver</a></td>
                    </tr>
                </tbody>
            </table>

        </form> 
    </body>
</html>
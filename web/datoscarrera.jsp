<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Carrera</title>
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
        <%!
            // Variables globales (Página)
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idcarrera;
            String s_nombre;
            String s_codigo;
            String s_estado;

        %>
    </head>
    <body>
        
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idcarrera = request.getParameter("f_idcarrera");
                // Primera parte del modificar
                if (s_accion!=null && s_accion.equals("M1")) {
                    consulta =  "   select nombre, codigo, estado  "
                                + " from carrera  "
                                + " where  "
                                + " idcarrera =  " + s_idcarrera;
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
                            
                        
                    %>    
                <form name="EditarCarreraForm" action="datoscarrera.jsp" method="GET">
                    <table border="0" align="center">
                        <thead>
                            <tr>
                                <th colspan="2">Editar Carrera</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Nombre:</td>
                                <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="25" /></td>
                            </tr>
                            <tr>
                                <td>Código: </td>
                                <td><input type="text" name="f_codigo" value="<% out.print(rs.getString(4)); %>" maxlength="12" size="15" /></td>
                            </tr>
                            <tr>
                                <td>Estado: </td>
                          <td>
                          <select  name="f_estado" value="<% out.print(rs.getString(5)); %>">
                            <option value="A">A</option>
                            <option value="I">I</option>
                          </select>
                        <td/>      
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <input type="submit" value="Editar" name="f_editar" />
                                    <input type="hidden" name="f_accion" value="M2" />
                                    <input type="hidden" name="f_idcarrera" value="<%out.print(s_idcarrera);%>" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                                  
                          
                
                    
                    <%
                        }
                }else{
                // Si no se hace la primera parte del modidicar debe mostrar el 
                // formulario de agregar estudiante

        %>
        <form name="AgregarCarreraForm" action="datoscarrera.jsp" method="GET">
            <table border="0" align="center" class="ecologico" style="margin: auto; display: table">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Carrera</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="25" /></td>
                    </tr>
                    <tr>
                        <td>Código: </td>
                        <td><input type="text" name="f_codigo" value="" maxlength="12" size="15" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                          <td>
                          <select  name="f_estado" value="" >
                            <option value="A">A</option>
                            <option value="I">I</option>
                          </select>
                         </td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                </tbody>    
            </table>
        </form>
        <%
            }
        %>
        <table border="0" align="center" class="ecologico" style="margin: auto; display: table">
                     <thead>
                    <tr>
                        <th colspan="2">Volver al Menu</th>
                    </tr>
                </thead>
            <tr align ="center">
                           <td colspan="2"><a href="menu.jsp"><input type=image src="img/backtomenu.png" width="40" height="30"/></a></td>
                    </tr>
        </table><br>
        <table border="1" cellpadding ="2" align = "center" class="ecologico" style="margin: auto; display: table" >
            <thead>
                <tr>
                    <th colspan="8">
                        Datos Carrera
                    </th>
                </tr>
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Código</th>
                    <th>Estado</th>
                    <th colspan="2">Acciones</th>

                </tr>
            </thead>

        
        <%        
                
                
                if (s_accion !=null) {
                    
                    // Ejecutar la eliminación de estudiantes
                    if (s_accion.equals("E")) {
                            consulta =    " delete from carrera "
                                        + " where  "
                                        + " idcarrera = " + s_idcarrera +"; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    // Sino se elimina registros de estudiantes, 
                    // Pregunta si se va a REGISTRAR UN NUEVO ESTUDIANTE
                    }else if(s_accion.equals("C")){
                            s_nombre = request.getParameter("f_nombre");
                            s_codigo = request.getParameter("f_codigo");
                            s_estado = request.getParameter("f_estado");
                            
                            consulta =    " insert into "
                                        + " carrera (nombre, codigo, estado)"
                                        + " values('"+ s_nombre +"','"+ s_codigo +"','"+s_estado+"');  ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    // Si no se está creando o eliminando registro de estudiante
                    // Pregunta si va a hacer la MODIFICACIÓN DE ESTUDIANTES - Parte 2
                    }else if (s_accion.equals("M2")) {
                            s_nombre = request.getParameter("f_nombre");
                            s_codigo = request.getParameter("f_codigo");
                            s_estado = request.getParameter("f_estado");
                            consulta =  "   update carrera  "
                                        + " set  "
                                        + " nombre = '"+ s_nombre +"', "
                                        + " codigo = '" + s_codigo + "', "
                                        + " estado = '" + s_estado + "'  "
                                        + " where  "
                                        + " idcarrera = " + s_idcarrera + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }
                    
                }
                
                // Listar los estudiantes de la TABLA ESTUDIANTE
                consulta= " Select idcarrera, nombre, codigo, estado "
                        + " from carrera ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {    
                    ide = rs.getString(1);
                    num++;
                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>

                        <td><a href="datoscarrera.jsp?f_accion=E&f_idcarrera=<%out.print(ide);%>"><input type=image src="img/delete.png" width="40" height="30"></a></td>
                        <td><a href="datoscarrera.jsp?f_accion=M1&f_idcarrera=<%out.print(ide);%>"><input type=image src="img/edit.png" width="40" height="30"></a></td>
                        
                    </tr>                    
                    <%
                    }
                    // Se cierra todas las conexiones
                    rs.close();
                    pst.close();
                    cn.close();
            }catch(Exception e){
                out.print("Error SQL");
            }
        
        %>
        </table>
    </body>
</html>
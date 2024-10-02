<%@page import="org.trabalhos.Clientes" %>
<%@page import="org.trabalhos.ClientesDao" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Excluído</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
</head>
<body>
    <%
        Clientes c = new Clientes();
        ClientesDao cdao = new ClientesDao();

        c.setIdclientes(Integer.parseInt(request.getParameter("idclientes")));

        cdao.excluir(c);
    %>

    <div class="container mt-5">
        <h2 class="text-center text-success my-4">Cadastro excluído com sucesso</h2>
        <div class="text-center">
            <a href="index.jsp" class="btn btn-primary mb-3">Ir para o Início</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous"></script>
</body>
</html>

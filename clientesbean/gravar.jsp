<%@page import="org.trabalhos.Clientes" %>
<%@page import="org.trabalhos.ClientesDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Salvo</title>
    <!-- Adicionando Bootstrap para melhor aparência -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
</head>
<body>
    <jsp:useBean id="c" scope="page" class="org.trabalhos.Clientes" />
    <jsp:useBean id="cdao" scope="page" class="org.trabalhos.ClientesDao" />    
    <jsp:setProperty property="*" name="c"/>

    <%
        // Salva o cliente no banco de dados
        cdao.salvar(c);
    %>

    <div class="container mt-5">
        <h2 class="my-3 text-center">Cadastro salvo com sucesso!</h2>
        <div class="text-center">
            <a href="listar.jsp" class="btn btn-success mb-3">Ir para Lista de Clientes</a>
        </div>
    </div>

    <!-- Script Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous"></script>
</body>
</html>

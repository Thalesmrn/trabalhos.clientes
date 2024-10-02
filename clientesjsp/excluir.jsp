<%@page import="org.trabalhos.Clientes"%>
<%@page import="org.trabalhos.ClientesDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cliente Excluído</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            font-family: 'Arial', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h3 {
            color: #f8d7da;
        }
        a {
            color: #ffffff;
            text-decoration: none;
        }
        a:hover {
            color: #f6d365;
        }
    </style>
</head>
<body>

<%
    // Obtém o parâmetro 'id' da requisição e tenta convertê-lo para inteiro
    String idParam = request.getParameter("id");
    if (idParam != null && !idParam.isEmpty()) {
        try {
            int idCliente = Integer.parseInt(idParam);

            // Cria objeto Cliente e define o ID
            Clientes c = new Clientes();
            c.setIdclientes(idCliente);
            
            // Cria objeto DAO e exclui o cliente
            ClientesDao cdao = new ClientesDao();
            cdao.excluir(c);
        } catch (NumberFormatException e) {
            out.println("<div class='container'><h3>Erro: ID inválido!</h3></div>");
        }
    } else {
        out.println("<div class='container'><h3>Erro: Nenhum ID fornecido!</h3></div>");
    }
%>

<div class="container">
    <h3>Cliente excluído com sucesso!</h3>
    <a class="btn btn-primary mt-3" href="listar.jsp">Voltar para a Lista de Clientes</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
</body>
</html>

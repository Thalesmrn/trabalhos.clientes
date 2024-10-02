<%@page import="org.trabalhos.Clientes" %>
<%@page import="org.trabalhos.ClientesDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Lista de Clientes</h2>
        
        <div class="d-flex justify-content-between mb-3">
            <a href="formulario.jsp?id=0" class="btn btn-success">Adicionar Cliente</a>
            <a href="index.jsp" class="btn btn-primary">Início</a>
        </div>
        
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Sobrenome</th>
                    <th>Telefone</th>
                    <th>Email</th>
                    <th>Endereço</th>
                    <th>Cidade</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Instanciando o DAO de clientes e listando os registros
                    ClientesDao dao = new ClientesDao();
                    for (Clientes c : dao.listar()) {
                %>
                <tr>
                    <td><%= c.getIdclientes() %></td>
                    <td><%= c.getNome() %></td>
                    <td><%= c.getSobrenome() %></td>
                    <td><%= c.getTelefone() %></td>
                    <td><%= c.getEmail() %></td>
                    <td><%= c.getEndereco() %></td>
                    <td><%= c.getCidade() %></td>
                    <td>
                        <a href="formulario.jsp?id=<%= c.getIdclientes() %>" class="btn btn-warning btn-sm me-2">Editar</a>
                        <a href="excluir.jsp?id=<%= c.getIdclientes() %>" class="btn btn-danger btn-sm">Excluir</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous"></script>
</body>
</html>

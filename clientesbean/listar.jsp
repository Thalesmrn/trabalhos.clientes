<%@page import="org.trabalhos.Clientes" %>
<%@page import="org.trabalhos.ClientesDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
</head>
<body>
    <jsp:useBean id="cdao" scope="page" class="org.trabalhos.ClientesDao" />

    <div class="container mt-5">
        <h2 class="my-3 text-center">Lista de Clientes</h2>
        <div class="text-center mb-3">
            <a href="formulario.jsp?idclientes=0" class="btn btn-success">Adicionar Cliente</a>
            <a href="index.jsp" class="btn btn-primary">Início</a>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>NOME</th>
                    <th>SOBRENOME</th>
                    <th>TELEFONE</th>
                    <th>EMAIL</th>
                    <th>ENDEREÇO</th>
                    <th>CIDADE</th>
                    <th>AÇÕES</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${cdao.listar()}">
                    <tr>
                        <td>${c.nome}</td>
                        <td>${c.sobrenome}</td>
                        <td>${c.telefone}</td>
                        <td>${c.email}</td>
                        <td>${c.endereco}</td>
                        <td>${c.cidade}</td>
                        <td>
                            <a href="formulario.jsp?idclientes=${c.idclientes}" class="btn btn-warning btn-sm">Editar</a>
                            <a href="excluir.jsp?idclientes=${c.idclientes}" class="btn btn-danger btn-sm">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>

<%@page import="org.trabalhos.Clientes" %>
<%@page import="org.trabalhos.ClientesDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário do Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
</head>
<body>

    <jsp:useBean id="cdao" class="org.trabalhos.ClientesDao" scope="page"/>
    <jsp:useBean id="c" class="org.trabalhos.Clientes" scope="page"/>
    <jsp:setProperty property="*" name="c"/>
  	${c=cdao.consultar(c.idclientes)}

    <div class="container mt-5">
        <h1>Formulário do Cliente</h1>
        <form action="gravar.jsp" method="post">
            <input type="hidden" name="idclientes" value="${c.idclientes}" />
            
            <div class="mb-3">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" name="nome" class="form-control" 
                       value="${c.nome}"/>
            </div>
            
            <div class="mb-3">
                <label for="sobrenome" class="form-label">Sobrenome</label>
                <input type="text" name="sobrenome" class="form-control" 
                       value="${c.sobrenome}"/>
            </div>
            
            <div class="mb-3">
                <label for="telefone" class="form-label">Telefone</label>
                <input type="text" name="telefone" class="form-control" 
                       value="${c.telefone}"/>
            </div>
            
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" name="email" class="form-control" 
                       value="${c.email}"/>
            </div>
            
            <div class="mb-3">
                <label for="endereco" class="form-label">Endereco</label>
                <input type="text" name="endereco" class="form-control" 
                       value="${c.endereco}"/>
            </div>
            
            <div class="mb-3">
                <label for="cidade" class="form-label">Cidade</label>
                <input type="text" name="cidade" class="form-control" 
                       value="${c.cidade}"/>
            </div>
            
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-success">Salvar</button>
                <a href="listar.jsp" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous"></script>
</body>
</html>

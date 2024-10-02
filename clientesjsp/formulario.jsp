<%@page import="org.trabalhos.Clientes" %>
<%@page import="org.trabalhos.ClientesDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <%
        int Idclientes = Integer.parseInt(request.getParameter("id"));
        Clientes c = new Clientes();
        ClientesDao cdao = new ClientesDao();
        if (Idclientes > 0) {
            c = cdao.consultar(Idclientes);
        } else {
            // Limpa os dados para novo cadastro
            c.setNome("");
            c.setSobrenome("");
            c.setTelefone("");
            c.setEmail("");
            c.setEndereco("");
            c.setCidade("");
        }
    %>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-lg">
                    <div class="card-header bg-primary text-white">
                        <h3 class="card-title">Formulário de Cadastro de Clientes</h3>
                    </div>
                    <div class="card-body">
                        <form action="gravar.jsp" method="post">
                            <input type="hidden" name="idclientes" value="<%= c.getIdclientes() %>" />

                            <div class="mb-3">
                                <label for="nome" class="form-label">Nome</label>
                                <input type="text" name="nome" class="form-control" value="<%= c.getNome() %>" required/>
                            </div>

                            <div class="mb-3">
                                <label for="sobrenome" class="form-label">Sobrenome</label>
                                <input type="text" name="sobrenome" class="form-control" value="<%= c.getSobrenome() %>" required/>
                            </div>

                            <div class="mb-3">
                                <label for="telefone" class="form-label">Telefone</label>
                                <input type="text" name="telefone" class="form-control" value="<%= c.getTelefone() %>" required/>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" name="email" class="form-control" value="<%= c.getEmail() %>" required/>
                            </div>

                            <div class="mb-3">
                                <label for="endereco" class="form-label">Endereco</label>
                                <input type="text" name="endereco" class="form-control" value="<%= c.getEndereco() %>" required/>
                            </div>

                            <div class="mb-3">
                                <label for="cidade" class="form-label">Cidade</label>
                                <input type="text" name="cidade" class="form-control" value="<%= c.getCidade() %>" required/>
                            </div>

                            <button type="submit" class="btn btn-success w-100">Salvar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

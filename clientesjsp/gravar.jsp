<%@page import="org.trabalhos.Clientes" %>
<%@page import="org.trabalhos.ClientesDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmação de Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
</head>
<body>
    <%
        // Criação de instâncias DAO e Cliente
        ClientesDao dao = new ClientesDao();
        Clientes c = new Clientes();
        
        // Captura dos parâmetros enviados pelo formulário
        String idParam = request.getParameter("idclientes");
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");
        String endereco = request.getParameter("endereco");
        String cidade = request.getParameter("cidade");

        // Valida se todos os campos obrigatórios foram fornecidos
        if (nome != null && sobrenome != null && telefone != null && email != null && endereco != null && cidade != null) {
            // Se o ID for fornecido e válido, tenta converter
            if (idParam != null && !idParam.isEmpty()) {
                try {
                    int idCliente = Integer.parseInt(idParam);
                    c.setIdclientes(idCliente);
                } catch (NumberFormatException e) {
                    out.println("<div class='alert alert-danger text-center'>ID inválido.</div>");
                }
            }

            // Preenche o objeto cliente com os dados do formulário
            c.setNome(nome);
            c.setSobrenome(sobrenome);
            c.setTelefone(telefone);
            c.setEmail(email);
            c.setEndereco(endereco);
            c.setCidade(cidade);
            
            // Se o ID for maior que 0, atualiza; caso contrário, adiciona novo cliente
            if (c.getIdclientes() > 0) {
                dao.editar(c);
            } else {
                dao.adicionar(c);
            }
        } else {
            out.println("<div class='alert alert-danger text-center'>Erro: Todos os campos são obrigatórios.</div>");
        }
    %>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <div class="alert alert-success" role="alert">
                    <h1>Cliente salvo com sucesso!</h1>
                </div>
                <a href="listar.jsp">
                    <button type="button" class="btn btn-primary mt-3">OK</button>
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous"></script>
</body>
</html>

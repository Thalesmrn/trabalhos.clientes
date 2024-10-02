package org.trabalhos;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	private Connection connection;
	
	public Conexao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//abre conexão com o banco de dados
			connection = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/"
					+ "clientes?verifyServerCertificate=false&useSSL=false",
					"clientes", "1234");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void desconecta() {
		try {
			connection.close();
		}	catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		return connection;
	}
	public void setConnection(Connection connection) {
		this.connection = connection;
	}
}
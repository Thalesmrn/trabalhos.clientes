package org.trabalhos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

	public class ClientesDao {

			//private static LinkedList<Clientes> lista = new LinkedList<Clientes>();

		public void salvar(Clientes c) {
			if (c.getIdclientes()>0) {
				editar(c);
			} else {
				adicionar(c);
			}
		}

		public void adicionar(Clientes c) {
			//lista.add(c);

			Conexao con = new Conexao();

			try {
				String sql = "INSERT INTO clientes (nome, sobrenome, telefone, email, endereco, cidade) "
						+ "VALUES (?, ?, ?, ?, ?, ?)";
				PreparedStatement prep = con.getConnection().prepareStatement(sql);
				prep.setString(1, c.getNome());
				prep.setString(2, c.getSobrenome());
				prep.setString(3, c.getTelefone());
				prep.setString(4, c.getEmail());
				prep.setString(5, c.getEndereco());
				prep.setString(6, c.getCidade());
				prep.execute();
			} catch (Exception e) {
				e.printStackTrace();
	}

			con.desconecta();
	}


		public void editar(Clientes c) {
			Conexao con = new Conexao();
			try {
				String sql = " UPDATE clientes SET "
						+ " nome = ?, sobrenome = ?, "
						+ " telefone = ?, email = ?, "
						+ " endereco = ?, cidade = ? "
						+ " WHERE idclientes = ?";
				PreparedStatement prep = con.getConnection().prepareStatement(sql);
				prep.setString(1, c.getNome());
				prep.setString(2, c.getSobrenome());
				prep.setString(3, c.getTelefone());
				prep.setString(4, c.getEmail());
				prep.setString(5, c.getEndereco());
				prep.setString(6, c.getCidade());
				prep.setInt(7, c.getIdclientes());
				prep.execute();	
			}	catch (Exception e) {
				e.printStackTrace();
			}
			con.desconecta();
		}


		public void excluir(Clientes c) {
			Conexao con = new Conexao();
			try {
				String sql = " DELETE FROM clientes "
						+ " WHERE idclientes = ?";
				PreparedStatement prep = con.getConnection().prepareStatement(sql);
				prep.setInt(1, c.getIdclientes());
				prep.execute();		
			}	catch (Exception e) {
				e.printStackTrace();
			}
			con.desconecta();
		}


		public LinkedList<Clientes> listar(){
			//return lista;
			LinkedList<Clientes> lista = new LinkedList<Clientes>();
			Conexao con = new Conexao();
			try {
				String sql = "SELECT * FROM Clientes";
				Statement sta = con.getConnection().createStatement();
				ResultSet res = sta.executeQuery(sql);
				while (res.next()) {
					Clientes c = new Clientes();
					c.setIdclientes(res.getInt("idclientes"));
					c.setNome(res.getString("nome"));
					c.setSobrenome(res.getString("sobrenome"));
					c.setTelefone(res.getString("telefone"));
					c.setEmail(res.getString("email"));
					c.setEndereco(res.getString("endereco"));
					c.setCidade(res.getString("cidade"));
					lista.add(c);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			con.desconecta();
			return lista;
		}


		public Clientes consultar(int id) {
			System.out.println("consultandoid "+id);
			Clientes c = new Clientes();
			Conexao con = new Conexao();
			try {
				String sql = "SELECT * FROM clientes WHERE idclientes = " + id;
				Statement sta = con.getConnection().createStatement();
				ResultSet res = sta.executeQuery(sql);
				if (res.next()) {
					c.setIdclientes(res.getInt("idclientes"));
					c.setNome(res.getString("nome"));
					c.setSobrenome(res.getString("sobrenome"));
					c.setTelefone(res.getString("telefone"));
					c.setEmail(res.getString("email"));
					c.setEndereco(res.getString("endereco"));
					c.setCidade(res.getString("cidade"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			con.desconecta();
			System.out.println("consultandoid "+c.getNome());
			return c;
		}
	}

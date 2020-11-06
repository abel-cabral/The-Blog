package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexao {
    //Atributo que irá armazenar a conexão com o banco de dados
    private static Connection conexao = null;    

    //Método que realiza a conexão com o banco de dados
    public static Connection criaConexao() throws SQLException {
        //Verifica se já exite uma conexão com o banco de dados
        if (conexao == null) {
            final String url = "jdbc:mysql://localhost/blog";
            final String user = "root";
            final String senha = "password";
            
            try {
                //Carrega o Driver JDBC na memória
                Class.forName("com.mysql.jdbc.Driver"); //load driver
                System.out.println("Driver foi carregado!");

                //Abre a conexão com o banco de dados via JDBC
                conexao = DriverManager.getConnection(url, user, senha);                

                // conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/agenda", "root", "");
                System.out.println("Conexão realizada com sucesso!");
            } catch (ClassNotFoundException e) {
                System.out.println("Error ao abrir conexão " + e.getMessage());
            }
        }
        // Retorna um objeto Connection, contendo a conexão aberta com o BD
        return conexao;
    }
}

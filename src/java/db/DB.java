package db;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DB {
    private static Connection conn = null;
    
    // Inicia/referencia uma conexao com o BD
    public static Connection getConnection() throws ClassNotFoundException {
        Properties props = new Properties();
        props.put("user", "root");
        props.put("password", "");
        String url = "jdbc:mysql://localhost:3306/blog?useUnicode=true&amp;characterEncoding=utf8";
        try {
            // load and register JDBC driver for MySQL
            Class.forName("com.mysql.jdbc.Driver"); 
            conn = DriverManager.getConnection(url, props);
            System.out.println("Successfully connected to MySQL database " +  url);
        } catch (SQLException ex) {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return conn;
    }

    // Finaliza a conexao com o BD
    public static void closeConection() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                throw new DbException(e.getMessage());
            }
        }
    }

    // Carrega as propriedades
    private static Properties loadProperties() {
        try (FileInputStream fs = new FileInputStream("db.properties")) {
            Properties props = new Properties();
            props.load(fs);
            return props;
        } catch (IOException e) {
            throw new DbException(e.getMessage());
        }
    }

    public static void closeStatement(Statement x) {
        try {
            if (x != null) {
                x.close();
            }
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        }
    }

    public static void closeResultSet(ResultSet n) {
        try {
            if (n != null) {
                n.close();
            }
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        }
    }
}

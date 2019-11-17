package coma;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class JDBC {
	public Connection conn = null;
	public void Conn() {
		String url = "jdbc:mariadb://127.0.0.1:3306/javatest";
		String uid = "root";
		String upw = "1234";
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("database 연결 시도중 ..");
			conn = DriverManager.getConnection(url, uid, upw);
			System.out.println("database 연결 성공!");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

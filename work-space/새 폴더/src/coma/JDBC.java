package coma;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBC {
	public Connection conn = null;
	public void Conn() {
		String url = "jdbc:mariadb://localhost:3306/javatest";
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

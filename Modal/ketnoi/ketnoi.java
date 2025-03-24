package ketnoi;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoi {
	public Connection cn;
	public void ketnoi() throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url="jdbc:sqlserver://DESKTOP-CDO0SQ2\\SQLEXPRESS:1433;databaseName=QLXeMay;user=sa; password=123";

		cn= DriverManager.getConnection(url);
		System.out.println("da ket noi");
	}
}

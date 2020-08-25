package newpackage;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class EpassUploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// database connection settings

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// gets values of text fields
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String passenger = request.getParameter("passenger");
		String reason = request.getParameter("reason");

		InputStream inputStream = null; // input stream of the upload file

		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {

			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}

		Connection con = null; // connection to the database
		String message = null; // message will be sent back to client

		try {
			// connects to the database
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcovid", "root", "1234");

			// constructs SQL statement
			String sql = "INSERT INTO epass_user (name,email,source,destination,passenger,reason,photo) values (?,?,?,?,?,?,?)";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, name);
			statement.setString(2, email);
			statement.setString(3, source);
			statement.setString(4, destination);
			statement.setString(5, passenger);
			statement.setString(6, reason);

			if (inputStream != null) {

				statement.setBlob(7, inputStream);
			}

			int row = statement.executeUpdate();
			if (row > 0) {
				message = "Request for the E-pass is successfull";
			}
		} catch (SQLException | ClassNotFoundException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} finally {
			if (con != null) {
				// closes the database connection
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			// sets the message in request scope
			request.setAttribute("Message", message);

			// forwards to the message page
			getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
		}
	}
}
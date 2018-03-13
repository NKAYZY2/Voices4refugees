package models;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;

import models.User;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		boolean result;
		User user = new User();
		Admin admin = new Admin();

		boolean account_exists = false;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		String action = request.getParameter("action");

		if (action == null) {
			System.out.println("Thinks the action==null so redirecting to error page:");
			request.setAttribute("errorMessage", "Action is missing from the URL");
			response.sendRedirect("index.html");
			return;
		}

		if ((!(action == null)) && action.equals("login")) {

			System.out.println("in login servelet");
			user.setEmail(request.getParameter("Email"));
			user.setPassword(request.getParameter("password"));

			if (!user.getEmail().equals(admin.getAdminName())) {

				try {

					session.setAttribute("user", user);
					session.setAttribute("Email", user.getEmail());
					session.setAttribute("password", user.getPassword());

					account_exists = Sqlhelper2.AccountExists(session.getAttribute("Email").toString());

					if (account_exists == true) {

						boolean result_for_validation = Sqlhelper2.validate(session.getAttribute("Email").toString(),
								session.getAttribute("password").toString());

						System.out.println(result_for_validation);

						if (result_for_validation == true) {
							System.out.println(
									"now Printing session Email in memory which is:  " + session.getAttribute("Email"));

							System.out.println("now about to forward jsp page");

							response.sendRedirect("Login.jsp");

						} else if (result_for_validation == false) {
							response.setContentType("text/html");
							out.println("<script type=\"text/javascript\">");
							out.println("alert(' Wrong password! Please Check login credentials ');");
							out.println("</script>");
							out.println("<script>");
							out.println(" var timer = setTimeout(function() {");
							out.println("window.location='index.html'");
							out.print("window.location='index.html'},100)");
							out.println("</script>");
						}

					}

					if (account_exists == false) {
						response.setContentType("text/html");
						out.println("<script type=\"text/javascript\">");
						out.println("alert(' User does not exist. Cannot login  ');");
						out.println("</script>");
						out.println("<script>");
						out.println(" var timer = setTimeout(function() {");
						out.println("window.location='index.html'");
						out.print("window.location='index.html'},100)");
						out.println("</script>");
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block

					e.printStackTrace();
				}
			}
			if (admin.getAdminName().equals(request.getParameter("Email"))
					&& admin.getAdminPassword().equals(request.getParameter("password"))) {

				session.setAttribute("admin", admin);
				response.sendRedirect("Admin.jsp");

			}

			else if (admin.getAdminName().equals(request.getParameter("Email"))
					&& (!admin.getAdminPassword().equals(request.getParameter("password")))) {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert(' Wrong admin password, try again');");
				out.println("</script>");
				out.println("<script>");
				out.println(" var timer = setTimeout(function() {");
				out.println("window.location='index.html'");
				out.print("window.location='index.html'},100)");
				out.println("</script>");
			}

		}

		if (action.equals("logout"))

		{

			session.invalidate();
			System.out.println("session invalidated");
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Logged out successfully.');");
			out.println("</script>");
			out.println("<script>");
			out.println(" var timer = setTimeout(function() {");
			out.println("window.location='index.html'");
			out.print("window.location='index.html'},100)");
			out.println("</script>");
			return;
			// response.sendRedirect("index.html");
		}

		if (action.equals("signup")) {

			user.setFirstname(request.getParameter("firstname"));

			user.setLastname(request.getParameter("lastname"));

			user.setEmail(request.getParameter("Email"));

			user.setPassword(request.getParameter("password"));

			try {

				result = Sqlhelper2.AccountExists(user.getEmail());

				if (result == false) {
					Sqlhelper2.addAccount(user.getFirstname(), user.getLastname(), user.getEmail(),
							Sqlhelper2.encryptpassword(user.getPassword()));

					response.setContentType("text/html");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Account added successfully. Please write for rights ! ');");
					out.println("</script>");
					out.println("<script>");
					out.println(" var timer = setTimeout(function() {");
					out.println("window.location='index.html'");
					out.print("window.location='index.html'},100)");
					out.println("</script>");
					return;

				}

				else {
					response.setContentType("text/html");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('User account already exists, login or create account. ');");
					out.println("</script>");

					out.println("<script>");
					out.println(" var timer = setTimeout(function() {");
					out.println("window.location='index.html'");
					out.print("window.location='index.html'},300)");
					out.println("</script>");
					return;
				}

			} catch (ClassNotFoundException | SQLException e) {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert(' Error! Could not create account.');");
				out.println("</script>");

				out.println("<script>");
				out.println(" var timer = setTimeout(function() {");
				out.println("window.location='Error in Account creation '");
				out.print("window.location='index.html'},1100)");
				out.println("</script>");

				e.printStackTrace();
				return;
			}
		}

		if (action.equals("submitletter")) {
			System.out.println("in submit servlet now");

			// create a new letter object

			// give it case variables and set it per case

			// then pass in the letter object variables into the database.

			// so meaning if I am going to read back my letter stats.

			// I would have to pass the case quantities into a letter arraylist.

			System.out.println("gotten session submitting letter");

			String Case1 = request.getParameter("Case1");
			String Case2 = request.getParameter("Case2");
			String Case3 = request.getParameter("Case3");
			String Case4 = request.getParameter("Case4");
			String Case5 = request.getParameter("Case5");
			String Case6 = request.getParameter("Case6");
			String Case7 = request.getParameter("Case7");
			Integer value = null;

			if (Case1 != null) {

				try {

					value = Integer.parseInt(request.getParameter("quantity1"));

					Letter letter = new Letter(session.getAttribute("Email").toString(), Case1, value);

					user.setLetter(letter);

					Sqlhelper2.submitletter(user.getLetter());

				} catch (SQLException e) {
					// TODO Auto-generated catch block

					e.printStackTrace();
				}

			}
			if (Case2 != null) {

				try {

					value = Integer.parseInt(request.getParameter("quantity2"));

					Letter letter = new Letter(session.getAttribute("Email").toString(), Case2, value);
					user.setLetter(letter);

					Sqlhelper2.submitletter(user.getLetter());

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			if (Case3 != null) {

				try {

					value = Integer.parseInt(request.getParameter("quantity3"));

					Letter letter = new Letter(session.getAttribute("Email").toString(), Case3, value);
					user.setLetter(letter);
					Sqlhelper2.submitletter(user.getLetter());

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			if (Case4 != null) {

				try {

					value = Integer.parseInt(request.getParameter("quantity4"));

					Letter letter = new Letter(session.getAttribute("Email").toString(), Case4, value);
					user.setLetter(letter);

					Sqlhelper2.submitletter(user.getLetter());

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			if (Case5 != null) {

				try {

					value = Integer.parseInt(request.getParameter("quantity5"));

					Letter letter = new Letter(session.getAttribute("Email").toString(), Case5, value);

					user.setLetter(letter);

					Sqlhelper2.submitletter(user.getLetter());

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

			if (Case6 != null) {

				try {

					value = Integer.parseInt(request.getParameter("quantity6"));

					Letter letter = new Letter(session.getAttribute("Email").toString(), Case6, value);

					user.setLetter(letter);

					Sqlhelper2.submitletter(user.getLetter());

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

			if (Case7 != null) {

				try {

					value = Integer.parseInt(request.getParameter("quantity7"));

					Letter letter = new Letter(session.getAttribute("Email").toString(), Case7, value);

					user.setLetter(letter);

					Sqlhelper2.submitletter(user.getLetter());

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

			response.sendRedirect("Login.jsp");
			return;

		}

		if (action.equals("teacherPermission")) {

			String recipient = request.getParameter("recipient");

			final String fromEmail = "eastvoicesforrefugees@gapps.uwcsea.edu.sg"; // requires
																					// valid
																					// gmail
																					// id

			final String password = "googleeastvoicesforrefugees"; // correct
																	// password
																	// for gmail
			// id
			final String toEmail = recipient; // can be any Email id

			System.out.println("TLSEmail Start");
			Properties props = new Properties();

			props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
			props.put("mail.smtp.port", "587"); // TLS Port
			props.put("mail.smtp.auth", "true"); // enable authentication
			props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS

			// create Authenticator object to pass in Session.getInstance
			// argument
			Authenticator auth = new Authenticator() {
				// override the getPasswordAuthentication method
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
			};
			Session session2 = Session.getInstance(props, auth);

			user.sendEmail(session2, toEmail, "The Absence of your student today because of Write For Rights",
					"Your student: " + session.getAttribute("Email") + "@gapps.uwcsea.edu.sg"

							+ " would like to participate in the Write for Rights event, and seeks your permission to miss your class."+
							"We thank you for your support. If you would rather they attend your class, please reply as soon as possible"+ 
							"and they will ensure your student arrives at your lesson. ");

			// work on result display page for submission of teacher permission

			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Email sent successfully.');");
			out.println("</script>");
			out.println("<script>");
			out.println(" var timer = setTimeout(function() {");
			out.print("window.location='Login.jsp'},1500)");
			out.println("</script>");
			return;

		}

		if (action.equals("forgot_Password")) {
			boolean status_of_change = false;

			String New_password = Sqlhelper2.encryptpassword(request.getParameter("password").toString());
			String email_wanting_Change = request.getParameter("Email").toString();

			try {
				account_exists = Sqlhelper2.AccountExists(email_wanting_Change);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(("Error in finding whether account exists"));
				account_exists = false;
				e.printStackTrace();
			}

			try {
				status_of_change = Sqlhelper2.change_Password(account_exists, email_wanting_Change, New_password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (status_of_change == true) {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Changed password succesfully, you can login now !');");
				out.println("</script>");
				out.println("<script>");
				out.println(" var timer = setTimeout(function() {");
				out.println("window.location='index.html'");
				out.print("window.location='index.html'},300)");
				out.println("</script>");
				return;
			} else if (status_of_change == false) {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User account does not exist. Cannot change Password! ');");
				out.println("</script>");

				out.println("<script>");
				out.println(" var timer = setTimeout(function() {");
				out.println("window.location='index.html'");
				out.print("window.location='index.html'},300)");
				out.println("</script>");
				return;
			}

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}
}

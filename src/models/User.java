package models;

import java.util.Date;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class User {

	private String firstname;
	private String lastname;
	private String email;
	private String password;
	private Letter letter;

	String getPassword() {
		return password;
	}

	void setPassword(String password) {
		this.password = password;
	}

	String getLastname() {
		return lastname;
	}

	  void setLastname(String lastname) {
		this.lastname = lastname;
	}

	String getEmail() {
		return email;
	}

	void setEmail(String email) {
		this.email = email;
	}

	String getFirstname() {
		return firstname;
	}

	void setFirstname(String firstname) {
		this.firstname = firstname;
	}

 Letter getLetter() {
		return letter;
	}

	void setLetter(Letter letter) {
		this.letter = letter;
	}

	 void sendEmail(Session session, String toEmail, String subject, String body) {
		try {
			MimeMessage msg = new MimeMessage(session);
			// set message headers
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			msg.addHeader("format", "flowed");
			msg.addHeader("Content-Transfer-Encoding", "8bit");

			msg.setFrom(new InternetAddress("nyark75377@gapps.uwcsea.edu.sg", "Admin@ write for rights (NO-reply)"));

			msg.setReplyTo(InternetAddress.parse("nyark75377@gapps.uwcsea.edu.sg", false));

			msg.setSubject(subject, "UTF-8");

			msg.setText(body, "UTF-8");

			msg.setSentDate(new Date());

			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
			System.out.println("Message is ready");
			Transport.send(msg);

			System.out.println("EMail Sent Successfully!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 

}

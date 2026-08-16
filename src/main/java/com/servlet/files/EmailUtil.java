package com.servlet.files;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtil {

    public static void sendEmail(String to, String subject, String messageText) {
        // ✅ [CHANGED] Use your Gmail account only for authentication (not display)
        final String from = "sroshika04@gmail.com"; // Gmail used to send
        // ✅ [CHANGED] Use environment variable instead of hardcoding password
        final String password = System.getenv("MAIL_APP_PASSWORD"); // Set via OS/env, not in code

        // ✅ [ADDED] Check for missing environment variable
        if (password == null || password.isEmpty()) {
            throw new IllegalStateException("❌ MAIL_APP_PASSWORD environment variable not set!");
        }

        // ✅ [UNCHANGED] Gmail SMTP configuration
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // ✅ [UNCHANGED] Session setup with authentication
        Session session = Session.getInstance(props,
            new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from, password);
                }
            });

        // ✅ [ADDED] Enable debug logs for troubleshooting
        session.setDebug(true);

        try {
            Message msg = new MimeMessage(session);

            // ✅ [CHANGED] “From” email shown to users (looks more professional)
            msg.setFrom(new InternetAddress("no-reply@mywebsite.com", "My Web App"));

            // ✅ [UNCHANGED] Set recipient, subject, and body
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            msg.setSubject(subject);
            msg.setText(messageText);
            // Optional: For HTML email use:
            // msg.setContent(messageText, "text/html; charset=utf-8");

            // ✅ [UNCHANGED] Send the email
            Transport.send(msg);

            System.out.println("✅ Email sent successfully to: " + to);

        } catch (Exception e) {
            // ✅ [IMPROVED] Better error message
            System.err.println("❌ Email sending failed: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
package com.adn.enviarcorreos;

import java.util.Date;
import java.util.Properties;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class EnviarCorreo {
 
 public static void main(String[] args) {
  String servidorSMTP = "smtp.gmail.com";
  String puerto = "587";
  String usuario = "rbahena@10x.mx";
  String password = "RicardoBadizher7";
   
  String destino = "bahdiz@gmail.com";
  String asunto = "Prueba!";
  String mensaje = "Este es un mensaje de prueba. Tres";
 
  Properties props = new Properties();
 
  props.put("mail.debug", "true");
  props.put("mail.smtp.auth", true);
  props.put("mail.smtp.starttls.enable", true);
  props.put("mail.smtp.host", servidorSMTP);
  props.put("mail.smtp.port", puerto);
 
  Session session = Session.getInstance(props, null);
 
  try {
   MimeMessage message = new MimeMessage(session);
   message.addRecipient(Message.RecipientType.TO, new InternetAddress(
     destino));
   message.setSubject(asunto);
   message.setSentDate(new Date());
   message.setText(mensaje);
    
   Transport tr = session.getTransport("smtp");
   tr.connect(servidorSMTP, usuario, password);
   message.saveChanges();   
   tr.sendMessage(message, message.getAllRecipients());
   tr.close();
   System.out.print("E-mail enviado");
    
  } catch (MessagingException e) {
	  System.out.print("Algo salio mal");
   e.printStackTrace();
  }
 }
}
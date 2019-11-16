package coma;
import javax.mail.Authenticator;

import javax.mail.PasswordAuthentication;
public class Gmail extends Authenticator {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("service.coma12@gmail.com","comaservice12!");
    }
}
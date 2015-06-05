package model;

import javax.persistence.Entity;
import java.util.Date;

@Entity
public class Administrator extends User {

    public Administrator() {
    }

    public Administrator(String firstname, String lastname, Date birthDate, Address address, String email, String password) {
        super(firstname, lastname, birthDate, address, email, password);
    }

    public boolean checkPassword(String password) {
        return this.password.equals(password);
    }
}
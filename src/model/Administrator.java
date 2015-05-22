package model;

import javax.persistence.Entity;
import java.util.Date;

@Entity
public class Administrator extends User {

    public Administrator(String name, String lastname, Date birthDate, String email, Address address) {
        super(name, lastname, birthDate, email, address);
    }

    public Administrator() {
    }
}
package model;

import javax.persistence.*;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

@MappedSuperclass //da provare e vedere effetti
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    @Column(nullable = false)
    private String firstname;

    @Column(nullable = false)
    private String lastname;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date birthDate;

    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Calendar registrationDate;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    protected String password;  //da sistemare

    @OneToOne(cascade = {CascadeType.PERSIST})
    @Column(nullable = true)
    private Address address;

    public User(String name, String lastname, Date birthDate, Address address, String email, String password) {
        this.firstname = name;
        this.lastname = lastname;
        this.birthDate = birthDate;
        this.address = address;
        this.email = email;
        this.password = password;
        this.registrationDate = Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome"));
    }

    public User() {
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String name) {
        this.firstname = name;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Calendar getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Calendar registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        if (birthDate != null ? !birthDate.equals(user.birthDate) : user.birthDate != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (lastname != null ? !lastname.equals(user.lastname) : user.lastname != null) return false;
        if (firstname != null ? !firstname.equals(user.firstname) : user.firstname != null) return false;
        if (registrationDate != null ? !registrationDate.equals(user.registrationDate) : user.registrationDate != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = firstname != null ? firstname.hashCode() : 0;
        result = 31 * result + (lastname != null ? lastname.hashCode() : 0);
        result = 31 * result + (birthDate != null ? birthDate.hashCode() : 0);
        result = 31 * result + (registrationDate != null ? registrationDate.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", birthDate=" + birthDate +
                ", registrationDate=" + registrationDate +
                ", email='" + email + '\'' +
                '}';
    }
}
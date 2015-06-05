package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Date;

@Stateless(name = "adminfacade")
public class AdministratorFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public AdministratorFacade(){

    }

    public Administrator createAdministrator(String firstname, String lastname, Date birthDate, String email, String password,
                                             String street, String city, String state, Long zipcode){
        Address address = new Address(street, city, state, zipcode);
        em.persist(address);
        Administrator administrator = new Administrator(firstname, lastname, birthDate, address, email, password);
        em.persist(administrator);
        return administrator;
    }

    public Administrator getAdministratorByEmail(String email) {
        Query q = em.createQuery("SELECT a FROM Administrator a WHERE a.email = :email");
        q.setParameter("email", email);
        Administrator administrator = (Administrator) q.getSingleResult();
        return administrator;
    }

    private void deleteAdministrator(Administrator administrator) {
        em.remove(administrator);
    }

    public void deleteAdministrator(Long id) {
        Administrator administrator = em.find(Administrator.class, id);
        deleteAdministrator(administrator);
    }

}

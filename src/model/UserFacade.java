package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;

/**
 * Created by Gianluca on 25/05/15.
 */

@Stateless(name = "userfacade")
public class UserFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public UserFacade(){};

    public User createUser(String name, String lastname, Date birthDate, String email, Address address){

    }
}

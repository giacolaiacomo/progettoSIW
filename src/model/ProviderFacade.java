package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Fabio on 24/05/15.
 */
@Stateless(name = "provfacade")
public class ProviderFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public Provider createProvider(List<Product> providedProducts, String vatin, String phoneNumber, Address address, String email){
        Provider provider = new Provider(providedProducts, vatin, phoneNumber, address, email);
        if (address != null)
            provider.setAddress(address);
        em.persist(provider);
        return provider;
    }

}

package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("products-unit");
        EntityManager em = emf.createEntityManager();

        /*Product product = new Product();
        product.setName("KRIDDIG");
        product.setPrice(3.5F);
        product.setDescription("A wonderful bla bla");*/

        Address address= new Address();
        address.setCity("Roma");
        address.setCountry("ITA");
        address.setState("EU");
        address.setStreet("Via del Corso, 1");
        address.setZipcode(new Long(00100));

        Address address2= new Address();
        address2.setCity("Roma");
        address2.setCountry("ITA");
        address2.setState("EU");
        address2.setStreet("Via del Corso, 1");
        address2.setZipcode(new Long(00100));

        Address address3= new Address();
        address3.setCity("Roma");
        address3.setCountry("ITA");
        address3.setState("EU");
        address3.setStreet("Via del Corso, 1");
        address3.setZipcode(new Long(00100));




        /*EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(product);
        em.persist(provider);
        em.persist(customer);
        tx.commit();*/


        CustomerFacade cfacade = new CustomerFacade(em, emf);
        Customer c1 = cfacade.createCustomer("Fabio", "Merda", "fabiom@aaa.it", new Long(2222), new Date(), address2);
        Customer c2 = cfacade.createCustomer("Gabriele", "NonTeSoppportoPiù", "gabrielentsp@aaa.it", new Long(666), new Date(), address3);
        Orders o1 = cfacade.createOrders(new Date(), c2);

        ProductFacade pfacade = new ProductFacade(em, emf);
        Product product=pfacade.createProduct("Intel", "ahahahahah", new Float(22223), "FabioMerda");

        List<Product> l= new ArrayList<Product>();
        l.add(product);

        Provider provider = new Provider("Provider 1", new Long(3), "aaaa@a.it", "vatin", address3, l );
        Provider provider2 = new Provider("Provider 2222", new Long(3), "aaaa@a.it", "vatin", address3, l );


        pfacade.setProvider(provider, product);
        pfacade.setProvider(provider2, product);

        Customer customer = new Customer("Mario", "Rossi", "mariorossi@aaa.it", new Long(2), new Date(), new Date(), address);

        for (Customer cus : cfacade.getCustomerAll()) System.out.println(cus.toString());
        for (Orders ord : cfacade.getOrdersCustomer(new Long(2))) System.out.println(ord.toString());
        for (Provider p: pfacade.retrieveProviders(new Long(151))) System.out.println(p.toString());

        em.close();
        emf.close();
    }
}

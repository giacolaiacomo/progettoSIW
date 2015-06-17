package controller;

import java.util.LinkedList;
import java.util.List;
import model.Product;
import model.ProductFacade;
import model.Provider;
import model.ProviderFacade;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class ProductController {
	

	private Long id;
	private String name;
	private Float price;
	private String description;
	private String code;
	private int quantity;
	private Product product;
	private List<String> providernames;
	private List<Provider> providers;

	private List<Product> products;

	@EJB(beanName = "provfacade")
	private ProviderFacade providerFacade;

	@EJB(beanName = "prodfacade")
	private ProductFacade productFacade;
	
	public String createProduct() {
		this.providers = new LinkedList<Provider>();
		for(String a: this.providernames){
			Provider p = this.providerFacade.getProviderByEmail(a);
			this.providers.add(p);
		}
		this.product = productFacade.createProduct(name, code, price, description, quantity, providers);
        if (product != null)
		    return "product";
        else
            return "errorProduct";
	}

	public String updateProduct() {
		productFacade.updateProduct(this.product);
		return "product";
	}
	
	public String listProducts() {
		this.products = productFacade.getAllProducts();
		return "products"; 
	}

	public String findProduct() {
		this.product = productFacade.getProduct(id);
		return "product";
	}

	public String findProductByName(String name){
		this.product = productFacade.getProductByName(name);
		if (product != null)
			return "product";
		else
			return "indexUser";
	}
	
	public String findProduct(Long id) {
		this.product = productFacade.getProduct(id);
		return "product";
	}

	/* Getter & Setter */

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public List<String> getProvidernames() {
		return providernames;
	}

	public void setProvidernames(List<String> providernames) {
		this.providernames = providernames;
	}

	public ProductFacade getProductFacade() {
		return productFacade;
	}

	public void setProductFacade(ProductFacade productFacade) {
		this.productFacade = productFacade;
	}

	public List<Provider> getProviders() {
		return providers;
	}

	public void setProviders(List<Provider> providers) {
		this.providers = providers;
	}

	public ProviderFacade getProviderFacade() {
		return providerFacade;
	}

	public void setProviderFacade(ProviderFacade providerFacade) {
		this.providerFacade = providerFacade;
	}
}



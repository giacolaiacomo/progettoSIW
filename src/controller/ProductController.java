package controller;

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
	private String providername;

	private List<Product> products;

	@EJB(beanName = "prodfacade")
	private ProductFacade productFacade;

    @EJB(beanName = "provfacade")
    private ProviderFacade providerFacade;

	public String createProduct() {
		this.product = productFacade.createProduct(name, code, price, description, quantity, providername);
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

	public String addProvider(){
        Provider provider = this.providerFacade.getProviderByName(this.providername);
        if (provider != null) {
            this.product.addProvider(provider);
            productFacade.updateProduct(this.product);
            providerFacade.updateProvider(provider);
            return "okProvider";
        } else
            return "errorProvider";
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

	public String getProvidername() {
		return providername;
	}

	public void setProvidername(String providername) {
		this.providername = providername;
	}

	public ProductFacade getProductFacade() {
		return productFacade;
	}

	public void setProductFacade(ProductFacade productFacade) {
		this.productFacade = productFacade;
	}
}



package market.service.impl;

import market.model.Product;
import market.service.IProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {

    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "SP001", "Áo Phông", "Helmet", 1000, "Áo xịn"));
        products.put(2, new Product(2, "SP002", "Túi xách", "Channel", 10000, "Túi xịn"));
        products.put(3, new Product(3, "SP003", "Áo mưa", "King Kong", 10, "Áo xịn"));
        products.put(4, new Product(4, "SP004", "Balo", "Apple", 100, "Balo xịn"));
        products.put(5, new Product(5, "SP005", "Macbook", "Apple", 5000, "Laptop xịn"));
        products.put(6, new Product(6, "SP006", "Bánh trung thu", "Như Lan", 10, " Bánh ngon"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public String showInfo(int id) {
        return products.get(id).getProductInfo();
    }

    public Product findByName(String name) {
        Product product = new Product();
        if (product.getProductName().equals(name)){

        }
        return product;
    }
}

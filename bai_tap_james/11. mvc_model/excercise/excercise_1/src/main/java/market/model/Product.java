package market.model;

public class Product {
    private int id;
    private String productCode;
    private String productName;
    private String manufacturer;
    private int price;
    private String productInfo;

    public Product() {
    }

    public Product(int id,
                   String productCode,
                   String productName,
                   String manufacturer,
                   int price,
                   String productInfo) {
        this.id = id;
        this.productCode = productCode;
        this.productName = productName;
        this.manufacturer = manufacturer;
        this.price = price;
        this.productInfo = productInfo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(String productInfo) {
        this.productInfo = productInfo;
    }
}

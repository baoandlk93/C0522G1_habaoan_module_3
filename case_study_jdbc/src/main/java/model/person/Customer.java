package model.person;


public class Customer extends Person {
    private String customerCode;
    private String customerType;
    private String customerAddress;

    public Customer() {
    }

    public Customer(String customerCode,
                    String name,
                    String dateOfBirth,
                    String gender,
                    long id,
                    long phoneNumber,
                    String email,
                    String customerType,
                    String customerAddress) {
        super(name, dateOfBirth, gender, id, phoneNumber, email);
        this.customerCode = customerCode;
        this.customerType = customerType;
        this.customerAddress = customerAddress;
    }

    public Customer(String name, String dateOfBirth, String gender,long phoneNumber, String email, String customerCode, String customerType, String customerAddress) {
        super(name, dateOfBirth, gender,phoneNumber, email);
        this.customerCode = customerCode;
        this.customerType = customerType;
        this.customerAddress = customerAddress;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

}

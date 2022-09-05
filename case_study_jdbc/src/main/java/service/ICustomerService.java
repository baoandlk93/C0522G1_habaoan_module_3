package service;

import model.person.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> displayAll();

    boolean delete(int id);

    boolean add(Customer customer);

    boolean edit(Customer customer);

    Customer selectByID(int id);

}

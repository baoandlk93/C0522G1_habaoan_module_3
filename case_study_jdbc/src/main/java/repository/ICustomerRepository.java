package repository;

import model.person.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> displayAll();

    boolean add(Customer customer);

    boolean edit(Customer customer);

    boolean delete(int id);

    Customer selectCustomer(int id);
}

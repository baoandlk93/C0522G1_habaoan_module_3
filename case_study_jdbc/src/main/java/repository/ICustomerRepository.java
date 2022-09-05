package repository;

import model.person.Customer;

import java.util.List;

public interface ICustomerRepository {

    List<Customer> displayAll();

    boolean delete(int id);

    boolean add(Customer customer);

    boolean edit(Customer customer);

     Customer selectByID(int id);

}

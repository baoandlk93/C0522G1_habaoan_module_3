package service;

import model.person.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> displayAll() {
        return customerRepository.displayAll();
    }
}

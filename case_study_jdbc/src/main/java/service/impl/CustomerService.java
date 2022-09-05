package service.impl;

import model.person.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> displayAll() {
        return customerRepository.displayAll();
    }

    @Override
    public boolean delete(int id) {
        return customerRepository.delete(id);
    }

    @Override
    public boolean add(Customer customer) {
        return customerRepository.add(customer);
    }

    @Override
    public boolean edit(Customer customer) {
        return customerRepository.edit(customer);
    }

    @Override
    public Customer selectByID(int id) {
        return customerRepository.selectByID(id);
    }
}

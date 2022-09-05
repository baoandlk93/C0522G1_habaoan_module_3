package repository;

import model.person.Customer;
import model.person.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {
    List<CustomerType> findAll();


}

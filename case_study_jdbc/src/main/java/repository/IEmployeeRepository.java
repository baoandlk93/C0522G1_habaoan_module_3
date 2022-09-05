package repository;

import model.person.Customer;
import model.person.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();
    boolean delete(int id);

    boolean add(Employee employee);

    boolean edit(Employee employee);

    Employee selectByID(int id);

}

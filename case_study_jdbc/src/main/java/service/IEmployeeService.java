package service;

import model.person.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();
    boolean delete(int id);

    boolean add(Employee employee);

    boolean edit(Employee employee);

    Employee selectByID(int id);
}

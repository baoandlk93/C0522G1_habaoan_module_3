package repository.impl;

import model.person.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL = "select * from customer";

    @Override
    public List<Customer> displayAll() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement pr = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                String code = resultSet.getString("customerCode");
                String name = resultSet.getString("name");
                String dateOfBirth = resultSet.getString("dateOfBirth");
                String gender = resultSet.getString("gender");
                long phoneNumber = resultSet.getLong("phoneNumber");
                String email = resultSet.getString("email");
                String customerType = resultSet.getString("customerType");
                String customerAddress = resultSet.getString("customerAddress");
                Customer customer = new Customer(name,dateOfBirth,gender,phoneNumber,email,code,customerType,customerAddress);
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public boolean add(Customer customer) {
        return false;
    }

    @Override
    public boolean edit(Customer customer) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public Customer selectCustomer(int id) {
        return null;
    }
}

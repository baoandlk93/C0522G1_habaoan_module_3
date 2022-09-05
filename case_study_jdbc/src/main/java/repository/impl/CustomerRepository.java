package repository.impl;


import model.person.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String UPDATE_USERS_SQL = "update customer set name = ?, set date_of_birth = ?, set gender = ?,set id_card = ?, set phone_number = ?, set email = ?, set address = ?,set customer_type_id = ? where id = ? ";
    private static final String SELECT_ALL = "select * from customer where is_delete = 0;";
    private static final String DELETE = "update customer set is_delete = 1 where id = ?;";
    private static final String SELECT_BY_ID = "select * from customer where id = ?";
    private static final String INSERT = "INSERT INTO customer (name, gender, date_of_birth, id_card, phone_number, email, address,customer_type_id) VALUES(?, ?, ?, ?, ?,?, ?, ?)";


    @Override
    public List<Customer> displayAll() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String dayOfBirth = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String customerAddress = resultSet.getString("address");
                int customerTypeID = resultSet.getInt("customer_type_id");
                Customer customer = new Customer(id, name, dayOfBirth, gender, idCard, phoneNumber, email, customerAddress, customerTypeID);
                customers.add(customer);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customers;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        boolean rowDeleted;
        try {
            PreparedStatement statement = connection.prepareStatement(DELETE);
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
            return rowDeleted;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT);
            statement.setString(1, customer.getName());
            statement.setBoolean(2, customer.isGender());
            statement.setString(3, customer.getDateOfBirth());
            statement.setString(4, customer.getIdCard());
            statement.setString(5, customer.getPhoneNumber());
            statement.setString(6, customer.getEmail());
            statement.setString(7, customer.getCustomerAddress());
            statement.setInt(8, customer.getCustomerTypeID());
            int num = statement.executeUpdate();
            return num == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean edit(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        boolean rowUpdated;
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);
            statement.setString(1, customer.getName());
            statement.setBoolean(2, customer.isGender());
            statement.setString(3, customer.getDateOfBirth());
            statement.setString(4, customer.getIdCard());
            statement.setString(5, customer.getPhoneNumber());
            statement.setString(6, customer.getEmail());
            statement.setString(7, customer.getCustomerAddress());
            statement.setInt(8, customer.getCustomerTypeID());
            statement.setInt(9, customer.getId());
            rowUpdated = statement.executeUpdate() > 0;
            return rowUpdated;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer selectByID(int id) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String dayOfBirth = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String customerAddress = resultSet.getString("address");
                int customerTypeID = resultSet.getInt("customer_type_id");
                customer = new Customer(name,dayOfBirth,gender,idCard,phoneNumber,email,customerAddress,customerTypeID);
            }
            return customer;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }


}

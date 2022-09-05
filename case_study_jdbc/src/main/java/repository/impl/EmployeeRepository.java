package repository.impl;

import model.person.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private final String SELECT_ALL = "select * from employee where is_delete = 0";
    private static final String UPDATE = "update employee set name = ?, set date_of_birth = ?, set id_card = ?, set phone_number = ?, set email = ?, set address = ?,set position_id = ?,set education_degree_id = ?, set division_id = ?,set user_name = ?, set salary = ? where id = ? ";
    private static final String DELETE = "update employee set is_delete = 1 where id = ?;";
    private static final String SELECT_BY_ID = "select * from employee where id = ?";
    private static final String INSERT = "INSERT INTO employee (name, date_of_birth, id_card, phone_number, email, address,position_id,education_degree_id,division_id,salary) VALUES( ?, ?, ?, ?,?, ?, ?,?,?,?)";

    @Override
    public List<Employee> findAll() {
        List<Employee> employees = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                int id = set.getInt("id");
                String name = set.getString("name");
                String dayOfBirth = set.getString("date_of_birth");
                String idCard = set.getString("id_card");
                double salary = set.getDouble("salary");
                String phoneNumber = set.getString("phone_number");
                String email = set.getString("email");
                String address = set.getString("address");
                int positionID = set.getInt("position_id");
                int educationDegreeID = set.getInt("education_degree_id");
                int divisionID = set.getInt("division_id");
                String userName = set.getString("user_name");
                Employee employee = new Employee(id, name, dayOfBirth, idCard, phoneNumber, email, address,
                        positionID, educationDegreeID, divisionID, salary, userName);
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
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
    public boolean add(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT);
            statement.setString(1, employee.getName());
            statement.setString(2, employee.getDayOfBirth());
            statement.setString(3, employee.getIdCard());
            statement.setString(4, employee.getPhoneNumber());
            statement.setString(5, employee.getEmail());
            statement.setString(6, employee.getEmployeeAddress());
            statement.setInt(7, employee.getPosition());
            statement.setInt(8, employee.getEducationDegreeID());
            statement.setInt(9, employee.getDivisionID());
            statement.setDouble(10, employee.getSalary());
            int num = statement.executeUpdate();
            return num == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean edit(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        boolean rowUpdated;
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE);
            statement.setString(1, employee.getName());
            statement.setString(2, employee.getDayOfBirth());
            statement.setString(3, employee.getIdCard());
            statement.setString(4, employee.getPhoneNumber());
            statement.setString(5, employee.getEmail());
            statement.setString(6, employee.getEmployeeAddress());
            statement.setInt(7, employee.getPosition());
            statement.setInt(8, employee.getEducationDegreeID());
            statement.setInt(9, employee.getDivisionID());
            statement.setDouble(10, employee.getSalary());
            statement.setInt(11, employee.getId());
            rowUpdated = statement.executeUpdate() > 0;
            return rowUpdated;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Employee selectByID(int id) {
        Employee employee = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_ID);
            statement.setInt(1,id);
            ResultSet set = statement.executeQuery();
            while (set.next()){
                String name = set.getString("name");
                String dayOfBirth = set.getString("date_of_birth");
                String idCard = set.getString("id_card");
                String phoneNumber = set.getString("phone_number");
                String email = set.getString("email");
                String address = set.getString("address");
                int positionId = Integer.parseInt(set.getString("position_id"));
                int educationDegreeId = Integer.parseInt(set.getString("education_degree_id"));
                int divisionId = Integer.parseInt(set.getString("division_id"));
                double salary = Double.parseDouble(set.getString("salary"));
                employee = new Employee(name,dayOfBirth,idCard,phoneNumber,email,address,positionId,educationDegreeId,divisionId,salary);
            }
            return employee;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

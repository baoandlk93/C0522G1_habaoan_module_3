package repository.impl;

import model.Contract;
import repository.BaseRepository;
import repository.IContractRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ContractRepository implements IContractRepository {
    private static final String SELECT = "select * from contract where is_delete = 0;";
    private static final String DELETE = "update contract set is_delete = 1 where id = ?;";
    private static final String UPDATE = "update contract set start_date = ?, end_date = ?, deposit = ?,employee_id = ?, customer_id = ?, facility_id= ?,  where is_delete =0 and id = ?;";
    private static final String SELECT_BY_ID = "select * from contract where is_delete =0 and id = ?;";
    private static final String INSERT = "insert into contract(start_date,end_date,deposit,employee_id,customer_id,facility_id) values(?,?,?,?,?,?); ";

    @Override
    public Map<Integer, Contract> display() {
        Map<Integer,Contract> contractMap = new HashMap<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT);
            ResultSet set = statement.executeQuery();
            while (set.next()){
                int id = set.getInt("id");
                Date startDay = set.getDate("start_date");
                Date endDay = set.getDate("end_date");
                double deposit = set.getDouble("deposit");
                int employeeID = set.getInt("employee_id");
                int customerID = set.getInt("customer_id");
                int facilityID = set.getInt("facility_id");
                Contract contract = new Contract(id,startDay,endDay,deposit,employeeID,customerID,facilityID);
                contractMap.put(id,contract);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return contractMap;
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


}

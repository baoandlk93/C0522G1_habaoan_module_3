package repository;

import model.Contract;

import java.util.Map;

public interface IContractRepository {
    Map<Integer, Contract> display();

    boolean delete(int id);
}

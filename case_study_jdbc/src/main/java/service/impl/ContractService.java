package service.impl;

import model.Contract;
import repository.IContractRepository;
import repository.impl.ContractRepository;
import service.IContractService;

import java.util.Map;

public class ContractService implements IContractService<Contract> {
    IContractRepository repository = new ContractRepository();
    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(Contract element) {
        return false;
    }

    @Override
    public boolean insert(Contract element) {
        return false;
    }

    @Override
    public Map<Integer, Contract> findAll() {
        return repository.display();
    }

    @Override
    public Contract findByID(int id) {
        return null;
    }
}

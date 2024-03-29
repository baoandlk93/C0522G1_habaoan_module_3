package service;

public interface IContractService<T> extends IService<T> {
    boolean delete(int id);

    boolean update(T element);

    boolean insert(T element);
}
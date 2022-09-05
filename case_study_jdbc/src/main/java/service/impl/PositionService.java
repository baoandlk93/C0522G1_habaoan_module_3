package service.impl;

import model.person.Position;
import repository.IPositionRepository;
import repository.impl.PositionRepository;
import service.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    IPositionRepository positionRepository = new PositionRepository();
    @Override
    public List<Position> displayAll() {
        return positionRepository.displayAll();
    }
}

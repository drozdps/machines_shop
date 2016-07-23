package by.eftech.webapp.service;


import by.eftech.webapp.model.Machine;
import by.eftech.webapp.model.Select;

import java.util.List;

public interface MachineService {
    void save(Machine machine);
    void delete(int id);
    Machine get(int id);
    void update(Machine machine);
    List<Machine> getAll();
    public List<String> getMachineManufacturers();
    public List<String> getMachineLocations();
	List<Machine> getListMachine(Select s);

}

package by.eftech.webapp.model;

import java.util.HashMap;

public class Select {
	HashMap<String,Integer> mapMachineManufacturers;
	HashMap<String,Integer> mapMachineLocations;
	public void setMapMachineManufacturers(HashMap<String,Integer> mapMachineManufacturers){
		this.mapMachineManufacturers=mapMachineManufacturers;
	}
	public HashMap<String,Integer> getMapMachineManufacturers(){
		return mapMachineManufacturers;
	}
	public void setMapMachineLocations(HashMap<String,Integer> mapMachineLocations){
		this.mapMachineLocations=mapMachineLocations;
	}
	public HashMap<String,Integer> getMapMachineLocations(){
		return mapMachineLocations;
	}
}


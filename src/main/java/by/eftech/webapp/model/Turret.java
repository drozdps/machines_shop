package by.eftech.webapp.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "turret")
public class Turret extends BaseEntity implements Serializable{

    @Column(name = "max_diam")
    protected Float maxDiam;

    @Column(name = "frequency")
    protected  Integer frequency;

    @Column(name = "rot_speed")
    protected Integer rotSpeed;

    @Column(name = "stations_num")
    protected Integer stationsNum;

    @Column(name = "axis_num")
    protected Integer axisNum;
    @Column(name = "index_station_max_diam")
    protected Integer indexStationMaxDiam;

   
    public Turret(Float maxDiam, Integer frequency,Integer rotSpeed,Integer stationsNum,Integer axisNum,Integer indexStationMaxDiam ) {
        this.maxDiam = maxDiam;
        this.frequency = frequency;
        this.rotSpeed = rotSpeed;
        this.stationsNum = stationsNum;
        this.axisNum = axisNum;
        this.indexStationMaxDiam = indexStationMaxDiam;      
    }

    public Turret(Integer id,Float maxDiam, Integer frequency,Integer rotSpeed,Integer stationsNum,Integer axisNum,Integer indexStationMaxDiam ) {
        super(id);
        this.maxDiam = maxDiam;
        this.frequency = frequency;
        this.rotSpeed = rotSpeed;
        this.stationsNum = stationsNum;
        this.axisNum = axisNum;
        this.indexStationMaxDiam = indexStationMaxDiam;      
    }

    public Turret() {
        
    }

	public Float getMaxDiam() {
		return maxDiam;
	}

	public void setMaxDiam(Float maxDiam) {
		this.maxDiam = maxDiam;
	}

	public Integer getFrequency() {
		return frequency;
	}

	public void setFrequency(Integer frequency) {
		this.frequency = frequency;
	}

	public Integer getRotSpeed() {
		return rotSpeed;
	}

	public void setRotSpeed(Integer rotSpeed) {
		this.rotSpeed = rotSpeed;
	}

	public Integer getStationsNum() {
		return stationsNum;
	}

	public void setStationsNum(Integer stationsNum) {
		this.stationsNum = stationsNum;
	}

	public Integer getAxisNum() {
		return axisNum;
	}

	public void setAxisNum(Integer axisNum) {
		this.axisNum = axisNum;
	}

	public Integer getIndexStationMaxDiam() {
		return indexStationMaxDiam;
	}

	public void setIndexStationMaxDiam(Integer indexStationMaxDiam) {
		this.indexStationMaxDiam = indexStationMaxDiam;
	}
    
}

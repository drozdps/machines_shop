package by.eftech.webapp.model;


import org.hibernate.Hibernate;
import org.hibernate.validator.constraints.NotEmpty;
import javax.persistence.*;
import javax.transaction.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "machine")
public class Machine extends BaseEntity implements Serializable {
	@Column(name = "product_id")
    @NotEmpty
	private String product_id;
	@Column(name = "machine_type")
	private String machine_type;
	@Column(name = "model")
	private String model;
	@Column(name = "manufacturer")
	private String manufacturer;
	@Column(name = "country")
	private String country;
	@Column(name = "y")
	private Integer year;
	@Column(name = "price")
	private Integer price;
	@Column(name = "cond")
	private String condition;
	@Column(name = "location")
	private String location;
	@Column(name = "punch_force")
	private Float punch_force;
	@Column(name = "x_move")
	private Float x_move;
	@Column(name = "y_move")
	private Float y_move;
	@Column(name = "max_speed")
	private Integer max_speed;
	@Column(name = "pos_accuracy")
	private String pos_accuracy;
	@Column(name = "voltage")
	private Integer voltage;
	@Column(name = "air_compress")
	private Integer air_compress;
	@Column(name = "dimensions")
	private String dimensions;
	@Column(name = "weight")
	private Integer weight;
	@Column(name = "description")
	private String description;
	@Column(name = "stand_descr")
	private String stand_descr;
	@Column(name = "instr_descr")
	private String instr_descr;
	
	
	@ManyToMany(fetch = FetchType.LAZY,targetEntity=Photo.class, cascade = CascadeType.ALL)
    @JoinTable(name = "machine_has_photo",catalog="machine", joinColumns = {
    		@JoinColumn(name = "machine_id",referencedColumnName="id", nullable=false,updatable=false)},
            inverseJoinColumns = {@JoinColumn(name = "photo_id",referencedColumnName="id")})
	protected List<Photo> photo = new ArrayList<Photo>(0);

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "list_id")
    protected by.eftech.webapp.model.List list;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "cnc_id")
    protected Cnc cnc;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "turret_id")
    protected Turret turret;

    public List<Photo> getPhoto() {
    	
    	Hibernate.initialize(photo);
        return photo;
    }

    public void setPhoto(List<Photo> photo) {
        this.photo = photo;
    }
    public Machine() {
    }

    public Machine(
    	    String product_id,String   machine_type,String   model,String    manufacturer,String   country,Integer    year,
    		String condition,String	location,Float 	punch_force,Float	x_move,Float	y_move,Integer	max_speed,String	pos_accuracy,
    		Integer voltage,Integer	air_compress,String	dimensions, Integer	weight,String	description,String	stand_descr,
    		String instr_descr,List<Photo>	photo,by.eftech.webapp.model.List	list,Cnc	cnc,Turret	turret,Integer price
    	                      ) {
    	        
    	        this.product_id=product_id;
    	        this.machine_type=machine_type;
    	        this.model=model;
    	        this.manufacturer=manufacturer;
    	        this.country=country;
    	        this.year=year;
    	    	this.condition=condition;
    	    	this.location=location;
    	    	this.punch_force=punch_force;
    	    	this.x_move=x_move;
    	    	this.y_move=y_move;
    	    	this.max_speed=max_speed;
    	    	this.pos_accuracy=pos_accuracy;
    	    	this.voltage=voltage;
    	    	this.air_compress=air_compress;
    	    	this.dimensions=dimensions;
    	    	this.weight=weight;
    	    	this.description=description;
    	    	this.stand_descr=stand_descr;
    	    	this.instr_descr=instr_descr;
    	    	this.photo=photo;
    	    	this.list=list;
    	    	this.cnc=cnc;
    	    	this.turret=turret;
    	    	this.price = price;
    	       
    	    }

    public Machine(Integer id,
    String product_id,String   machine_type,String   model,String    manufacturer,String   country,Integer    year,
	String condition,String	location,Float 	punch_force,Float	x_move,Float	y_move,Integer	max_speed,String	pos_accuracy,
	Integer voltage,Integer	air_compress,String	dimensions, Integer	weight,String	description,String	stand_descr,
	String instr_descr,List<Photo>	photo,by.eftech.webapp.model.List	list,Cnc	cnc,Turret	turret,Integer price
                      ) {
        super(id);
        this.product_id=product_id;
        this.machine_type=machine_type;
        this.model=model;
        this.manufacturer=manufacturer;
        this.country=country;
        this.year=year;
    	this.condition=condition;
    	this.location=location;
    	this.punch_force=punch_force;
    	this.x_move=x_move;
    	this.y_move=y_move;
    	this.max_speed=max_speed;
    	this.pos_accuracy=pos_accuracy;
    	this.voltage=voltage;
    	this.air_compress=air_compress;
    	this.dimensions=dimensions;
    	this.weight=weight;
    	this.description=description;
    	this.stand_descr=stand_descr;
    	this.instr_descr=instr_descr;
    	this.photo=photo;
    	this.list=list;
    	this.cnc=cnc;
    	this.turret=turret;
    	this.price = price;
       
    }

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getMachine_type() {
		return machine_type;
	}

	public void setMachine_type(String machine_type) {
		this.machine_type = machine_type;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Float getPunch_force() {
		return punch_force;
	}

	public void setPunch_force(Float punch_force) {
		this.punch_force = punch_force;
	}

	public Float getX_move() {
		return x_move;
	}

	public void setX_move(Float x_move) {
		this.x_move = x_move;
	}

	public Float getY_move() {
		return y_move;
	}

	public void setY_move(Float y_move) {
		this.y_move = y_move;
	}

	public Integer getMax_speed() {
		return max_speed;
	}

	public void setMax_speed(Integer max_speed) {
		this.max_speed = max_speed;
	}

	public String getPos_accuracy() {
		return pos_accuracy;
	}

	public void setPos_accuracy(String pos_accuracy) {
		this.pos_accuracy = pos_accuracy;
	}

	public Integer getVoltage() {
		return voltage;
	}

	public void setVoltage(Integer voltage) {
		this.voltage = voltage;
	}

	public Integer getAir_compress() {
		return air_compress;
	}

	public void setAir_compress(Integer air_compress) {
		this.air_compress = air_compress;
	}

	public String getDimensions() {
		return dimensions;
	}

	public void setDimensions(String dimensions) {
		this.dimensions = dimensions;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStand_descr() {
		return stand_descr;
	}

	public void setStand_descr(String stand_descr) {
		this.stand_descr = stand_descr;
	}

	public String getInstr_descr() {
		return instr_descr;
	}

	public void setInstr_descr(String instr_descr) {
		this.instr_descr = instr_descr;
	}

	public by.eftech.webapp.model.List getList() {
		return list;
	}

	public void setList(by.eftech.webapp.model.List list) {
		this.list = list;
	}

	public Cnc getCnc() {
		return cnc;
	}

	public void setCnc(Cnc cnc) {
		this.cnc = cnc;
	}

	public Turret getTurret() {
		return turret;
	}

	public void setTurret(Turret turret) {
		this.turret = turret;
	}
	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	  @Override
	    public boolean equals(Object object)
	    {
	        return object != null
	            && object.getClass().equals(this.getClass())
	            && ((Machine) object).getId().equals(this.id);
	    }
/*
	    @Override
	    public int hashCode()
	    {
	        return this.id.hashCode();
	    }*/
}

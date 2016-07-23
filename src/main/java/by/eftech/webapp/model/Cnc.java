package by.eftech.webapp.model;


import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "cnc")
public class Cnc extends BaseEntity implements Serializable{

    @Column(name = "name", nullable = false)
    @NotEmpty
    protected String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Column(name = "full_name", nullable = false)
     protected String fullName;
    @Column(name = "config")
    protected String config;
    @Column(name = "descr")
    protected String descr;
    public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getConfig() {
		return config;
	}

	public void setConfig(String config) {
		this.config = config;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public Cnc() {
    }

    public Cnc(Integer id, String name,String fullName,String config,String descr) {
        super(id);
        this.name = name;
        this.fullName = fullName;
        this.config = config;
        this.descr = descr;
    }

    public Cnc( String name,String fullName,String config,String descr) {
        this.name = name;
        this.fullName = fullName;
        this.config = config;
        this.descr = descr;
    }
}

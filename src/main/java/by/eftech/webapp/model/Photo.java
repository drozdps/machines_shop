package by.eftech.webapp.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "photo",catalog="machine")
public class Photo extends BaseEntity implements Serializable {
	
    @Column(name = "path")
    protected String path;
    @ManyToMany(fetch = FetchType.LAZY,targetEntity=Machine.class, cascade = CascadeType.ALL)
    @JoinTable(name = "machine_has_photo",catalog="machine", joinColumns = {
    		@JoinColumn(name = "photo_id",referencedColumnName="id", nullable=false,updatable=false)},
            inverseJoinColumns = {@JoinColumn(name = "machine_id",referencedColumnName="id")})protected List<Machine> machines = new ArrayList<Machine>();
    public List<Machine> getMachines() {
    	Hibernate.initialize(machines);
		return machines;
	}

	public void setMachines(List<Machine> machines) {
		this.machines = machines;
	}

	public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Photo() {
    }

    public Photo(String path) {
        this.path = path;
    }

    public Photo(Integer id, String path) {
        super(id);
        this.path = path;
    }
}

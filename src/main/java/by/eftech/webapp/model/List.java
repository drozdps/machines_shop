package by.eftech.webapp.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "list")
public class List extends BaseEntity implements Serializable {

    @Column(name = "max_dimensions")
    protected String max_dimensions;
    public String getMax_dimensions() {
		return max_dimensions;
	}

	public void setMax_dimensions(String max_dimensions) {
		this.max_dimensions = max_dimensions;
	}

	public Float getMax_thick() {
		return max_thick;
	}

	public void setMax_thick(Float max_thick) {
		this.max_thick = max_thick;
	}

	@Column(name = "max_thick")
    protected Float max_thick;
   

    public List() {
    }

    public List(Integer id, String max_dimensions,Float max_thick) {
        super(id);
        this.max_dimensions = max_dimensions;
        this.max_thick = max_thick;
    }

    public List(String max_dimensions,Float max_thick) {
    	this.max_dimensions = max_dimensions;
        this.max_thick = max_thick;
    }
}

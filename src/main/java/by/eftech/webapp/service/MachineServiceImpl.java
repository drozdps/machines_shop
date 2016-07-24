package by.eftech.webapp.service;

import by.eftech.webapp.model.Machine;
import by.eftech.webapp.model.Select;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MachineServiceImpl implements MachineService {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Machine machine) {
       Session session=  sessionFactory.openSession();
       Transaction tx = session.beginTransaction();
       session.saveOrUpdate(machine);
       tx.commit();
       session.close();
        		
    }

    @Override
    public void delete(int id) {
    	
        Session session = sessionFactory.openSession();
        Machine machine = session.load(Machine.class, id);  	
        session.delete(machine);
        session.flush();
    	
    }

    @Override
    public Machine get(int id) {
    	/*  Session session=  sessionFactory.openSession();
    	 
          Transaction tx = session.beginTransaction();
          Machine machine = session.get(Machine.class, id);
          tx.commit();
          session.close();
        return  machine;*/
    	return sessionFactory.openSession().get(Machine.class, id);
    }

    @Override
    public void update(Machine truckMining) {
        sessionFactory.openSession().save(truckMining);
    }

    @Override
    public List<Machine> getAll() {
        return sessionFactory.openSession().createQuery("FROM heroku_b95739e5ceeb5bf").list();
    }

	@Override
	public List<String> getMachineManufacturers() {
		return sessionFactory.openSession().createQuery("SELECT DISTINCT manufacturer FROM heroku_b95739e5ceeb5bf").list();
	}

	@Override
	public List<String> getMachineLocations() {
		return sessionFactory.openSession().createQuery("SELECT DISTINCT location FROM heroku_b95739e5ceeb5bf").list();
	}
	private Integer sum=0;
	private int m=0;
    @Override
    public List<Machine> getListMachine(Select s) {
    	StringBuilder sql = new StringBuilder("SELECT * FROM heroku_b95739e5ceeb5bf");
    	System.out.println("k "+s.getMapMachineManufacturers().size());
    	sum=0;
    	m=0;
    	s.getMapMachineManufacturers().forEach((k,v)->sum+=v);
    	
    	if(sum!=0){
    		sql.append(" WHERE (manufacturer IS NOT NULL) AND (");
    		s.getMapMachineManufacturers().forEach((k,v)->{
    			if(v==1) { if(m==1){sql.append(" OR "); m=0;} sql.append("manufacturer='"+k+"' ");m++;}
    		});
    		sql.append(")");
    		m=sum;
    	}
    	sum=0;
    	s.getMapMachineLocations().forEach((k,v)->sum+=v);
    	if(sum!=0){
    		if(m==0) sql.append(" WHERE ");
    		else  sql.append(" AND ");
    		m=0;
    		sql.append(" (location IS NOT NULL) AND (");
    		s.getMapMachineLocations().forEach((k,v)->{
    			if(v==1) { if(m==1){sql.append(" OR "); m=0;} sql.append("location='"+k+"' ");m++;}
    		});
    		sql.append(")");
    	}
    	m=0; sum=0;
        List<Machine> listMachine =(List<Machine>) sessionFactory.openSession().createQuery(sql.toString());
        return listMachine;
    }
}

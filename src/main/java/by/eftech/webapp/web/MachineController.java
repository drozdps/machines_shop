package by.eftech.webapp.web;

import by.eftech.webapp.model.Machine;
import by.eftech.webapp.model.Select;
import by.eftech.webapp.service.MachineService;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MachineController {

    @Autowired
    private MachineService service;
    HashMap<String,Integer> mapMachineManufacturers;
    HashMap<String,Integer> mapMachineLocations;

  	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		ModelAndView mv = new ModelAndView("admin");
		List<Machine> listMachine = service.getAll();
		 mv.addObject("listMachine", listMachine);
	    return mv;

	}

    @RequestMapping(value = {"/search/", "/search"}, method = RequestMethod.GET)
    public String search(@RequestParam HashMap<String,String> allRequestParams, HttpSession session) {
    	mapMachineManufacturers.replaceAll((k,v)->v=0);
    	mapMachineLocations.replaceAll((k,v)->v=0);
    	allRequestParams.forEach((k,v)->{
    		if(k.startsWith("manufacturer"))mapMachineManufacturers.put(k.replace("manufacturer", ""),1);
    		if(k.startsWith("location"))mapMachineLocations.put(k.replace("location", ""),1);
    	});
    	return "redirect:/";
    }    

	@RequestMapping(value =  "/login" , method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error) {

		ModelAndView model = new ModelAndView("login");
		if (error != null) {
			model.addObject("error", "Invalid username or password!");
		}

		model.setViewName("login");

		return model;

	}

  
    @RequestMapping(value = "/" , method = RequestMethod.GET)
    public ModelAndView machine(HttpSession session) {

    	List<Machine> listMachine =service.getAll();
    	ModelAndView mv = new ModelAndView("ru_all_machine");
    	List<String> m = service.getMachineManufacturers();
    	List<String>l = service.getMachineLocations();
    	if(mapMachineManufacturers==null || m.size()!=mapMachineManufacturers.size() ){ 
    		mapMachineManufacturers = new HashMap<String,Integer>();
    		for(String s:m) mapMachineManufacturers.put(s,0);
    	}
    	
    	if(mapMachineLocations==null || l.size()!=mapMachineLocations.size()){ 
    		mapMachineLocations = new HashMap<String,Integer>();
    		for(String s:l) mapMachineLocations.put(s,0);
    	}
    	
    	Select select = new Select();
    	select.setMapMachineManufacturers(mapMachineManufacturers);
    	select.setMapMachineLocations(mapMachineLocations);
  
    	mv.addObject("listMachine", listMachine);

        mv.addObject("mapMachineManufacturers", mapMachineManufacturers);
        mv.addObject("mapMachineLocations", mapMachineLocations);
        mv.addObject("fromYear",1990);
        mv.addObject("toYear",2016);
       session.setAttribute("page", "");


        return mv;
    }

    @RequestMapping(value = "/machine-{id}", method = RequestMethod.GET)
    public ModelAndView getProduct(@PathVariable("id") int id) {
    	return new ModelAndView("ru_one_machine", "machine", service.get(id));
    }


}

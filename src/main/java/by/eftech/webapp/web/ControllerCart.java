/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package by.eftech.webapp.web;


import by.eftech.webapp.cart.ShoppingCart;
import by.eftech.webapp.model.Machine;
import by.eftech.webapp.service.MachineService;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
public class ControllerCart {
	@Autowired
	private MachineService service;
    /// ------------   Basket : Start  ---------------  
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
    public String cart(HttpSession session) {        
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart==null)  cart = new ShoppingCart();
        cart.calculateTotal("0"); // GDP (for example)
        session.setAttribute("cart", cart); 
        session.setAttribute("page", "basket"); // 
        return "cart"; 
    }  
	@RequestMapping("/add-product-to-customer-basket")
	public String addProductToShoppingCart( @RequestParam(value = "id") int id, HttpSession session){
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		if (cart==null)  cart = new ShoppingCart();
		Machine machine =   service.get(id);
        cart.addItem(machine);
        session.setAttribute("cart", cart); 
        String page = "";
        
        try {
        	page =  (String)session.getAttribute("page");              
        } catch (Exception e) {    }
        System.out.println("Page = "+page+"  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      return "redirect:/"+page;         
    }
     @RequestMapping(value = "/del-from-basket", method = RequestMethod.GET)
    public String del_from_basket1(@RequestParam("id") int id, HttpSession session) {
    	 ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
    	 if (shoppingCart==null)  shoppingCart = new ShoppingCart();
    	 Machine machine =   service.get(id);
    	 shoppingCart.update(machine, "0"); // delete from compare
    	 session.setAttribute("cart", shoppingCart);   
    	 String page= "";
         try { 
             page = (String) session.getAttribute("page"); 
         } catch (Exception e) {
         }
        return "redirect:/"+page;  
    }
    @RequestMapping(value = "/updatequantity", method = RequestMethod.GET)
    public String Minus(  @RequestParam(value = "id") int id, @RequestParam(value = "quantity") int quantity, HttpSession session ) {
    	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    	if (cart==null)  cart = new ShoppingCart();
        Machine machine = service.get(id);
        cart.update(machine, ""+quantity); // We do less on 1 position
        session.setAttribute("cart", cart);
        return "redirect:basket";
	}
     /// ------------  </ Basket  :End > ---------------   
    
}

package com.titanic.controller.home;


import java.util.List;

import javax.validation.Valid;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.titanic.entity.Customer;
import com.titanic.entity.FeedBack;
import com.titanic.entity.FoodOrder;
import com.titanic.entity.Inquiry;
import com.titanic.entity.MealsSchedule;
import com.titanic.entity.Orders;
import com.titanic.entity.User;
import com.titanic.other.TitanicMessageConstant;
import com.titanic.other.UniqueIdManager;
import com.titanic.service.food.MealManagementService;
import com.titanic.service.orderbooking.OrderManagementService;
import com.titanic.service.reviewandinquiry.ReviewManagementService;
import com.titanic.service.user.CustomerManagementService;
import com.titanic.service.user.UserCommonService;
import com.titanic.session.CurrentUser;

@Controller
public class HomeController {
	
//	@Autowired
//	private HomeManagementService hmService;
	
	@Autowired
	private ReviewManagementService rmService;
	
	@Autowired
	private MealManagementService mmService;
	
	@Autowired
	private OrderManagementService omService;
	
	@Autowired
	private CustomerManagementService cmService;
	
	private String redirectUrlString = "";
	
	
	@ModelAttribute("newFeedBack")
	public FeedBack ConstructFeedBack() {
		return  new FeedBack();
	}
	
	@ModelAttribute("newInquiry")
	public Inquiry ConstructInquiry() {
		return new Inquiry();
	}
	
	@ModelAttribute("currentCustomer")
	public Customer ConstructUser() {
		return new Customer();
	}
	
	@ModelAttribute("newFoodOrder")
	public Orders ConstructOrder() {
		return new Orders();
	}
	
	@RequestMapping("/home")
	public String home(Model model) {
		model.addAttribute("comments", rmService.getAllComments());
		model.addAttribute("meals", mmService.findAll());
		
		Customer CurrCustomer = cmService.findOneByName(CurrentUser.me());
		model.addAttribute("myProfile", CurrCustomer);
		
		model.addAttribute("myOrders", omService.findAllByCustomer(CurrCustomer));
		
		for (MealsSchedule ms : MealsSchedule.values()) {
			model.addAttribute( ms.getName() + "Meals", mmService.findByPreferedTime(ms.getName()));
		}
		return "home";
	}
	
}
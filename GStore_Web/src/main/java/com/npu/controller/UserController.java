package com.npu.controller;

import com.github.pagehelper.PageInfo;
import com.npu.domain.User;
import com.npu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private IUserService userService;

    @RequestMapping("LoginAdmin")
    public ModelAndView LoginAdmin(@RequestParam(name = "adminName")String userName,
                                   @RequestParam(name = "password")String password, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> admins = userService.LoginAdmin(userName, password);
        if (admins.size()==1){
            mv.addObject("admins", admins);
            HttpSession session = request.getSession();
            session.setAttribute("currentAdmin", admins.get(0));
            mv.setViewName("main");
        }else {
            mv.setViewName("fail");
        }
        return mv;
    }

    @RequestMapping("LogoutAdmin")
    public ModelAndView LogoutAdmin(ModelAndView mv, HttpServletRequest request){
        mv.clear();
        mv.setViewName("login");
        HttpSession session = request.getSession();
        session.removeAttribute("currentAdmin");
        return mv;
    }

    @RequestMapping("VerifyAdmin")
    public ModelAndView VerifyAdmin(@RequestParam(name = "password")String password,
                                    @RequestParam(name = "adminId")String adminId,
                                    @RequestParam(name = "customerId")String customerId) throws Exception{
        ModelAndView mv = new ModelAndView();
        System.out.println(adminId);
        String currentPWD = userService.findAdminPWDById(adminId);
        System.out.println("password = " + password);
        System.out.println("customerId = " + customerId);
        if (currentPWD.equals(password)){
            userService.setCustomerToAdmin(customerId);
            mv.addObject("url", "FindAllCustomer");
            mv.setViewName("verifySuccess");
        }else {
            mv.addObject("url", "FindAllCustomer");
            mv.setViewName("verifyFail");
        }
        return mv;
    }

    @RequestMapping("VerifyAdminSetCustomer")
    public ModelAndView VerifyAdminSetCustomer(@RequestParam(name = "password")String password,
                                    @RequestParam(name = "adminId")String adminId,
                                    @RequestParam(name = "targetId")String targetId) throws Exception{
        ModelAndView mv = new ModelAndView();
        System.out.println(adminId);
        String currentPWD = userService.findAdminPWDById(adminId);
        System.out.println("password = " + password);
        System.out.println("targetId = " + targetId);
        if (currentPWD.equals(password)){
            userService.setAdminToCustomer(targetId);
            mv.addObject("url", "FindAllAdmin");
            mv.setViewName("verifySuccess");
        }else {
            mv.addObject("url", "FindAllAdmin");
            mv.setViewName("verifyFail");
        }
        return mv;
    }

    @RequestMapping("ActivateCustomer")
    public ModelAndView ActivateCustomer(@RequestParam(name = "customerId")String customerId)throws Exception{
        ModelAndView mv = new ModelAndView();
        userService.activateCustomer(customerId);
        mv.setViewName("activateSuccess");
        return mv;
    }

    @RequestMapping("LoginCustomer")
    public ModelAndView LoginCustomer(@RequestParam(name = "customerName")String userName,
                                      @RequestParam(name = "password")String password,
                                      HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> customers = userService.LoginCustomer(userName, password);
        if (customers.size()==1){
            mv.addObject("customers", customers);
            HttpSession session = request.getSession();
            session.setAttribute("currentAdmin", customers.get(0));
            mv.setViewName("mainCustomer");
        }else {
            mv.setViewName("failCustomer");
        }
        return mv;
    }

    @RequestMapping("LogoutCustomer")
    public ModelAndView LogoutCustomer(ModelAndView mv, HttpServletRequest request){
        mv.clear();
        mv.setViewName("loginCustomer");
        HttpSession session = request.getSession();
        session.removeAttribute("currentAdmin");
        return mv;
    }

    @RequestMapping("FindAllCustomer")
    public ModelAndView FindAllCustomer(@RequestParam(name = "pageNum", defaultValue = "1")int pageNum,
                                        @RequestParam(name = "pageSize", defaultValue = "4")int pageSize)
            throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> users = userService.findAllCustomer(pageNum, pageSize);
        PageInfo<User> pageInfo = new PageInfo<>(users);
        mv.addObject("pageInfo", pageInfo);

        mv.setViewName("users-page-list");
        return mv;
    }

    @RequestMapping("FindCustomerById")
    public ModelAndView FindCustomerById(@RequestParam(name = "userId")String userId) throws Exception{
        ModelAndView mv = new ModelAndView();
        User user = userService.findCustomerById(userId);
        mv.addObject("user", user);
        mv.setViewName("modifyCustomer");
        return mv;
    }

    @RequestMapping("ModifyAdmin")
    public ModelAndView ModifyAdmin(User user) throws Exception{
        ModelAndView mv = new ModelAndView();
//        System.out.println(user.toString());
        user.setState(1);
        userService.ModifyAdmin(user);
        mv.setViewName("modifyAdminSuccess");
        return mv;
    }

    @RequestMapping("ModifyCustomer")
    public ModelAndView ModifyCustomer(User user) throws Exception{
        ModelAndView mv = new ModelAndView();
//        System.out.println(user.toString());
        user.setState(1);
        userService.ModifyAdmin(user);
        mv.addObject("url", "LogoutCustomer");
        mv.setViewName("modifyPwdSuccessCustomer");
        return mv;
    }

    @RequestMapping("FindAllAdmin")
    public ModelAndView FindAllAdmin(@RequestParam(name = "pageNum", defaultValue = "1")int pageNum,
                                     @RequestParam(name = "pageSize", defaultValue = "4")int pageSize)
            throws Exception{
        ModelAndView mv = new ModelAndView();
        List<User> users = userService.findAllAdmin(pageNum, pageSize);
        PageInfo<User> pageInfo = new PageInfo<>(users);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("admins-page-list");
        return mv;
    }

    @RequestMapping("ModifyPW")
    public ModelAndView ModifyCustomerPW(@RequestParam(name = "userId")String userId,
                                         @RequestParam(name = "formerPWD")String formerPWD,
                                         @RequestParam(name = "newPWD")String newPWD) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("formerPWD = " + formerPWD);
        String currentPWD = userService.findCustomerPWDById(userId);
        System.out.println("currentPWD = " + currentPWD);
        if (currentPWD.equals(formerPWD)){
            userService.ModifyCustomerPWDById(userId, newPWD);
            User user = userService.findUserById(userId);
            if(user.getRole().equals("admin")){

                mv.setViewName("modifyAdminSuccess");
            }else{
                mv.addObject("url", "LogoutCustomer");
                mv.setViewName("modifyPwdSuccessCustomer");
            }
        }else {
            mv.setViewName("login");
        }
        return mv;
    }

    @RequestMapping("LogoffCustomer")
    public ModelAndView LogoffCustomer(@RequestParam(name = "userId")String userId)throws Exception{
        ModelAndView mv = new ModelAndView();
        userService.logOffCustomer(userId);
        mv.setViewName("logOffSuccess");
        return mv;
    }
}

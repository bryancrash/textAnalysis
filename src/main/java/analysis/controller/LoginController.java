package analysis.controller;

import analysis.model.SysUser;
import analysis.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * Created by ${tianlin} on 2017/6/1.
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private HttpSession session;
    @Autowired
    private UserServiceImpl userService;
    /**
     * 登录页
     * @return
     */
    @RequestMapping("/loginpage")
    public String loginpage(){
        return "login";
    }

    /**
     * 登录
     * @param nickName
     * @param password
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String login(@RequestParam("nickname") String nickName, @RequestParam("password") String password, Model model){
        SysUser sysUser=userService.getUserByName(nickName);
        if(sysUser!=null){
            if(sysUser.getPassword().equals(password)){
                session.setAttribute("sessionUser", sysUser);
                return "redirect:/index";
            }
        }
        return "login";
    }

    /**
     * 注销
     * @return
     */
    @RequestMapping("/logout")
    public String logout(){
        session.removeAttribute("sessionUser");
        session.invalidate();
        return "login";
    }

}

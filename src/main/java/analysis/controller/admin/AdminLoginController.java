package analysis.controller.admin;

import analysis.model.SysUser;
import analysis.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * Created by ${tianlin} on 2017/5/26.
 */
@Controller
@RequestMapping("admin/login")
public class AdminLoginController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private HttpSession session;

    /**
     * 后台系统登录
     * @return
     */
    @RequestMapping("/enterAdmin")
    public String enterAdmin(){
        return "admin/adminLogin";
    }
    @RequestMapping("/adminLogin")
    public String adminLogin(@RequestParam("nickname") String nickName,@RequestParam("pwd") String password,Model model){
        SysUser sysUser=userService.getUserByName(nickName);
        if(sysUser!=null){
            if(sysUser.getPassword().equals(password)&&sysUser.getRole().equals("admin")){
                session.setAttribute("sysUser", sysUser);
                return "admin/default";
            }
        }
        return "admin/adminLogin";
    }

    /**
     * 后台系统登录注销
     * @return
     */
    @RequestMapping("/adminlogout")
    public String adminlogout(){
        session.removeAttribute("sysUser");
        session.invalidate();
        return "admin/adminLogin";
    }
}

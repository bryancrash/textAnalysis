package analysis.controller.admin;

import analysis.model.SysUser;
import analysis.service.impl.UserServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ${tianlin} on 2017/3/22.
 */
@Controller
@RequestMapping("/admin/user")
public class UserController {
    private static Logger logger = Logger.getLogger(UserController.class);
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private HttpSession session;
    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/get")
    public String get(@RequestParam("flg") String flg,@RequestParam("id") String id,Model model){
        SysUser sysUser=userService.getUserById(id);
        model.addAttribute("sysUser",sysUser);
        if("update".equals(flg)){
            return "admin/userUpdate";
        }
        return "admin/userView";
    }

    @RequestMapping("/save")
    public String save(SysUser sysUser,Model model){
        userService.saveUser(sysUser);
        return "redirect:/admin/user/list";
    }
    @RequestMapping("/list")
    public String list(Model model){
        List<SysUser> userList=userService.findList();
        model.addAttribute("userList",userList);
        return "admin/userList";
    }

    @RequestMapping("/addUser")
    public String addUser(){
        return "admin/addUser";
    }

    @RequestMapping("/update")
    public String update(SysUser sysUser){
        logger.info("进入update方法======");
        userService.updateUser(sysUser);
        return "redirect:/admin/user/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") String id){
        userService.deleteUser(id);
        return "redirect:/admin/user/list";
    }

    @RequestMapping("/search")
    public String search(@RequestParam("username") String username,Model model){
        List<SysUser> userList=userService.findUser(username);
        model.addAttribute("userList",userList);
        return "admin/userList";
    }

    @RequestMapping("/characterForm")
    public String characterForm(@RequestParam("id") String id,Model model){
        model.addAttribute("userid",id);
        return "admin/assCharacter";
    }

    @RequestMapping("/updateCharacter")
    public String updateCharacter(SysUser sysUser){

        userService.updateUserCharacter(sysUser);
        return "redirect:/admin/user/list";
    }

}

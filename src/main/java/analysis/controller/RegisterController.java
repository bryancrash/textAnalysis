package analysis.controller;

import analysis.model.SysUser;
import analysis.service.impl.UserServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ${tianlin} on 2017/5/14.
 */
@Controller
@RequestMapping("/register")
public class RegisterController {
    private static Logger logger = Logger.getLogger(RegisterController.class);

    @Autowired
    private UserServiceImpl userService;

    @ResponseBody
    @RequestMapping(value="/checkNickname",produces="application/json")
    public Map<String,Object> checkNickname(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String nickname=(String)request.getParameter("nick_name");
        logger.info("nickname========"+nickname);
        int num=userService.countUsersByNickname(nickname);
        logger.info("num====="+num);

        //昵称是否存在的标志
        boolean valid=true;
        if(num>0){
            valid=false;
        }
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("valid",valid);
        return map;
    }

    @ResponseBody
    @RequestMapping(value="/checkUsername",produces="application/json")
    public  Map<String,Object> checkUsername(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String username=request.getParameter("user_name");
        int num=userService.countUsersByusername(username);
        //昵称是否存在的标志
        boolean valid=true;
        if(num>0){
            valid=false;
        }

        //将数据转换成json
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("valid", valid);
        //将数据返回
        return map;
    }

    @ResponseBody
    @RequestMapping(value="/",produces="application/json")
    public Map<String,Object> register(@RequestParam("nickname") String nickname,
                           @RequestParam("username") String username,
                           @RequestParam("password") String password)throws IOException{

        logger.info("nickname==="+nickname+"username===="+username);
        SysUser sysUser=new SysUser();
        sysUser.setNickname(nickname);
        sysUser.setUsername(username);
        sysUser.setRole("common");
        sysUser.setPassword(password);
        int result=userService.saveUser(sysUser);

        boolean valid=false;
        if(result>0){
            valid=true;
        }
        //将数据转换成json
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("valid", valid);
        return map;
    }
}

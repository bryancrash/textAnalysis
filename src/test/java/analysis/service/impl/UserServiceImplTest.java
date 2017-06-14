package analysis.service.impl;

import analysis.model.SysUser;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by ${tianlin} on 2017/5/16.
 */
public class UserServiceImplTest {
    @Test
    public void getUserByName() throws Exception {
        UserServiceImpl userService=new UserServiceImpl();
        SysUser sysUser=userService.getUserByName("tianlin");
        assertEquals("tianlin",sysUser.getUsername());
    }
}
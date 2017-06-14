package analysis.service.impl;

import analysis.mapper.SysUserMapper;
import analysis.model.SysUser;
import analysis.model.SysUserExample;
import analysis.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ${tianlin} on 2017/3/14.
 */
@Service("User")
public class UserServiceImpl implements IUserService {

    @Autowired
    private SysUserMapper userDao;

    public SysUser getUserById(String userId) {
        // TODO Auto-generated method stub
        return userDao.selectByPrimaryKey(userId);
    }

    public SysUser getUserByName(String nickName){
        SysUserExample  example=new SysUserExample();
        example.createCriteria().andNicknameEqualTo(nickName);
        List<SysUser> userList=userDao.selectByExample(example);
        if(userList!=null && userList.size()>0){
            return userList.get(0);
        }
        return null;
    }


    public List<SysUser> findList(){
        SysUserExample userExample=new SysUserExample();
        userExample.createCriteria();
        return userDao.selectByExample(userExample);
    }


    public int saveUser(SysUser sysUser){
        return this.userDao.insert(sysUser);
    }

    public int updateUser(SysUser sysUser){
        return this.userDao.updateByPrimaryKey(sysUser);
    }

    public int updateUserCharacter(SysUser sysUser){
        return this.userDao.updateByPrimaryKeySelective(sysUser);
    }

    public int deleteUser(String id){
        return this.userDao.deleteByPrimaryKey(id);
    }

    public List<SysUser> findUser(String username){
        SysUserExample userExample=new SysUserExample();
        userExample.createCriteria().andUsernameLike(username);
        return userDao.selectByExample(userExample);
    }

    public int countUsersByNickname(String nickname){
        SysUserExample userExample=new SysUserExample();
        userExample.createCriteria().andNicknameEqualTo(nickname);
        return userDao.countByExample(userExample);
    }

    public int countUsersByusername(String username){
        SysUserExample userExample=new SysUserExample();
        userExample.createCriteria().andUsernameEqualTo(username);
        return userDao.countByExample(userExample);
    }
}

package analysis.service;

import analysis.model.SysUser;

/**
 * Created by tianlin on 2017/3/14.
 */

public interface IUserService {
    public SysUser getUserById(String userId);
}

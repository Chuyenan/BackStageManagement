package com.npu.service.impl;

import com.github.pagehelper.PageHelper;
import com.npu.dao.IUserDao;
import com.npu.domain.User;
import com.npu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao iUserDao;

    /**
     * 用户登录
     *
     * @param username 顾客用户名
     * @param password 顾客密码
     * @return Customer 顾客账户
     */
    @Override
    public List<User> LoginCustomer(String username, String password) throws Exception {
        return iUserDao.LoginCustomer(username, password);
    }

    /**
     * 管理员登录
     *
     * @param username 管理员用户名
     * @param password 管理员密码
     * @return Admin 管理员账户
     */
    @Override
    public List<User> LoginAdmin(String username, String password) throws Exception {
        return iUserDao.LoginAdmin(username, password);
    }

    /**
     * 查询所有用户
     * @return 返回一个包含所有用户的List
     * @throws Exception 抛出异常
     */
    @Override
    public List<User> findAllUser() throws Exception {
        return iUserDao.findAllUser();
    }

    /**
     * 根据id查询customer
     * @param userId 顾客id
     * @return 返回一个符合的用户对象
     */
    @Override
    public User findCustomerById(String userId) throws Exception{
        return iUserDao.findCustomerById(userId);
    }

    /**
     * 更改顾客信息
     * @param user 顾客
     */
    @Override
    public void ModifyAdmin(User user) throws Exception{
        iUserDao.ModifyAdmin(user);
    }

    /**
     * 验证密码
     * @param userId 顾客id
     * @return 返回密码字符串
     */
    @Override
    public String findCustomerPWDById(String userId) throws Exception{
        return iUserDao.findCustomerPWDById(userId);
    }

    /**
     * 更改密码
     * @param userId 顾客id
     * @param newPWD 新密码
     */
    @Override
    public void ModifyCustomerPWDById(String userId, String newPWD) throws Exception{
        iUserDao.ModifyCustomerPWDById(userId, newPWD);
    }

    /**
     * 注销账户
     * @param userId 用户id
     */
    public void logOffCustomer(String userId) throws Exception{
        iUserDao.logOffCustomer(userId);
    }

    /**
     * 查询所有顾客
     * @param pageNum 当前页数
     * @param pageSize 页面容量
     * @return 返回列表
     */
    public List<User> findAllCustomer(int pageNum, int pageSize) throws Exception{
        PageHelper.startPage(pageNum, pageSize);
        return iUserDao.findAllCustomer();
    }

    /**
     * 验证管理员密码
     * @param adminId 管理员ID
     * @return 返回密码
     */
    public String findAdminPWDById(String adminId) throws Exception{
        return iUserDao.findAdminPWDById(adminId);
    }

    /**
     * 设置普通用户为管理员
     * @param userId 顾客id
     */
    public void setCustomerToAdmin(String userId) throws Exception{
        iUserDao.setCustomerToAdmin(userId);
    }

    /**
     * 激活注销的顾客账户
     * @param customerId 顾客id
     * @throws Exception 异常抛出
     */
    public void activateCustomer(String customerId) throws Exception{
        iUserDao.activateCustomer(customerId);
    }

    /**
     * 查询所有管理员
     * @param pageNum 当前页数
     * @param pageSize 页面容量
     * @return 返回列表
     */
    public List<User> findAllAdmin(int pageNum, int pageSize)throws Exception{
        PageHelper.startPage(pageNum, pageSize);
        return iUserDao.findAllAdmin();
    }

    /**
     * 取消管理员身份
     * @param targetId 目标管理员ID
     */
    public void setAdminToCustomer(String targetId)throws Exception{
        iUserDao.setAdminToCustomer(targetId);
    }

    /**
     * 根据id查询user
     * @param userId id
     * @return user
     */
    public User findUserById(String userId) throws Exception{
        return iUserDao.findUserById(userId);
    }
}

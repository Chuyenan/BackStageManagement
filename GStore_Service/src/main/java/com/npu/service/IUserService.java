package com.npu.service;

import com.npu.domain.User;

import java.util.List;

public interface IUserService {

    /**
     * 用户登录
     * @param username  顾客用户名
     * @param password  顾客密码
     * @return Customer 顾客账户
     */
    List<User> LoginCustomer(String username, String password) throws Exception;

    /**
     * 管理员登录
     * @param username 管理员用户名
     * @param password  管理员密码
     * @return  Admin 管理员账户
     */
    List<User> LoginAdmin(String username, String password) throws Exception;

    /**
     * 查询所有用户
     * @return 返回一个包含所有用户的List
     * @throws Exception 抛出异常
     */
    List<User> findAllUser() throws Exception;

    /**
     * 根据id查询customer
     * @param userId 顾客id
     * @return 返回一个符合的用户对象
     */
    User findCustomerById(String userId) throws Exception;

    /**
     * 更改顾客信息
     * @param user 顾客
     */
    void ModifyAdmin(User user) throws Exception;

    /**
     * 验证密码
     * @param userId 顾客id
     * @return 返回密码字符串
     */
    String findCustomerPWDById(String userId) throws Exception;

    /**
     * 更改密码
     * @param userId 顾客id
     * @param newPWD 新密码
     */
    void ModifyCustomerPWDById(String userId, String newPWD) throws Exception;

    /**
     * 注销账户
     * @param userId 用户id
     */
    void logOffCustomer(String userId) throws Exception;

    /**
     * 查询所有顾客
     * @param pageNum 当前页数
     * @param pageSize 页面容量
     * @return 返回列表
     */
    List<User> findAllCustomer(int pageNum, int pageSize) throws Exception;

    /**
     * 验证管理员密码
     * @param adminId 管理员ID
     * @return 返回密码
     */
    String findAdminPWDById(String adminId) throws Exception;

    /**
     * 设置普通用户为管理员
     * @param userId 顾客id
     */
    void setCustomerToAdmin(String userId) throws Exception;

    /**
     * 激活注销的顾客账户
     * @param customerId 顾客id
     * @throws Exception 异常抛出
     */
    void activateCustomer(String customerId) throws Exception;

    /**
     * 查询所有管理员
     * @param pageNum 当前页数
     * @param pageSize 页面容量
     * @return 返回列表
     */
    List<User> findAllAdmin(int pageNum, int pageSize) throws Exception;

    /**
     * 取消管理员身份
     * @param targetId 目标管理员ID
     */
    void setAdminToCustomer(String targetId) throws Exception;

    /**
     * 根据id查询user
     * @param userId id
     * @return user
     */
    User findUserById(String userId) throws Exception;
}

package com.npu.dao;

import com.npu.domain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户Dao层接口
 */
@Repository
public interface IUserDao {

    /**
     * 用户登录
     * @param userName  顾客用户名
     * @param password  顾客密码
     * @return Customer 顾客账户
     * @throws Exception 抛出异常
     */
    @Select("select * from user where username = #{arg0} and password = #{arg1} and role = 'customer' and state=1")
    List<User> LoginCustomer(String userName,String password) throws Exception;

    /**
     * 管理员登录
     * @param userName 管理员用户名
     * @param password  管理员密码
     * @return  Admin 管理员账户
     * @throws Exception    抛出异常
     */
    @Select("select * from user where username=#{arg0} and password=#{arg1} and role='admin' and state=1")
    List<User> LoginAdmin(String userName,String password) throws Exception;

    @Select("select * from user")
    List<User> findAllUser() throws Exception;

    @Select("select * from user where userId=#{userId} and role='customer'")
    User findCustomerById(String userId) throws Exception;

    @Update("update user set userName=#{userName}," +
            "email=#{email} where userId=#{userId}")
    void ModifyAdmin(User user) throws Exception;

    @Select("select password from user where userId=#{userId}")
    String findCustomerPWDById(String userId) throws Exception;

    @Update("update user set password=#{arg1} where userId=#{arg0}")
    void ModifyCustomerPWDById(String userId, String newPWD) throws Exception;

    @Update("update user set state=0 where userId=#{userId}")
    void logOffCustomer(String userId) throws Exception;

    @Select("select * from user where role='customer'")
    List<User> findAllCustomer() throws Exception;

    @Select("select * from user where role='admin'")
    List<User> findAllAdmin() throws Exception;

    @Select("select password from user where userId=#{adminId} and role='admin'")
    String findAdminPWDById(String adminId) throws Exception;

    @Update("update user set role='admin' where userId=#{userId} and role='customer'")
    void setCustomerToAdmin(String userId) throws Exception;

    @Update("update user set state=1 where userId=#{customerId} and state=0")
    void activateCustomer(String customerId)throws Exception;

    @Update("update user set role='customer' where userId=#{targetId} and role='admin'")
    void setAdminToCustomer(String targetId) throws Exception;

    @Select("select * from user where userId=#{userId}")
    User findUserById(String userId) throws Exception;
}

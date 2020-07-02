package com.npu;

import static org.junit.Assert.assertTrue;

import com.npu.domain.User;
import com.npu.service.IUserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Unit test for simple App.
 */
@Controller
public class AppTest 
{
    @Autowired
    private IUserService iUserService;

    @Test
    public void findAll() throws Exception {
        List<User> allUser = iUserService.findAllUser();
        for (User user : allUser){
            System.out.println(user.toString());
        }
    }
}

package com.npu.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Getter@Setter@ToString
public class User implements Serializable {
    private String userId;
    private String userName;
    private String password;
    private String email;
    private String role;
    private Integer state;
    private String stateStr;
    private Date updateTime;
    public String getStateStr(){
        if (state == 1){
            stateStr = "正在使用";
        }else {
            stateStr = "已注销";
        }
        return stateStr;
    }
}

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
    private Date updateTime;
}

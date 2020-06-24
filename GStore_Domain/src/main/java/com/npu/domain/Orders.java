package com.npu.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class Orders implements Serializable {
    private String ordersId;
    private String userId;
    private Date createTime;
    private String scId;
    private List<Product> products;
}

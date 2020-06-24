package com.npu.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Getter@Setter
@ToString
public class ShoppingCart implements Serializable {
    private String scId;
    private String userId;
    private List<Product> products;
}

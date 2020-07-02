package com.npu.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@ToString
public class Product implements Serializable {
    private String productId;
    private String productName;
    private Double productPrice;
    private Integer productNum;
    private String productDesc;
    private String categoryId;
    private String categoryName;
    private String imgUrl;
    private List<Orders> ordersList;
    private List<ShoppingCart> shoppingCarts;
}

package com.npu.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Getter
@Setter
@ToString
public class Category implements Serializable {
    private String categoryId;
    private String categoryName;
}

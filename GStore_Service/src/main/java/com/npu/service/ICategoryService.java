package com.npu.service;

import com.npu.domain.Category;

import java.util.List;

public interface ICategoryService {

    /**
     * 获取类别名称
     * @param categoryId 类别id
     * @return 返回类别名称
     */
    String findCategoryNameById(String categoryId) throws Exception;

    /**
     * 获取所有类别
     * @return 返回类别的list
     * @throws Exception 抛出异常
     */
    List<Category> findAllCategory() throws Exception;
}

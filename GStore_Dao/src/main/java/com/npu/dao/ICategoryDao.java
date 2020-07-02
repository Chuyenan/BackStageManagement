package com.npu.dao;

import com.npu.domain.Category;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICategoryDao {

    @Select("select categoryName from category where categoryId=#{categoryId}")
    String findCategoryNameById(String categoryId) throws Exception;

    @Select("select * from category")
    List<Category> findAllCategory();
}

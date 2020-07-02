package com.npu.service.impl;

import com.npu.dao.ICategoryDao;
import com.npu.domain.Category;
import com.npu.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private ICategoryDao iCategoryDao;

    /**
     * 获取类别名称
     * @param categoryId 类别id
     * @return 返回类别名称
     */
    public String findCategoryNameById(String categoryId) throws Exception{
        return iCategoryDao.findCategoryNameById(categoryId);
    }

    /**
     * 获取所有类别
     * @return 返回类别的list
     * @throws Exception 抛出异常
     */
    public List<Category> findAllCategory() throws Exception{
        return iCategoryDao.findAllCategory();
    }
}

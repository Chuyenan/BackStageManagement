package com.npu.service.impl;

import com.github.pagehelper.PageHelper;
import com.npu.dao.IProductDao;
import com.npu.domain.Product;
import com.npu.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productService")
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao iProductDao;

    /**
     * 查询所有商品
     *
     * @return 返回一个所有商品的List
     * @throws Exception 抛出异常
     * @param pageNum 当前页数
     * @param pageSize 页面容量
     */
    @Override
    public List<Product> findAllProduct(int pageNum, int pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        return iProductDao.findAllProduct();
    }

    /**
     * 添加商品
     * @param product 需要添加的商品
     */
    @Override
    public void addProduct(Product product) throws Exception{
        iProductDao.addProduct(product);
    }

    /**
     * 根据商品id查找商品
     * @param productId 商品id
     * @return 返回一个商品
     */
    public Product findProductById(String productId) throws Exception{
        return iProductDao.findProductById(productId);
    }

    /**
     * 根据商品id更改商品属性
     * @param product 封装好的更改后的商品信息
     */
    public void modifyProductById(Product product) throws Exception{
        iProductDao.modifyProductById(product);
    }

    /**
     * 根据id删除商品
     * @param productId 商品id
     */
    public void deleteProductById(String productId) throws Exception{
        iProductDao.deleteProductById(productId);
    }

    /**
     * 模糊查询
     *
     * @param pageNum
     * @param pageSize
     * @param pNameLike 关键词
     * @return 商品list
     * @throws Exception 异常
     */
    public List<Product> findProductsByName(int pageNum, int pageSize, String pNameLike) throws Exception{
        PageHelper.startPage(pageNum, pageSize);
        return iProductDao.findProductsByName(pNameLike);
    }
}

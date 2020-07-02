package com.npu.service;

import com.npu.domain.Product;

import java.util.List;

public interface IProductService {

    /**
     * 查询所有商品
     * @return 返回一个所有商品的List
     * @throws Exception 抛出异常
     * @param pageNum 当前页数
     * @param pageSize 页面容量
     */
    List<Product> findAllProduct(int pageNum, int pageSize) throws Exception;

    /**
     * 添加商品
     * @param product 需要添加的商品
     */
    void addProduct(Product product) throws Exception;

    /**
     * 根据商品id查找商品
     * @param productId 商品id
     * @return 返回一个商品
     */
    Product findProductById(String productId) throws Exception;

    /**
     * 根据商品id更改商品属性
     * @param product 封装好的更改后的商品信息
     */
    void modifyProductById(Product product) throws Exception;

    /**
     * 根据id删除商品
     * @param productId 商品id
     */
    void deleteProductById(String productId) throws Exception;

    /**
     * 模糊查询
     *
     * @param pageNum 当前页数
     * @param pageSize 页面容量
     * @param pNameLike 关键词
     * @return 商品list
     * @throws Exception 异常
     */
    List<Product> findProductsByName(int pageNum, int pageSize, String pNameLike) throws Exception;
}

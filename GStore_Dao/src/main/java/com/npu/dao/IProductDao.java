package com.npu.dao;

import com.npu.domain.Product;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProductDao {

    @Select("select * from product")
    List<Product> findAllProduct() throws Exception;

    @Insert("insert into product(productName,productPrice,productNum,productDesc,categoryId,imgUrl) " +
            "values(#{productName},#{productPrice},#{productNum},#{productDesc},#{categoryId},#{imgUrl})")
    void addProduct(Product product) throws Exception;

    @Select("select * from product where productId=#{productId}")
    Product findProductById(String productId) throws Exception;

    @Update("update product " +
            "set productName=#{productName},productNum=#{productNum},productPrice=#{productPrice},categoryId=#{categoryId}," +
            "productDesc=#{productDesc},imgUrl=#{imgUrl} where productId=#{productId}")
    void modifyProductById(Product product) throws Exception;

    @Delete("delete from product where productId=#{productId}")
    void deleteProductById(String productId) throws Exception;

    @Select("select * from product where productName like CONCAT('%',#{pNameLike},'%')")
    List<Product> findProductsByName(String pNameLike) throws Exception;
}

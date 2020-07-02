package com.npu.controller;

import com.github.pagehelper.PageInfo;
import com.npu.domain.Category;
import com.npu.domain.Product;
import com.npu.service.ICategoryService;
import com.npu.service.IProductService;
import com.npu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("product")
public class ProductController {

    @Autowired
    private IProductService productService;

    @Autowired
    private ICategoryService categoryService;

    @RequestMapping("FindAllProduct")
    public ModelAndView FindAllProduct(@RequestParam(name = "pageNum", defaultValue = "1")int pageNum,
                                       @RequestParam(name = "pageSize", defaultValue = "4")int pageSize) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> products = productService.findAllProduct(pageNum, pageSize);
        for (Product product : products){
            String categoryName = categoryService.findCategoryNameById(product.getCategoryId());
            product.setCategoryName(categoryName);
        }
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("product-page-list");
        return mv;
    }

    @RequestMapping("FindAllCategoryToAddProduct")
    public ModelAndView FindAllCategoryToAddProduct() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Category> categories = categoryService.findAllCategory();
        mv.addObject("categories", categories);
        mv.setViewName("product-add");
        return mv;
    }

    @RequestMapping("AddProduct")
    public ModelAndView AddProduct(Product product, HttpServletRequest request,
                                   MultipartFile imgFile) throws Exception{
        ModelAndView mv = new ModelAndView();
        System.out.println(product.toString());
        if (!imgFile.isEmpty()){
            String imgUrl = SaveImg(request, imgFile);
            product.setImgUrl(imgUrl);
        }
        productService.addProduct(product);
        mv.setViewName("addProductSuccess");
        return mv;
    }

    public String SaveImg(HttpServletRequest request, MultipartFile imgFile) throws Exception{
        //使用fileLoad组件完成文件上传
        System.out.println("SpringMVC文件上传。。。。。。。。。。。");
        //上传的位置
        String realPath = request.getSession().getServletContext().getRealPath("/img/goods/");
        System.out.println("realPath=" + realPath);
        //判断该路径是否存在，若不存在则创建一个
        File file = new File(realPath);
        if (!file.exists()){
            file.mkdir();
            boolean mkdir = file.mkdir();
            System.out.println("mkdir=" + mkdir);
        }
        String originalFilename = imgFile.getOriginalFilename();
        String filename = originalFilename.substring(originalFilename.lastIndexOf("."));
        String s = UUID.randomUUID().toString().replace("-", "");
        filename = s + filename;
        System.out.println(filename);
        //上传文件
        imgFile.transferTo(new File(realPath, filename));
        return filename;
    }

    @RequestMapping("FindProductDetailById")
    public ModelAndView FindProductDetailById(@RequestParam(name = "productId")String productId) throws Exception{
        ModelAndView mv = new ModelAndView();
        Product product = productService.findProductById(productId);
        List<Category> categories = categoryService.findAllCategory();
        mv.addObject("product", product);
        mv.addObject("categories", categories);
        mv.setViewName("product-detail");
        return mv;
    }

    @RequestMapping("FindProductDetailByIdToModify")
    public ModelAndView ModifyProductDetailById(@RequestParam(name = "productId")String productId) throws Exception{
        ModelAndView mv = new ModelAndView();
        Product product = productService.findProductById(productId);
        List<Category> categories = categoryService.findAllCategory();
        mv.addObject("product", product);
        mv.addObject("categories", categories);
        mv.setViewName("product-modify");
        return mv;
    }

    @RequestMapping("ModifyProductById")
    public ModelAndView ModifyProductById(Product product, HttpServletRequest request, MultipartFile imgFile) throws Exception{
        ModelAndView mv = new ModelAndView();
        if (!imgFile.isEmpty()){
            String imgUrl = SaveImg(request, imgFile);
            product.setImgUrl(imgUrl);
        }
        productService.modifyProductById(product);
        mv.setViewName("modifyProductSuccess");
        return mv;
    }

    @RequestMapping("DeleteProductById")
    public ModelAndView DeleteProductById(@RequestParam(name = "productId")String productId) throws Exception{
        ModelAndView mv = new ModelAndView();
        productService.deleteProductById(productId);
        mv.setViewName("delProductSuccess");
        return mv;
    }

    @RequestMapping("DeleteProducts")
    public ModelAndView DeleteProducts(@RequestParam(name = "ids")String ids) throws Exception{
        ModelAndView mv = new ModelAndView();
        String[] productIds = ids.split(",");
        for (String productId:productIds){
            productService.deleteProductById(productId);
        }
        mv.setViewName("delProductSuccess");
        return mv;
    }

    @RequestMapping("FindProductsByName")
    public ModelAndView FindProductsByName(@RequestParam(name = "pageNum", defaultValue = "1")int pageNum,
                                           @RequestParam(name = "pageSize", defaultValue = "4")int pageSize,
                                           @RequestParam(name = "pNameLike")String pNameLike) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Product> products = productService.findProductsByName(pageNum, pageSize, pNameLike);
        for (Product product : products){
            String categoryName = categoryService.findCategoryNameById(product.getCategoryId());
            product.setCategoryName(categoryName);
        }
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("pNameLike", pNameLike);
        mv.setViewName("products-page");
        return mv;
    }
}

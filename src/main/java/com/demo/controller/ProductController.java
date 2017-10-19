package com.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.demo.model.Product;
import com.demo.service.ProductService;
import com.demo.service.CategoryService;
import com.demo.service.SupplierService;
import com.demo.model.Category;
import com.demo.model.Supplier;

@Controller
@RequestMapping("/product")
public class ProductController {

	private Path path;

    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private SupplierService supplierService;
	
    @Autowired
	private JavaMailSender mailSender;
    
   /* To retrieve all products in one go*/
    
    @RequestMapping("/searchbycategory")
    public String selectByCategory(@RequestParam String searchCondition, Model model)
    {
    	
    	model.addAttribute("product",productService.getAllProduct());
    	if(searchCondition.equals("All"))
    		model.addAttribute("searchCondition","");
    	else
    		model.addAttribute("searchCondition",searchCondition);
    		return "productlist";
	} 
    
    
    @RequestMapping("/allProduct")
	public String getAllProduct(Model model)
	{
    	
    	
		List<Product> l =productService.getAllProduct();
		model.addAttribute("product", l);
		return "ProductInventory";
		
	}

    @RequestMapping("/viewProduct/{productId}")
	public String getProductById(@PathVariable  int productId, Model model)
	{	
		Product p=productService.getProductById(productId);
		model.addAttribute("product",p);
		return "viewProduct1";
	}
    
    /*To add a new product by admin method*/
    
    @RequestMapping("/addProduct")
    public String addProduct(Model model){
    	
    	/*Used for making Category available in addproduct Form*/
		model.addAttribute("category",new Category());
		List<Category> cat_details= categoryService.getAllCategory();
		model.addAttribute("desc",cat_details );
		
		/*Used for making Supplier available in addproduct Form*/
		model.addAttribute("supplier",new Supplier());
		List<Supplier> sup_details= supplierService.getAllSupplier();
		model.addAttribute("supp", sup_details);
    	
        Product product = new Product();
        model.addAttribute("product", product);

        return "addProduct";
    }

    @RequestMapping(value="/addProduct1", method = RequestMethod.POST)
    public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result, HttpServletRequest request){

        if(result.hasErrors()){
            return "addProduct";
        }
        
        Category category=categoryService.getByName(product.getCategory().getCategoryDescription());
		 product.setCategory(category);
		 Supplier supplier=supplierService.getByName(product.getSupplier().getSupplierName());
		 product.setSupplier(supplier);
        
        productService.addProduct(product);
        
        MultipartFile productImage = product.getImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + product.getProductId()+ ".jpg");

        if(productImage != null && !productImage.isEmpty()){
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (Exception ex){
                ex.printStackTrace();
                throw new RuntimeException("Product image saving failed", ex);
            }
        }
        return "redirect:/product/allProduct";
    }
    
    @RequestMapping("/deleteProduct/{productId}")
    public String deleteProduct(@PathVariable int productId, Model model, HttpServletRequest request){
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + productId + ".jpg");

        if(Files.exists(path)){
            try {
                Files.delete(path);
            } catch (Exception ex){
                ex.printStackTrace();
            }
        }

        Product product = productService.getProductById(productId);
        productService.deleteProduct(product);

        return "redirect:/product/allProduct";
    }
    
    @RequestMapping("/editProduct/{productId}")
    public String editProduct(@PathVariable("productId") int productId,  Model model){
    	
    	/*Used for making Category available in editproduct Form*/
		model.addAttribute("category",new Category());
		List<Category> cat_details= categoryService.getAllCategory();
		model.addAttribute("desc",cat_details );
		
		/*Used for making Supplier available in editproduct Form*/
		model.addAttribute("supplier",new Supplier());
		List<Supplier> sup_details= supplierService.getAllSupplier();
		model.addAttribute("supp", sup_details);
    	
        Product product = productService.getProductById(productId);

        model.addAttribute("product1", product);

        return "editProduct";
    }


    @RequestMapping(value="/editProduct1", method = RequestMethod.POST)
    public String editProductPost(@Valid @ModelAttribute("product1") Product product, BindingResult result, HttpServletRequest request){

        if(result.hasErrors()){
            return "editProduct";
        }
        
        Category category=categoryService.getByName(product.getCategory().getCategoryDescription());
		 Supplier supplier=supplierService.getByName(product.getSupplier().getSupplierName());
		 product.setCategory(category);
		 product.setSupplier(supplier);
        
       
        
        MultipartFile productImage = product.getImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + product.getProductId()+".jpg");

        if(productImage != null && !productImage.isEmpty()){
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (Exception ex){
                ex.printStackTrace();
                throw new RuntimeException("Product image saving failed", ex);
            }
        }
        
        productService.editProduct(product);
        
        return "redirect:/product/allProduct";
    }

    /*FAVOURITE PRODUCT EMAIL FUNCTIONS*/
    
    @RequestMapping("/favorite/{productId}")
    public String viewSendMailPage(@PathVariable int productId, Model model) throws IOException{
    	Product product = productService.getProductById(productId);
        model.addAttribute("product", product);

        return "sendMail";
    }
    @RequestMapping(value="/sendEmail", method=RequestMethod.POST)
    public String sendMail(HttpServletRequest request)
    {
    	try
		{
		String recipientAddress = request.getParameter("recipient");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		// prints debug info
		System.out.println("To: " + recipientAddress);
		System.out.println("Subject: " + subject);
		System.out.println("Message: " + message);
		
		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(recipientAddress);
		email.setSubject(subject);
		email.setText(message);
		
		// sends the e-mail
		mailSender.send(email);
		
		
		}
		catch(Exception ex)
		{
			System.out.println("Exception = "+ex);
		}
		return "Success";
    }
	
    
    

} // The End of Class;

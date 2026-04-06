/*Problem 3 (Level-2): Product Entry with List Display */

using ASP_.NET_Basics_Day_0.Models;
using Microsoft.AspNetCore.Mvc;


namespace ASP_.NET_Basics_Day_0.Controllers
{
    public class ProductController : Controller
    {
        static List<Product> productObj = new List<Product>()
        {
            new Product {ProductName="Laptop", Price = 50000, Quantity=5},
            new Product {ProductName="Mobile", Price = 25000, Quantity=10}

        };
        public IActionResult ShowProducts()
        {
            return View(productObj);
        }

        [HttpGet]
        public IActionResult AddProducts()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddProducts(Product products)
        {
            productObj.Add(products);
            return RedirectToAction("ShowProducts");
        }
    }
}
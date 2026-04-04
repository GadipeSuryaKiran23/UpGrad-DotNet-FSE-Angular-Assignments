[Route("product")]
public class ProductController : Controller
{
    static List<dynamic> products = new List<dynamic>();

    [HttpGet("index")]
    public IActionResult Index()
    {
        ViewBag.Products = products;
        return View();
    }

    [HttpPost("add")]
    public IActionResult Add(string name, int price, int quantity)
    {
        products.Add(new { Name = name, Price = price, Quantity = quantity });

        ViewBag.Products = products;
        return View("Index");
    }
}
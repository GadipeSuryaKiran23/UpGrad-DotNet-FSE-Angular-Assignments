/*Problem 1 (Level-1): Student Registration &Display
*/
using Microsoft.AspNetCore.Mvc;

namespace ASP_.NET_Basics_Day_0.Controllers
{
    public class StudentController : Controller
    {
        
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        
        [HttpPost]
        public IActionResult Register(string name, int age, string course)
        {
            // Pass data using ViewBag and redirect
            TempData["Name"] = name;
            TempData["Age"] = age;
            TempData["Course"] = course;

            return RedirectToAction("Display");
        }

        
        [HttpGet("display")]
        public IActionResult Display()
        {
            ViewBag.Name = TempData["Name"];
            ViewBag.Age = TempData["Age"];
            ViewBag.Course = TempData["Course"];

            return View();
        }
    }
}
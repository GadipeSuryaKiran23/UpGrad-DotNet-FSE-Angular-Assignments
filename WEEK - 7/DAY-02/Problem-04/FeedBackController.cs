/*Problem 4 (Level-2): Feedback Form with Conditional Message*/

using Microsoft.AspNetCore.Mvc;

namespace ASP_.NET_Basics_Day_0.Controllers
{
    public class FeedBackController : Controller
    {
        [HttpGet]
        public IActionResult Form()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Form(string name, string comments, int rating)
        {
            ViewData["Name"] = name;
            ViewData["Comments"] = comments;
            ViewData["Rating"] = rating;

            if (rating >= 4)
            {
                ViewData["Message"] = "Thank You for your positive feedback!";
            }
            else
            {
                ViewData["Message"] = "We will improve based on your feedback.";
            }

            return View();
        }
    }
}
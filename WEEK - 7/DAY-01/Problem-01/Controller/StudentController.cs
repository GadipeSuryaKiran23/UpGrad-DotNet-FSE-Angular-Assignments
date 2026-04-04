using Microsoft.AspNetCore.Mvc;

[Route("student")]
public class StudentController : Controller
{
    [HttpGet("form")]
    public IActionResult Form()
    {
        return View();
    }

    [HttpPost("submit")]
    public IActionResult Submit(string name, int age, string course)
    {
        ViewBag.Name = name;
        ViewBag.Age = age;
        ViewBag.Course = course;

        return View("Result");
    }
}
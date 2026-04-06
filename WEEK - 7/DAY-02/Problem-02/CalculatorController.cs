/* Problem 1 (Level-1): Simple Calculator */

using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.CompilerServices;

namespace ASP_.NET_Basics_Day_0.Controllers
{
    public class CalculatorController : Controller
    {
        [HttpGet]
        public IActionResult Calculate()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Calculate(int n1, int n2, String operation)
        {
            double result = 0;
            switch (operation) {
                case "Add":
                    result = n1 + n2;
                    
                    break;
                case "Sub":
                    result = n1 - n2;
                    break;

                case "Mul":
                    result = n1 * n2;
                    break;

                default:

                    if (n2 != 0)
                        result = (double)n1 / n2;
                    else
                        ViewBag.Result = "Cannot divide by zero";
                    break;
            }
            if (operation != "Div" || n2 != 0)
            {
                ViewBag.Result = result;
            }

            return View();
        }
    }
}
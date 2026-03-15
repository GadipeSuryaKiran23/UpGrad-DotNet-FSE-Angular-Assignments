using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp4
{ 
    class Program
        {   static void Main()
            {
                var emp = new Employee("Marko Horvat", 4500m, 35);

                Console.WriteLine($"Employee ID: {emp.EmployeeId}");
                Console.WriteLine($"Name: {emp.FullName}");
                Console.WriteLine($"Salary: {emp.Salary}");
                Console.WriteLine($"Age: {emp.Age}");

                emp.GiveRaise(15);

                emp.DeductPenalty(500);

                emp.FullName = "Marko Horvat Jr.";

                Console.WriteLine($"Updated Name: {emp.FullName}");
            }
        }
}

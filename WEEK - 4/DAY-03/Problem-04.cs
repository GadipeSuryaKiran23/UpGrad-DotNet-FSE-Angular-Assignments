/*
Level-2 Problem 1: Employee Bonus Calculator
Scenario
Develop a console application that calculates employee bonus based on salary and years of experience.
Requirements
• Accept employee name, salary and years of experience.
• Use if-else and conditional operator.
• Bonus rules:
   - Experience < 2 years: 5% bonus
   - 2-5 years: 10% bonus
   - >5 years: 15% bonus
• Display final salary after bonus.
Technical Constraints
• Use double for salary.
• Use if-else and ternary operator.
• Use proper formatting for currency output.
Sample Input
Enter Name: Aisha
Enter Salary: 50000
Enter Experience: 4
Sample Output
Employee: Aisha
Bonus: 5000
Final Salary: 55000
Expectations
Accurate bonus calculation and correct usage of control statements.
Learning Outcome
Apply conditional logic and arithmetic operations in real-world scenarios.





*/

using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("Enter Name:");
        string name = Console.ReadLine();

        Console.WriteLine("Enter Salary:");
        double salary = double.Parse(Console.ReadLine());

        Console.WriteLine("Enter Experience (years):");
        int experience = int.Parse(Console.ReadLine());

        // Invalid Input Check
        if (salary < 0 || experience < 0)
        {
            Console.WriteLine("Invalid Input: Salary and Experience cannot be negative.");
            Console.ReadLine();
            return;
        }

        double bonusPercent;

        // If-Else for bonus percentage
        if (experience < 2)
            bonusPercent = 0.05;
        else if (experience <= 5)
            bonusPercent = 0.10;
        else
            bonusPercent = 0.15;

        // Ternary operator example (extra check)
        double bonus = salary > 0 ? salary * bonusPercent : 0;

        double finalSalary = salary + bonus;

        Console.WriteLine("Employee: " + name);
        Console.WriteLine("Bonus: " + bonus.ToString("C"));
        Console.WriteLine("Final Salary: " + finalSalary.ToString("C"));

        Console.ReadLine();
    }
}
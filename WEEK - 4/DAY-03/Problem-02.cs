/*
Level-1 Problem 2: Simple Calculator Using Switch
Scenario
Create a simple calculator application that performs basic arithmetic operations.
Requirements
• Accept two numbers from user.
• Accept operator (+, -, *, /).
• Use switch statement to perform operation.
• Display result.
Technical Constraints
• Use int or double data types.
• Use switch-case statement.
• Handle division by zero.
Sample Input
Enter First Number: 10
Enter Second Number: 5
Enter Operator: *
Sample Output
Result: 50
Expectations
Correct operator selection and proper validation of inputs.
Learning Outcome
Understand switch statements, arithmetic operators and control flow in C#.



*/

using System;

namespace ConsoleApp3
{
    class Calculator
    {
        public static void Main()
        {
            Console.WriteLine("Enter First Number:");
            int x = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter Second Number:");
            int y = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter Operator [ +  -  *  / ]:");
            char op = char.Parse(Console.ReadLine());

            int result = 0;

            switch (op)
            {
                case '+':
                    result = x + y;
                    break;

                case '-':
                    result = x - y;
                    break;

                case '*':
                    result = x * y;
                    break;

                case '/':
                    if (y == 0)
                    {
                        Console.WriteLine("Error: Division by zero is not allowed.");
                        Console.ReadLine();
                        return;
                    }
                    result = x / y;
                    break;

                default:
                    Console.WriteLine("Invalid Operator");
                    Console.ReadLine();
                    return;
            }
            Console.WriteLine("Result: " + result);
            Console.ReadLine();
        }
    }
}
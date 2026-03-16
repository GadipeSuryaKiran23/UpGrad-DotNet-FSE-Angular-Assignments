/*
Level-2 Problem 1: Online Shopping Cart System
Scenario:
An e-commerce platform needs a flexible cart system where different product types calculate discounts differently.
Requirements:
1. Create a base class Product with properties Name and Price.
2. Create derived classes Electronics and Clothing.
3. Implement a virtual method CalculateDiscount().
4. Electronics get 5% discount, Clothing gets 15% discount.
5. Use encapsulation to protect price updates.
Technical Constraints:
• Use private fields with public properties.
• Apply inheritance and method overriding.
• Prevent negative price assignment.
Expectations:
• Demonstrate polymorphic behavior in cart processing.
• Apply data validation inside properties.
• Calculate and display final price after discount.
Learning Outcome:
• Combine encapsulation and polymorphism.
• Design extensible product hierarchy.
• Implement business logic in overridden methods.
Sample Input: Electronics Price = 20000
Sample Output: Final Price after 5% discount = 19000
*/

using System;

namespace ConsoleApp6
{
    // Base Class
    class Product
    {
        public string Name { 
            get; 
            set; 
        }

        private double price; // encapsulated field

        public double Price
        {
            get { return price; }
            set
            {
                if (value < 0)
                {
                    Console.WriteLine("Price cannot be negative");
                }
                else
                {
                    price = value;
                }
            }
        }

        // Virtual method
        public virtual double CalculateDiscount()
        {
            return Price;
        }
    }

    // Child Class - Electronics
    class Electronics : Product
    {
        public override double CalculateDiscount()
        {
            return Price - (Price * 0.05);
        }
    }

    // Child Class - Clothing
    class Clothing : Product
    {
        public override double CalculateDiscount()  //Child classes override it
        {
            return Price - (Price * 0.15);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Product product;               //RuntimePolymarphism

            product = new Electronics();
            product.Name = "Laptop";
            product.Price = 20000;

            Console.WriteLine($"Electronics Final Price after 5% discount = {product.CalculateDiscount()}");

            product = new Clothing();
            product.Name = "T-Shirt";
            product.Price = 2000;

            Console.WriteLine($"Clothing Final Price after 15% discount = {product.CalculateDiscount()}");

            Console.ReadLine();
        }
    }
}
/*
Level-2 Problem 2: Vehicle Rental System
Scenario:
A vehicle rental company wants a system where different vehicle types calculate rental charges differently.
Requirements:
1. Create a base class Vehicle with properties Brand and RentalRatePerDay.
2. Create derived classes Car and Bike.
3. Override CalculateRental(int days) method.
4. Car adds insurance charge of 500 per rental.
5. Bike offers 5% discount on total rental.
Technical Constraints:
• Use encapsulation with proper access modifiers.
• Apply runtime polymorphism.
• Validate number of rental days.
Expectations:
• Use base class reference to call overridden methods.
• Implement clean class hierarchy.
• Display final rental cost.
Learning Outcome:
• Master inheritance and polymorphism.
• Implement real-world OOP scenarios.
• Improve object-oriented design skills.
Sample Input: 
Car RentalRatePerDay = 2000, Days = 3
Sample Output: 
Total Rental = 6500

*/

using System;

namespace ConsoleApp6
{
    // Base Class
    class Vehicle
    {
        public string Brand { get; set; }

        private double rentalRatePerDay;

        public double RentalRatePerDay
        {
            get { return rentalRatePerDay; }
            set
            {
                if (value < 0)
                    Console.WriteLine("Invalid rental rate.");
                else
                    rentalRatePerDay = value;
            }
        }

        // Virtual method
        public virtual double CalculateRental(int days)
        {
            if (days <= 0)
            {
                Console.WriteLine("Invalid number of days.");
                return 0;
            }

            return RentalRatePerDay * days;
        }
    }

    // Child Class - Car
    class Car : Vehicle
    {
        public override double CalculateRental(int days)
        {
            double total = base.CalculateRental(days);

            return total + 500; // insurance charge
        }
    }

    // Child Class - Bike
    class Bike : Vehicle
    {
        public override double CalculateRental(int days)
        {
            double total = base.CalculateRental(days);

            return total - (total * 0.05); // 5% discount
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Vehicle vehicle;           //Runtime Polymorphism

            // Car rental
            vehicle = new Car();
            vehicle.Brand = "Toyota";
            vehicle.RentalRatePerDay = 2000;

            Console.WriteLine($"Car Total Rental = {vehicle.CalculateRental(3)}");

            // Bike rental
            vehicle = new Bike();
            vehicle.Brand = "Honda";
            vehicle.RentalRatePerDay = 800;

            Console.WriteLine($"Bike Total Rental = {vehicle.CalculateRental(3)}");

            Console.ReadLine();
        }
    }
}
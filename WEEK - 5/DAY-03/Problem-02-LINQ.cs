using System;
using System.Collections.Generic;
using System.Linq;

namespace ConsoleApp6
{
    // Product Class
    class Product
    {
        public int ProCode { get; set; }
        public string ProName { get; set; }
        public string ProCategory { get; set; }
        public double ProMrp { get; set; }

        public List<Product> GetProducts()
        {
            return new List<Product>
            {
                new Product{ProCode=1001,ProName="Colgate-100gm",ProCategory="FMCG",ProMrp=55 },
                new Product{ProCode=1002,ProName="Colgate-50gm",ProCategory="FMCG",ProMrp=30 },
                new Product{ProCode=1009,ProName="DaburRed-100gm",ProCategory="FMCG",ProMrp=50 },
                new Product{ProCode=1006,ProName="DaburRed-50gm",ProCategory="FMCG",ProMrp=28 },
                new Product{ProCode=1008,ProName="Himalaya Face Wash",ProCategory="FMCG",ProMrp=70 },
                new Product{ProCode=1007,ProName="Nivea Face Wash",ProCategory="FMCG",ProMrp=120 },
                new Product{ProCode=1010,ProName="Daawat Rice",ProCategory="Grain",ProMrp=130 },
                new Product{ProCode=1011,ProName="Delhi Gate Rice",ProCategory="Grain",ProMrp=120 },
                new Product{ProCode=1014,ProName="Saffola Oil",ProCategory="Edible-Oil",ProMrp=160 },
                new Product{ProCode=1016,ProName="Fortune Oil",ProCategory="Edible-Oil",ProMrp=150 },
                new Product{ProCode=1018,ProName="Nescafe",ProCategory="FMCG",ProMrp=70 },
                new Product{ProCode=1019,ProName="Bru",ProCategory="FMCG",ProMrp=90 },
                new Product{ProCode=1015,ProName="Parachute Oil",ProCategory="Edible-Oil",ProMrp=60 }
            };
        }
    }

    //  Program Class
    class Program
    {
        static void Main()
        {
            Product product = new Product();
            var products = product.GetProducts();

            int choice;

            do
            {
                Console.WriteLine("\n--- LINQ MENU ---");
                Console.WriteLine("1. FMCG Products");
                Console.WriteLine("2. Grain Products");
                Console.WriteLine("3. Sort by Product Code");
                Console.WriteLine("4. Sort by Category");
                Console.WriteLine("5. Sort by MRP Asc");
                Console.WriteLine("6. Sort by MRP Desc");
                Console.WriteLine("7. Group by Category");
                Console.WriteLine("8. Group by MRP");
                Console.WriteLine("9. Highest Price FMCG");
                Console.WriteLine("10. Count Total Products");
                Console.WriteLine("11. Count FMCG Products");
                Console.WriteLine("12. Max Price");
                Console.WriteLine("13. Min Price");
                Console.WriteLine("14. All Products < 30?");
                Console.WriteLine("15. Any Product < 30?");
                Console.WriteLine("16. Exit");

                Console.Write("Enter choice: ");
                choice = int.Parse(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        var q1 = products.Where(p => p.ProCategory == "FMCG");
                        foreach (var item in q1)
                            Console.WriteLine($"{item.ProCode}\t{item.ProName}\t{item.ProMrp}");
                        break;

                    case 2:
                        var q2 = products.Where(p => p.ProCategory == "Grain");
                        foreach (var item in q2)
                            Console.WriteLine($"{item.ProCode}\t{item.ProName}\t{item.ProMrp}");
                        break;

                    case 3:
                        var q3 = products.OrderBy(p => p.ProCode);
                        foreach (var item in q3)
                            Console.WriteLine(item.ProName);
                        break;

                    case 4:
                        var q4 = products.OrderBy(p => p.ProCategory);
                        foreach (var item in q4)
                            Console.WriteLine(item.ProName + " - " + item.ProCategory);
                        break;

                    case 5:
                        var q5 = products.OrderBy(p => p.ProMrp);
                        foreach (var item in q5)
                            Console.WriteLine(item.ProName + " - " + item.ProMrp);
                        break;

                    case 6:
                        var q6 = products.OrderByDescending(p => p.ProMrp);
                        foreach (var item in q6)
                            Console.WriteLine(item.ProName + " - " + item.ProMrp);
                        break;

                    case 7:
                        var q7 = products.GroupBy(p => p.ProCategory);
                        foreach (var group in q7)
                        {
                            Console.WriteLine("Category: " + group.Key);
                            foreach (var item in group)
                                Console.WriteLine(item.ProName);
                        }
                        break;

                    case 8:
                        var q8 = products.GroupBy(p => p.ProMrp);
                        foreach (var group in q8)
                        {
                            Console.WriteLine("MRP: " + group.Key);
                            foreach (var item in group)
                                Console.WriteLine(item.ProName);
                        }
                        break;

                    case 9:
                        var q9 = products
                            .Where(p => p.ProCategory == "FMCG")
                            .OrderByDescending(p => p.ProMrp)
                            .First();
                        Console.WriteLine(q9.ProName + " - " + q9.ProMrp);
                        break;

                    case 10:
                        Console.WriteLine("Total Products: " + products.Count());
                        break;

                    case 11:
                        Console.WriteLine("FMCG Count: " + products.Count(p => p.ProCategory == "FMCG"));
                        break;

                    case 12:
                        Console.WriteLine("Max Price: " + products.Max(p => p.ProMrp));
                        break;

                    case 13:
                        Console.WriteLine("Min Price: " + products.Min(p => p.ProMrp));
                        break;

                    case 14:
                        Console.WriteLine(products.All(p => p.ProMrp < 30));
                        break;

                    case 15:
                        Console.WriteLine(products.Any(p => p.ProMrp < 30));
                        break;

                    case 16:
                        Console.WriteLine("Exiting...");
                        break;

                    default:
                        Console.WriteLine("Invalid choice");
                        break;
                }

            } while (choice != 16);

            Console.ReadLine();
        }
    }
}
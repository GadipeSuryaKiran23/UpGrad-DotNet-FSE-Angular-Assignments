using System;

namespace ConsoleApp6
{

    class Program
    {
        static void Main(string[] args)
        {
            int[] arr = { 10, 20, 30, 40, 50 };

            // Using for loop
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }

            // Using foreach loop
            foreach (int item in arr)
            {
                Console.WriteLine(item);
            }
        }
    }
}
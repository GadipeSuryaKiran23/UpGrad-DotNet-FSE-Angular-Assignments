using System;

namespace ConsoleApp4
{
    class Program
    {
        static int CountVowels(string text)
        {
            int count = 0;
            foreach (char ch in text.ToLower())
            {
                if ("aeiouAEIOU".Contains(ch))
                {
                    count++;
                }
            }
            return count;
        }
        static void Main()
        {
            string input = "Programming";
            int result = CountVowels(input);
            Console.WriteLine("Number of vowels: " + result);
            Console.ReadLine();
        }
    }
}
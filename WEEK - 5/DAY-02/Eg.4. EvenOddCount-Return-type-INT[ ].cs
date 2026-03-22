using System;

class Program
{
    static void Main(string[] args)
    {
        int[] arr;

        Console.WriteLine("Enter number of elements:");
        int n = int.Parse(Console.ReadLine());

        arr = new int[n];

        Console.WriteLine($"Enter {n} numbers:");

        for (int i = 0; i < arr.Length; i++)
        {
            arr[i] = int.Parse(Console.ReadLine());
        }

        int[] result = GetEvenOddTotals(arr);

        Console.WriteLine("-------------");
        Console.WriteLine("Even Count : " + result[0]);
        Console.WriteLine("Odd Count  : " + result[1]);
    }
    static int[] GetEvenOddTotals(int[] arr)
    {
        int evenSum = 0;
        int oddSum = 0;

        foreach (int num in arr)
        {
            if (num % 2 == 0)
            {
                evenSum += num;
            }
            else
            {
                oddSum += num;
            }
        }
        return new int[] { evenSum, oddSum };
    }
}
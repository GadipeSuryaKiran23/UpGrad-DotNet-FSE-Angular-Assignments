using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp5
{
    class Program
    {
        static void Main()
        {
            var acc = new BankAccount("LT987654", "Jonas", 1200m);

            Console.WriteLine($"Account: {acc.AccountNumber}");
            Console.WriteLine($"Holder: {acc.AccountHolder}");
            Console.WriteLine($"Balance: {acc.Balance}");

            acc.Deposit(300);

            bool success = acc.Withdraw(2000); // false
            Console.WriteLine($"Withdraw success: {success}");

            acc.Withdraw(800); // true

            Console.WriteLine($"Final Balance: {acc.Balance}");

            acc.AccountHolder = "Jonas Jonaitis";
            Console.WriteLine($"Updated Holder: {acc.AccountHolder}");
        }
    }
}

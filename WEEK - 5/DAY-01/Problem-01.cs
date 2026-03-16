/*
Level-1 Problem 1: Bank Account Management System
Scenario:
A bank wants to develop a simple console-based application to manage customer bank accounts. 
The system should protect account balance information and allow controlled access using properties.
Requirements:
1. Create a BankAccount class with private fields for account number and balance.
2. Use properties to allow controlled access to account number and balance.
3. Implement Deposit and Withdraw methods with proper validation.
4. Prevent withdrawal if balance is insufficient.
Technical Constraints:
• Use private fields with public properties.
• Apply encapsulation and data hiding.
• No direct access to balance field from outside the class.
Expectations:
• Demonstrate correct use of access modifiers.
• Validate negative deposit or withdrawal amounts.
• Display updated balance after each transaction.
Learning Outcome:
• Understand encapsulation using properties.
• Apply data hiding effectively.
• Implement validation logic inside class methods.
Sample Input: 
Deposit = 5000, Withdraw = 2000
Sample Output: 
Current Balance = 3000
*/

using System;

namespace ConsoleApp6
{
    class BankAccount
    {
        // Private fields -Data Hiding
        private int accountNumber;
        private double balance;

        // Public Property for Account Number
        public int AccountNumber
        {
            get { return accountNumber; }
            set { accountNumber = value; }
        }

        // Public Property for Balance-Read Only outside
        public double Balance
        {
            get { return balance; }
        }

        // Deposit Method
        public void Deposit(double amount)
        {
            if (amount <= 0)
            {
                Console.WriteLine("Invalid deposit amount.");
                return;
            }

            balance += amount;
            Console.WriteLine($"Deposited: {amount}");
            Console.WriteLine($"Current Balance = {balance}");
        }

        // Withdraw Method
        public void Withdraw(double amount)
        {
            if (amount <= 0)
            {
                Console.WriteLine("Invalid withdrawal amount.");
                return;
            }

            if (amount > balance)
            {
                Console.WriteLine("Insufficient Balance!");
                return;
            }

            balance -= amount;
            Console.WriteLine($"Withdrawn: {amount}");
            Console.WriteLine($"Current Balance = {balance}");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            BankAccount account = new BankAccount();

            account.AccountNumber = 1001;

            account.Deposit(5000);
            account.Withdraw(-2000);

            Console.ReadLine();
        }
    }
}
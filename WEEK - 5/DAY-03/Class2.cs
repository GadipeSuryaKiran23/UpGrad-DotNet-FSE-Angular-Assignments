using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<string> tasks = new List<string>();
        int choice;

        do
        {
            Console.WriteLine("\nTo-Do List Manager");
            Console.WriteLine("1. Add Task");
            Console.WriteLine("2. View Tasks");
            Console.WriteLine("3. Remove Task");
            Console.WriteLine("4. Exit");
            Console.Write("Choose an option: ");

            choice = int.Parse(Console.ReadLine());  // Teacher style

            switch (choice)
            {
                case 1:
                    // Add Task
                    Console.Write("Enter task: ");
                    string task = Console.ReadLine();

                    if (task != "")
                    {
                        tasks.Add(task);
                        Console.WriteLine("Task added!");
                    }
                    else
                    {
                        Console.WriteLine("Task cannot be empty.");
                    }
                    break;

                case 2:
                    // View Tasks
                    if (tasks.Count == 0)
                    {
                        Console.WriteLine("No tasks available.");
                    }
                    else
                    {
                        Console.WriteLine("Tasks:");
                        for (int i = 0; i < tasks.Count; i++)
                        {
                            Console.WriteLine((i + 1) + ". " + tasks[i]);
                        }
                    }
                    break;

                case 3:
                    // Remove Task
                    if (tasks.Count == 0)
                    {
                        Console.WriteLine("No tasks to remove.");
                        break;
                    }

                    Console.Write("Enter task number to remove: ");
                    int index = int.Parse(Console.ReadLine());

                    if (index >= 1 && index <= tasks.Count)
                    {
                        string removedTask = tasks[index - 1];
                        tasks.RemoveAt(index - 1);
                        Console.WriteLine("Removed: " + removedTask);
                    }
                    else
                    {
                        Console.WriteLine("Invalid task number.");
                    }
                    break;

                case 4:
                    Console.WriteLine("Exiting...");
                    break;

                default:
                    Console.WriteLine("Invalid option.");
                    break;
            }

        } while (choice != 4);

        Console.ReadLine();
    }
}
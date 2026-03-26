using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using System.Data;

namespace ConsoleApp6
{
    class Program
    {
        static string connStr;

        static void Main()
        {
            var config = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            connStr = config.GetConnectionString("DefaultConnection");

            while (true)
            {
                Console.WriteLine("\n1.Insert\n2.View\n3.Update\n4.Delete\n5.Exit");
                Console.Write("Choice: ");

                if (!int.TryParse(Console.ReadLine(), out int ch))
                {
                    Console.WriteLine("Invalid input!");
                    continue;
                }

                switch (ch)
                {
                    case 1: Insert(); break;
                    case 2: View(); break;
                    case 3: Update(); break;
                    case 4: Delete(); break;
                    case 5: return;
                }
            }
        }

        static void Insert()
        {
            Console.Write("Name: ");
            string name = Console.ReadLine();

            Console.Write("Category: ");
            string category = Console.ReadLine();

            Console.Write("Price: ");
            decimal price = decimal.Parse(Console.ReadLine());

            using SqlConnection conn = new SqlConnection(connStr);
            using SqlCommand cmd = new SqlCommand("sp_InsertProduct", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@ProductName", SqlDbType.VarChar, 100).Value = name;
            cmd.Parameters.Add("@Category", SqlDbType.VarChar, 50).Value = category;
            cmd.Parameters.Add("@Price", SqlDbType.Decimal).Value = price;

            conn.Open();
            cmd.ExecuteNonQuery();

            Console.WriteLine("Inserted!");
        }

        static void View()
        {
            using SqlConnection conn = new SqlConnection(connStr);
            using SqlCommand cmd = new SqlCommand("sp_GetAllProducts", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Console.WriteLine($"{reader["ProductId"]}, {reader["ProductName"]}, {reader["Category"]}, {reader["Price"]}");
            }
        }

        static void Update()
        {
            Console.Write("Id: ");
            int id = int.Parse(Console.ReadLine());

            Console.Write("Name: ");
            string name = Console.ReadLine();

            Console.Write("Category: ");
            string category = Console.ReadLine();

            Console.Write("Price: ");
            decimal price = decimal.Parse(Console.ReadLine());

            using SqlConnection conn = new SqlConnection(connStr);
            using SqlCommand cmd = new SqlCommand("sp_UpdateProduct", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@ProductId", SqlDbType.Int).Value = id;
            cmd.Parameters.Add("@ProductName", SqlDbType.VarChar, 100).Value = name;
            cmd.Parameters.Add("@Category", SqlDbType.VarChar, 50).Value = category;
            cmd.Parameters.Add("@Price", SqlDbType.Decimal).Value = price;

            conn.Open();
            cmd.ExecuteNonQuery();

            Console.WriteLine("Updated!");
        }

        static void Delete()
        {
            Console.Write("Id: ");
            int id = int.Parse(Console.ReadLine());

            using SqlConnection conn = new SqlConnection(connStr);
            using SqlCommand cmd = new SqlCommand("sp_DeleteProduct", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@ProductId", SqlDbType.Int).Value = id;

            conn.Open();
            cmd.ExecuteNonQuery();

            Console.WriteLine("Deleted!");
        }
    }
}
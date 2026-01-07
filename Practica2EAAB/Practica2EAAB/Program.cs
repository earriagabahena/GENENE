using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Runtime.InteropServices;

namespace Practica2EAAB
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("=== Ingresa el Id del cliente  ===");
            Console.WriteLine("");
            String cliente = Console.ReadLine();

            //Cadena de conexion
            string connectionString = "Server =  JARED_ARRIAGA\\VE_SERVER ; Database=Gimnasio; Trusted_Connection=True;";

            // Consulta Sql ()
            string query = "SELECT TOP 5 ClienteID, Nombre, Correo, Telefono " +
                           "FROM Clientes " +
                           "Where ClienteID = @cliente";
            //CREACION DE CONEXION

            using (SqlConnection connection = new SqlConnection(connectionString))     // Paso 1
            using (SqlCommand command = new SqlCommand(query, connection))              //Paso 2

            {
                command.Parameters.AddWithValue("@cliente", cliente.ToUpper());              //Paso 3
                connection.Open();                                                      //Paso 4
                SqlDataReader reader = command.ExecuteReader();                         //paso 5

                if (reader.HasRows)
                {
                    Console.WriteLine("\n resultados encontrados: ");
                    while (reader.Read())
                    {
                        Console.WriteLine($"ClienteID: {reader["ClienteID"]}");
                        Console.WriteLine($"Nombre: {reader["Nombre"]}");
                        Console.WriteLine($"Correo: {reader["Correo"]}");
                        Console.WriteLine($"Telefono: {reader["Telefono"]}");
                        Console.WriteLine("-------------------------------------------------");
                    }


                }
                else
                {
                    Console.WriteLine("No se encontro ninguna coincidencia");
                }
                Console.WriteLine("Presiona una tecla para salir");
                Console.ReadKey();
            }
        }
    }
}

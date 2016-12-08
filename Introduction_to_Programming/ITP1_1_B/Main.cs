using System;

namespace ITP
{
    class ITP_1_1_B
    {
        static void Main(string[] args)
        {
            while (true) {
                string line = Console.ReadLine();

                if (line == null) {
                    break;
                }

                int num = int.Parse(line);
                Console.WriteLine((int)Math.Pow(num, 3));
            }
        }
    }
}


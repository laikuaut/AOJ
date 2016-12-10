using System;
using System.Linq;

namespace ITP
{
    class ITP_1_1_B
    {
        static void Main(string[] args)
        {
            var indat = Console.ReadLine().Trim().Split().Select(int.Parse).ToArray();
            var height = indat[0];
            var width = indat[1];
            var s = height * width;
            var c = (height + width) * 2;
            Console.WriteLine("{0} {1}", s, c);
        }
    }
}


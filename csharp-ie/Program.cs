using System;
using System.IO;
using System.Text.RegularExpressions;

namespace csharp_ie
{
    class Program
    {
        class Filter
        {
            private Regex _pattern;

            public Filter()
            {
                _pattern = new Regex("(?<!c)ei", RegexOptions.Compiled);
            }

            public bool IsValid(string s)
            {
                return !_pattern.IsMatch(s);
            }
        }

        static void Main(string[] args)
        {
            var filter = new Filter();
            foreach (var word in File.ReadLines(args[0]))
            {
                if (!filter.IsValid(word))
                {
                    Console.WriteLine(word);
                }
            }
        }
    }
}

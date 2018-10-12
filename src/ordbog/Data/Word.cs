using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ordbog.Data
{
    public class Word
    {
        public string Name { get; set; }
        public string Translation { get; set; }

        public Word(string name, string translation)
        {
            Name = name;
            Translation = translation;
        }
    }
}

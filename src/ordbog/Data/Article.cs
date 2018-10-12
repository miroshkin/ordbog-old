using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ordbog.Data
{
    public class Article
    {
        public string Word { get; set; }
        public string Transcription { get; set; }
        public string Translation { get; set; }

        public Article(string word, string translation)
        {
            Word = word;
            Translation = translation;
        }
    }
}

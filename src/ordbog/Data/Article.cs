using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.CodeAnalysis;

namespace Ordbog.Data
{
    public class Article
    {
        public string Word { get; set; }
        public string Transcription { get; set; }
        public string Translation { get; set; }
        public PartOfSpeech PartOfSpeech { get; set; }
        public string Language { get; set; }

        public Article(string word, string translation, string partOfSpeech, string language)
        {
            Word = word;
            Translation = translation;
            PartOfSpeech =(PartOfSpeech) Enum.Parse(typeof(PartOfSpeech), partOfSpeech, true);
            Language = language;
        }
    }

    public enum PartOfSpeech
    {
        Noun,
        Pronoun,
        Adjective,
        Verb,
        Adverb,
        Preposition,
        Conjunction,
        Interjection
    }
}

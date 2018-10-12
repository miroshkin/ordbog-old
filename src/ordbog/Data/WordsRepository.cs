using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Ordbog.Data
{
    public class WordsRepository
    {
        private List<Word> _list;

        public WordsRepository(string json)
        {
            //Get dictionary from dictionary
            _list = JsonConvert.DeserializeObject<List<Word>>(json);
            
            //Add reverse translation
            List<Word> listCopy = _list.GetRange(0, _list.Count);
            listCopy.ForEach(c => _list.Add(new Word(c.Translation, c.Name)));
        }

        public List<Word> GetWords()
        {
            //Return result sorted by name
            return _list.OrderBy(x => x.Name).ToList();
        }
    }
}

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Ordbog.Data
{
    public class ArticlesRepository
    {
        private List<Article> _list;

        public ArticlesRepository(string json)
        {
            //Get dictionary articles from dictionary.json
            _list = JsonConvert.DeserializeObject<List<Article>>(json);
        }

        public List<Article> GetArticles()
        {
            //Return result sorted by word
            return _list.OrderBy(x => x.Word).ToList();
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Ordbog.Data;

namespace Ordbog.Models
{
    public class SearchModel
    {
        [Required]
        public string SearchString { get; set; }
        public IEnumerable<Word> SearchResult { get; internal set; }
    }
}

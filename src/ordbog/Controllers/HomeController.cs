using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Ordbog.Data;
using Ordbog.Models;

namespace Ordbog.Controllers
{
    public class HomeController : Controller
    {
        private WordsRepository _wordsRepository = null;
        private readonly IHostingEnvironment _hostingEnvironment;
        public HomeController(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
            string contentRootPath = _hostingEnvironment.ContentRootPath;
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
            var enc1251 = Encoding.GetEncoding(1251);
            var JSON = System.IO.File.ReadAllText(contentRootPath + "/Content/dictionary.json", enc1251);
            _wordsRepository = new WordsRepository(JSON);
        }

        public IActionResult Index()
        {
            SearchModel sm = new SearchModel();
            return View();
        }

        [HttpPost]
        public IActionResult Index(SearchModel model)
        {
            var searchString = model.SearchString;

            if (String.IsNullOrEmpty(model.SearchString))
            {
                model.SearchResult = new Word[0];
            }
            else
            {
                model.SearchResult =
                    _wordsRepository.GetWords()
                        .Where(c =>
                            c.Name.ToUpper().Contains(searchString.ToUpper()));
            }

            return View(model);
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

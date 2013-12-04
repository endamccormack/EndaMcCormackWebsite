using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using EndaMcCormack.Models;

namespace EndaMcCormack.Controllers
{
    public class PortfolioController : Controller
    {
        //
        // GET: /Portfolio/
        endamccormackEntities model = new endamccormackEntities();
        public bool isAdmin { get { return (Session["IsAdmin"] != null && (bool)Session["IsAdmin"]); } }
        int postsPerPage = 4;



        public ActionResult Index()
        {
            return View();
        }
        [ValidateInput(false)]
        public ActionResult Category(string category, int? page)
        {
            int pageNumber = page ?? 0;

            PortfolioProjectType projId = model.PortfolioProjectTypes.Where(x => x.Name == category).First();

            IEnumerable<PortfolioPost> posts = (
                from post in model.PortfolioPosts
                where post.ProjTypeID == projId.ID
                orderby post.DateTime descending
                select post
                ).Skip(postsPerPage * pageNumber).Take(postsPerPage + 1);

            ViewBag.isPreviousLinkVisible = pageNumber > 0;
            ViewBag.isNextLinkVisible = posts.Count() > postsPerPage;

            ViewBag.pageNumber = pageNumber;

            ViewBag.Header = category;
            ViewBag.IsAdmin = isAdmin;

            return View(posts);
        }
        [ValidateInput(false)]
        public ActionResult Update(int? id, int ProjTypeID, string title, string body, DateTime dateTime, string tags, string files, string filesURL, string links, string linksURL)
        {

            if (!isAdmin)
            {
                return RedirectToAction("Index");
            }
            PortfolioPost post = GetPost(id);

            post.ProjTypeID = ProjTypeID;
            post.Title = title;
            post.Body = body;
            post.DateTime = dateTime;
            post.PortfolioTags.Clear();
            tags = tags ?? string.Empty;
            string[] tagNames = tags.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

            foreach (string tagName in tagNames)
            {
                post.PortfolioTags.Add(GetTag(tagName));
            }

            files = files ?? string.Empty;
            string[] fileNames = files.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string[] fileURLs = filesURL.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < fileNames.Count(); i++)
            {
                post.PortfolioFiles.Add(GetFile(fileNames[i], fileURLs[i]));
            }


            links = links ?? string.Empty;
            string[] linkNames = links.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string[] linkURLs = linksURL.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < linkNames.Count(); i++)
            {
                post.PortfolioLinks.Add(GetLink(linkNames[i], linkURLs[i]));
            }

            if (!id.HasValue)
            {
                model.AddToPortfolioPosts(post);
            }

            model.SaveChanges();
            return RedirectToAction("Details", new { id = post.ID });
        }

        public ActionResult Details(int id)
        {

            PortfolioPost posts = (
                from post in model.PortfolioPosts
                where post.ID == id
                orderby post.DateTime descending
                select post
                ).FirstOrDefault();

            ViewBag.IsAdmin = isAdmin;

            return View(posts);
        }

        public ActionResult Tags(string id)
        {
            PortfolioTag tag = GetTag(id);
            return View("Category", tag.PortfolioPosts);
        }
        public ActionResult Edit(int? id)
        {
            if (!isAdmin)
            {
                return RedirectToAction("Index", "Home");
            }
            PortfolioPost post = GetPost(id);

            StringBuilder tagList = new StringBuilder();
            foreach (PortfolioTag tag in post.PortfolioTags)
            {
                tagList.AppendFormat("{0} ", tag.Name);
            }

            StringBuilder fileList = new StringBuilder();
            foreach (PortfolioFile file in post.PortfolioFiles)
            {
                fileList.AppendFormat("{0} ", file.Name);
            }

            StringBuilder linkList = new StringBuilder();
            foreach (PortfolioLink link in post.PortfolioLinks)
            {
                linkList.AppendFormat("{0} ", link.Name);
            }
            ViewBag.Tags = tagList.ToString();
            ViewBag.Links = linkList.ToString();
            ViewBag.Files = fileList.ToString();

            return View(post);
        }

        public ActionResult Delete(int id)
        {
            if (isAdmin)
            {
                PortfolioPost p = GetPost(id);

                model.DeleteObject(p);
                model.SaveChanges();
            }

            return RedirectToAction("index");
        }

        private PortfolioTag GetTag(string tagName)
        {
            return model.PortfolioTags.Where(x => x.Name == tagName).FirstOrDefault() ?? new PortfolioTag() { ID = -1, Name = tagName };
        }
        private PortfolioFile GetFile(string fileName, string fileUrl)
        {
            return model.PortfolioFiles.Where(x => x.Name == fileName).FirstOrDefault() ?? new PortfolioFile() { ID = -1, Name = fileName, Link = fileUrl };
        }
        private PortfolioLink GetLink(string linkName, string linkUrl)
        {
            return model.PortfolioLinks.Where(x => x.Name == linkName).FirstOrDefault() ?? new PortfolioLink() { ID = -1, Name = linkName, Link = linkUrl };
        }


        private PortfolioPost GetPost(int? id)
        {
            return id.HasValue ? model.PortfolioPosts.Where(x => x.ID == id).First() : new PortfolioPost { ID = -1 };
        }
    }
}

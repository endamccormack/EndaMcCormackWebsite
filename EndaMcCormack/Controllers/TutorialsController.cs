using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Text;
using System.Web;
using System.Web.Mvc;
using EndaMcCormack.Models;


namespace EndaMcCormack.Controllers
{
    public class TutorialsController : Controller
    {


        private endamccormackEntities model = new endamccormackEntities();
        private const int postsPerPage = 4;
        private const int postsPerRss = 25;
        public bool IsAdmin { get { return Session["IsAdmin"] != null && (bool)Session["IsAdmin"]; } }

        public ActionResult Index(int? id)
        {

            int pageNumber = id ?? 0;
            IEnumerable<TutorialPost> posts =
               (from post in model.TutorialPosts
                where post.DateTime < DateTime.Now
                orderby post.DateTime descending
                select post).Skip(pageNumber * postsPerPage).Take(postsPerPage + 1);

            ViewBag.isPreviousLinkVisible = pageNumber > 0;
            ViewBag.isNextLinkVisible = posts.Count() > postsPerPage;

            ViewBag.pageNumber = pageNumber;
            ViewBag.IsAdmin = IsAdmin;
            return View(posts.Take(postsPerPage));
        }

        [ValidateInput(false)]
        public ActionResult Update(int? id, string title, string body, DateTime dateTime, string tags)
        {

            if (!IsAdmin)
            {
                return RedirectToAction("Index");
            }
            TutorialPost post = GetPost(id);

            post.Title = title;
            post.Body = body;
            post.DateTime = dateTime;
            post.TutorialTags.Clear();
            tags = tags ?? string.Empty;
            string[] tagNames = tags.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string tagName in tagNames)
            {
                post.TutorialTags.Add(GetTag(tagName));
            }

            if (!id.HasValue)
            {
                model.AddToTutorialPosts(post);
            }

            model.SaveChanges();
            return RedirectToAction("Details", new { id = post.ID });
        }

        public ActionResult Edit(int? id)
        {
            TutorialPost post = GetPost(id);

            StringBuilder tagList = new StringBuilder();
            foreach (TutorialTag tag in post.TutorialTags)
            {
                tagList.AppendFormat("{0} ", tag.Name);
            }
            ViewBag.Tags = tagList.ToString();
            return View(post);
        }

        public ActionResult Details(int? id)
        {
            TutorialPost post = GetPost(id);
            ViewBag.IsAdmin = IsAdmin;
            return View(post);
        }

        public ActionResult Comment(int id, string name, string email, string body)
        {

            TutorialPost post = GetPost(id);
            TutorialComment comment = new TutorialComment();
            comment.TutorialPost = post;
            comment.DateTime = DateTime.Now;
            comment.Name = name;
            comment.Email = email;
            comment.Body = body;
            model.AddToTutorialComments(comment);
            model.SaveChanges();
            return RedirectToAction("Details", new { id = id });

        }

        public ActionResult Tags(string id)
        {

            //string tagN = tagName ?? null;
            TutorialTag tag = GetTag(id);
            return View("index", tag.TutorialPosts);

        }


        public ActionResult Delete(int id)
        {
            if (IsAdmin)
            {
                TutorialPost p = GetPost(id);

                model.DeleteObject(p);
                model.SaveChanges();
            }

            return RedirectToAction("index");
        }

        public ActionResult DeleteComment(int id)
        {
            if (IsAdmin)
            {
                TutorialComment c = model.TutorialComments.Where(x => x.ID == id).First();

                model.TutorialComments.DeleteObject(c);
                model.SaveChanges();
            }

            return RedirectToAction("index");

        }
        public ActionResult EditComment(int id)
        {

            return View();
        }

        public ActionResult RSS()
        {
            IEnumerable<SyndicationItem> posts =
                (from post in model.TutorialPosts
                 where post.DateTime < DateTime.Now
                 orderby post.DateTime descending
                 select post).Take(postsPerRss).ToList().Select(x => GetSyndicationItem(x));

            SyndicationFeed feed = new SyndicationFeed("Enda Mc Cormack", "Enda Mc Cormack's Tutorials", new Uri("http://www.enda-mccormack.com"), posts);
            Rss20FeedFormatter feedFormatter = new Rss20FeedFormatter(feed);
            return new FeedResutlt(feedFormatter);
        }

        private SyndicationItem GetSyndicationItem(TutorialPost post)
        {
            return new SyndicationItem(post.Title, post.Body, new Uri("http://www.enda-mccormack.com/Tutorials/details/" + post.ID));
        }


        private TutorialTag GetTag(string tagName)
        {
            return model.TutorialTags.Where(x => x.Name == tagName).FirstOrDefault() ?? new TutorialTag() { ID = -1, Name = tagName };
        }

        private TutorialPost GetPost(int? id)
        {
            return id.HasValue ? model.TutorialPosts.Where(x => x.ID == id).First() : new TutorialPost { ID = -1 };
        }

    }
}
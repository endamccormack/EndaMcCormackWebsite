using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Text;
using System.Web;
using System.Web.Mvc;
using EndaMcCormack.Models;

namespace EndaMcCormack.Controllers
{
    public class MyBlogController : Controller
    {
        private endamccormackEntities model = new endamccormackEntities();
        private const int postsPerPage = 4;
        private const int postsPerRss = 25;
        public bool IsAdmin { get { return Session["IsAdmin"] != null && (bool)Session["IsAdmin"]; } }

        public ActionResult Index(int? id)
        {
            int pageNumber = id ?? 0;
            IEnumerable<Post> posts =
               (from post in model.Posts
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
            Post post = GetPost(id);

            post.Title = title;
            post.Body = body;
            post.DateTime = dateTime;
            post.Tags.Clear();
            tags = tags ?? string.Empty;
            string[] tagNames = tags.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string tagName in tagNames)
            {
                post.Tags.Add(GetTag(tagName));
            }

            if (!id.HasValue)
            {
                model.AddToPosts(post);
            }

            model.SaveChanges();
            return RedirectToAction("Details", new { id = post.ID });
        }

        public ActionResult Edit(int? id)
        {
            Post post = GetPost(id);

            StringBuilder tagList = new StringBuilder();
            foreach (Tag tag in post.Tags)
            {
                tagList.AppendFormat("{0},", tag.Name);
            }
            ViewBag.Tags = tagList.ToString();
            return View(post);
        }

        public ActionResult Details(int? id)
        {
            Post post = GetPost(id);
            ViewBag.IsAdmin = IsAdmin;
            return View(post);
        }

        public ActionResult Comment(int id, string name, string email, string body)
        {

            Post post = GetPost(id);
            Comment comment = new Comment();
            comment.Post = post;
            comment.DateTime = DateTime.Now;
            comment.Name = name;
            comment.Email = email;
            comment.Body = body;
            model.AddToComments(comment);
            model.SaveChanges();
            return RedirectToAction("Details", new { id = id });

        }

        public ActionResult Tags(string id)
        {
            Tag tag = GetTag(id);
            return View("index", tag.Posts);
        }

        public ActionResult Delete(int id)
        {
            if (IsAdmin)
            {
                Post p = GetPost(id);

                model.DeleteObject(p);
                model.SaveChanges();
            }

            return RedirectToAction("index");
        }

        public ActionResult DeleteComment(int id)
        {
            if (IsAdmin)
            {
                Comment c = model.Comments.Where(x => x.ID == id).First();

                model.Comments.DeleteObject(c);
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
                (from post in model.Posts
                 where post.DateTime < DateTime.Now
                 orderby post.DateTime descending
                 select post).Take(postsPerRss).ToList().Select(x => GetSyndicationItem(x));

            SyndicationFeed feed = new SyndicationFeed("Enda Mc Cormack", "Enda Mc Cormack's Blog", new Uri("http://www.enda-mccormack.com"), posts);
            Rss20FeedFormatter feedFormatter = new Rss20FeedFormatter(feed);
            return new FeedResutlt(feedFormatter);
        }

        private SyndicationItem GetSyndicationItem(Post post)
        {
            return new SyndicationItem(post.Title, post.Body, new Uri("http://www.enda-mccormack.com/MyBlog/details/" + post.ID));
        }


        private Tag GetTag(string tagName)
        {
            return model.Tags.Where(x => x.Name == tagName).FirstOrDefault() ?? new Tag() { ID = -1, Name = tagName };
        }

        private Post GetPost(int? id)
        {
            return id.HasValue ? model.Posts.Where(x => x.ID == id).First() : new Post { ID = -1 };
        }
    }
}

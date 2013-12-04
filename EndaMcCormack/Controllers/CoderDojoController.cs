using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EndaMcCormack.Models;
using System.Data.Objects;

namespace EndaMcCormack.Controllers
{
    public class CoderDojoController : Controller
    {
        //
        // GET: /HtmlCoderDojo/
        endamccormackEntities model = new endamccormackEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult KitchenSink()
        {
            return View();
        
        }
        public ActionResult test()
        {
            IEnumerable<EndaMcCormack.Models.Header> header = (from h in model.Headers
                                                                  select h);
            return View(header);
        }

        public ActionResult TheKitchenSink(string admin)
        {
            if (admin == "k3nny")
            {
                Session["CoderDojo"] = "k3nny";
            }
            IEnumerable<EndaMcCormack.Models.Header> header = (from s in model.Subjects 
                                                               join h in model.Headers
                                                               on s.id equals h.subjectID 
                                                               where s.subject1 == "HTML"
                                                               select h);
            return View(header);
        }

        public ActionResult CreateSubject()
        {
            Subject s = new Subject(); 
            return View(s);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult EditSubject(int id)
        {
            Subject content = (from c in model.Subjects
                              where c.id == id
                              select c).FirstOrDefault();
            return View(content);
        }

        [AcceptVerbs(HttpVerbs.Post), ValidateInput(false)]
        public ActionResult EditSubject(Subject con)
        {
            if (ModelState.IsValid)
            {
                Subject content = model.Subjects.Where(x => x.id == con.id).First();
                content.subject1 = con.subject1;

                model.SaveChanges();
            }


            return View(con);
        }


        public ActionResult CreateHeader()
        {
            Header h = new Header();

            return View(h);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult EditHeader(int id)
        {
            Header content = (from c in model.Headers
                               where c.id == id
                               select c).FirstOrDefault();
            return View(content);
        }

        [AcceptVerbs(HttpVerbs.Post), ValidateInput(false)]
        public ActionResult EditHeader(Header con)
        {
            if (ModelState.IsValid)
            {
                Header content = model.Headers.Where(x => x.id == con.id).First();
                content.Header1 = con.Header1;
                content.subjectID = con.subjectID;

                model.SaveChanges();
            }


            return View(con);
        }

        public ActionResult CreateContent()
        {
            Content c = new Content();

            return View(c);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult EditContent(int id)
        {
            Content content = (from c in model.Contents
                                where c.id == id
                               select c).FirstOrDefault();
            return View(content);
        }

        [AcceptVerbs(HttpVerbs.Post), ValidateInput(false)]
        public ActionResult EditContent(Content con)
        {
            if (ModelState.IsValid)
            {
                Content content = model.Contents.Where(x => x.id == con.id).First();
                content.Name = con.Name;
                content.Description = con.Description;
                content.Code = con.Code;
                content.MoreInfo = con.MoreInfo;
                content.hasCode = con.hasCode;
                content.hasLooksLike = con.hasLooksLike;
                content.hasMoreInfo = con.hasMoreInfo;
                content.headerId = con.headerId;

                model.SaveChanges();
            }
           

            return View(con);
        }

        public ActionResult DojoIndex()
        {
            return View();
        }
        public ActionResult DojoContact()
        {
            return View();
        }
        public ActionResult DojoBlog()
        {
            return View();
        }
        public ActionResult DojoNinja()
        {
            return View();
        }
        public ActionResult DojoSensai()
        {
            return View();
        }
        public ActionResult DojoSponsor()
        {
            return View();
        }
        public ActionResult DojoTutorials()
        {
            return View();
        }
        public ActionResult KitchenSinkCSS()
        {
            return View();
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EndaMcCormack.Models;

namespace EndaMcCormack.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Index/
        public bool IsAdmin { get { return Session["IsAdmin"] != null && (bool)Session["IsAdmin"]; } }

        endamccormackEntities model = new endamccormackEntities();

        public ActionResult Index()
        {
            IEnumerable<Skill> skills = (from skillz in model.Skills
                                         select skillz);

            ViewBag.IsAdmin = IsAdmin;
            return View(skills);
        }

        public ActionResult AddSkill(int? id, string name, string desc)
        {
            ViewBag.isAdmin = IsAdmin;
            if (IsAdmin)
            {
                Skill skill = getSkill(id);
                return View(skill);
            }
            return RedirectToAction("Index", "Home");
        }

        public Skill getSkill(int? id)
        {
            return id.HasValue ? (from s in model.Skills where s.ID == id select s).FirstOrDefault() : new Skill { ID = (from i in model.Skills select i.ID).FirstOrDefault() };
        }

    }
}

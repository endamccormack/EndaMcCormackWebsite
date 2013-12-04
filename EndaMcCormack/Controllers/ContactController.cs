using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace EndaMcCormack.Controllers
{
    public class ContactController : Controller
    {
        //
        // GET: /Contact/

        public ActionResult Index()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(string fName, string lName, string email, string phone, string message, string IsValid)
        {
            if (IsValid == "true")
            {   
                MailMessage emailMessage = new MailMessage();
                emailMessage.From = new MailAddress("me@enda-mccormack.com");
                emailMessage.To.Add(new MailAddress("me@enda-mccormack.com"));

                emailMessage.Subject = "New Message from Website";

                string theMessage = string.Format("From: " + email + "<br/>" +
                                                    "Name: " + fName + " " + lName + "<br/>" +
                                                    "Phone: " + phone + "<br/>" +
                                                    "Message: " + message);
                emailMessage.Body = theMessage;
                emailMessage.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.EnableSsl = true;
                client.Send(emailMessage);

                return View();
            }
            else
            {
                ViewBag.InValid = "true";
                return View();
            }


            
        }


    }
}

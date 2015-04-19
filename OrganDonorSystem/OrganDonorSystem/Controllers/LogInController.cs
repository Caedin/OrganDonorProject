using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.ViewModels;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class LoginController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();

        //
        // GET: /Login/

        public ActionResult Index()
        {
            //getting logged in userID and insuring some one is logged in
            if (Session["UserName"] != null) { return RedirectToAction("", ""); }

            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        // Handle Submit Login Button
        [HttpPost]
        public ActionResult Login(string inputUserName, string inputPassword)
        {

            List<string> username_query = (from Medical_Personnel in OrganDonorSystemDB.Medical_Personnel
                                           where Medical_Personnel.userName == inputUserName
                                           select Medical_Personnel.userName).ToList();


            List<string> password_query = (from Medical_Personnel in OrganDonorSystemDB.Medical_Personnel
                                             where Medical_Personnel.userName == inputUserName
                                             select Medical_Personnel.userPassword).ToList();

            if (username_query.Count() != 1 && password_query.Count() != 1)
            {
                // Error in size of queries. Either multiple users with same name, or user has multiple passwords. Send error message.

                return RedirectToAction("Index");
            }
            else
            {
                string required_password = password_query[0];
                string required_username = username_query[0];

                if (String.Equals(required_username, inputUserName, StringComparison.Ordinal) == false)
                {
                    // Case Sensitive Error.
                    return RedirectToAction("Index");
                }

                if (String.Equals(required_password, inputPassword, StringComparison.Ordinal))
                {
                    //Login Successful.
                    List<int> userId_query = (from Medical_Personnel in OrganDonorSystemDB.Medical_Personnel
                                             where Medical_Personnel.userName == inputUserName
                                             select Medical_Personnel.medicalPersonnelId).ToList();

                    int userID = userId_query[0];
                    Session["UserName"] = userID;

                    return RedirectToAction("Index", "UserHome");
                }
                else
                {
                    //Login Failed.
                    return RedirectToAction("Index");
                }
            }
        }

        // Handle Submit Register Button
        [HttpPost]
        public ActionResult Register(Medical_Personnel r)
        {
            try
            {
                if (ModelState.IsValid && r.userName != null)
                {
                    OrganDonorSystemDB.Medical_Personnel.AddObject(r);
                    OrganDonorSystemDB.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                return View();
            }

            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }


        // AUTO GENERATED CODED BELOW

        //
        // GET: /Login/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Login/Create

        public ActionResult Create()
        {
            return View();
        }


        //
        // POST: /Login/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Login/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Login/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Login/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Login/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

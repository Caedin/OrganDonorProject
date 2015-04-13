using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.ViewModels;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class UserHomeController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();
        //
        // GET: /UserHome/
        public ActionResult Index()
        {
            //getting logged in userID and insuring some one is logged in
            if (CurrentlyLoggedIn.getUserID() == null) { return RedirectToAction("", ""); }

            try
            {
                //viewModel has counts
                var viewModel = new UserHomeViewModel();
                return View(viewModel);
            }
            catch (Exception e)
            {
                //redirect to error page and pass message
                return RedirectToAction("UserHomeError", "UserHome", new { message = "Error accessing counts from database" });
            }
        }

        //
        // GET: /UserHome/UserHomeDonors
        public ActionResult UserHomeDonors()
        {
            //getting logged in userID and insuring some one is logged in
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }

            try
            {
                //view model contains queries and stores data
                var viewModel = new UserHomeViewModel();
                viewModel.setDonorsFromMedicalID(loggedIN.Value);

                return View(viewModel);
            }

            catch (Exception e)
            {
                //redirect to error page and pass message
                return RedirectToAction("UserHomeError", "UserHome", new { message = "Error accessing donor list from database" });
            }

 
        }

        //
        // GET: /UserHome/UserHomeRecipients
        public ActionResult UserHomeRecipients()
        {
            //getting logged in userID and insuring some one is logged in
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }

            try
            {
                //Getting Data from database and passing number of donors,reps and organs into View
                var viewModel = new UserHomeViewModel
                {
                    numberOfRecipients = (from Recipient in OrganDonorSystemDB.Recipients
                                          where Recipient.medicalPersonnelID == loggedIN
                                          select Recipient.recipentID).Count(),

                    RecipientsIDs = (from Recipient in OrganDonorSystemDB.Recipients
                                     where Recipient.medicalPersonnelID == loggedIN
                                     select Recipient.recipentID).ToList(),

                    RepcipientOriginalIDs = (from Recipient in OrganDonorSystemDB.Recipients
                                             where Recipient.medicalPersonnelID == loggedIN
                                             select Recipient.orignialID).ToList(),

                    DatesRegistered = (from Recipient in OrganDonorSystemDB.Recipients
                                       where Recipient.medicalPersonnelID == loggedIN
                                       select Recipient.dateRegistered).ToList(),
                };

                return View(viewModel);
            }
            catch (Exception e)
            {
                //redirect to error page and pass message
                return RedirectToAction("UserHomeError", "UserHome", new { message = "Error accessing recipients list from database" });
            }
           
        }

        //
        // GET: /UserHome/UserHomeOrgans
        public ActionResult UserHomeOrgans()
        {
            //getting logged in userID and insuring some one is logged in
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }

            try
            {
                //Getting Data from database and passing number of donors,reps and organs into View
                var viewModel = new UserHomeViewModel
                {
                    numberOfOrgans = (from Organ in OrganDonorSystemDB.Organs
                                      where Organ.MedicalPersonnelID == loggedIN
                                      select Organ.OrganID).Count(),

                    OrganIDs = (from Organ in OrganDonorSystemDB.Organs
                                where Organ.MedicalPersonnelID == loggedIN
                                select Organ.OrganID).ToList(),

                    OrganOriginalIDs = (from Organ in OrganDonorSystemDB.Organs
                                        where Organ.MedicalPersonnelID == loggedIN
                                        select Organ.OriginalID).ToList(),
                };

                return View(viewModel);
            }
            catch (Exception e)
            {
                //redirect to error page and pass message
                return RedirectToAction("UserHomeError", "UserHome", new { message = "Error accessing organs list from database" });
            }
        }

        public ActionResult UserHomeAddRecipients(Recipient r)
        {
            //getting logged in userID and insuring some one is logged in
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }


            if (r.orignialID == null) { return View(); }

            r.medicalPersonnelID = loggedIN.Value;

            try
            {
                if (ModelState.IsValid)
                {
                    OrganDonorSystemDB.Recipients.AddObject(r);
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

        public ActionResult UserHomeAddOrgans(Organ r)
        {
            //getting logged in userID and insuring some one is logged in
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }

            if (r.OriginalID == null) { return View(); }

            r.MedicalPersonnelID = loggedIN.Value;

            try
            {
                if (ModelState.IsValid)
                {
                    OrganDonorSystemDB.Organs.AddObject(r);
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

        public ActionResult UserHomeAddDonors(Donor r)
        {
            //getting logged in userID and insuring some one is logged in
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }

            if (r.originalID == null) { return View(); }

            r.medicalPersonnelId = loggedIN.Value;

            try
            {
                if (ModelState.IsValid)
                {
                    OrganDonorSystemDB.Donors.AddObject(r);
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

        //
        // GET: /UserHome/UserHomeError
        public ActionResult UserHomeError(string message)
        {
            ViewData["message"] = message;
            return View();
        }
          
    }
}

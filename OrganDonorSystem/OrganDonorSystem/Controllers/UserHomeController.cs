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


        [HttpGet]
        public ActionResult UserHomeAddOrgans()
        {
            return View();
        }

        [HttpGet]
        public ActionResult UserHomeAddRecipients()
        {
            return View();
        }

        [HttpGet]
        public ActionResult UserHomeAddDonors()
        {
            return View();
        }

        [HttpPost]
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

        [HttpPost]
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


                    runMatchMaking();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                return View();
            }

            return View();
        }

        [HttpPost]
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




        private void runMatchMaking()
        {
            // This will run match making on all of the organs that are currently not matched.
            List<Organ> organs = (from Organ in OrganDonorSystemDB.Organs
                                  where Organ.Recipient_RecipientID == null
                                  select Organ).ToList();

            foreach(Organ y in organs)
            {
                calculateMatch(y);
            }
        }



        private void calculateMatch(Organ r)
        {
            // This will query the recipient wait list with information from the added organ r.
            // Next it will extract the top recipient from the wait list.
            // It will then add the recipient to the match table, intiating the trigger which will prompt the owner if they want to accept the organ.
            // FUTURE: Deal with cases where there is no need for the organ.

            RecipientWaitList waitList = new RecipientWaitList();
            int userID = CurrentlyLoggedIn.getUserID() ?? default(int);

            Medical_Personnel m = (from Medical_Personnel in OrganDonorSystemDB.Medical_Personnel
                                   where Medical_Personnel.medicalPersonnelId == userID
                                       select Medical_Personnel).Single();

            waitList.populateList(r.organType_organtypeID, r.BloodType_BloodTypeID, m.State, m.City);

            Recipient reciever = waitList.getList()[0];

            MatchTable newEntry = new MatchTable();
            newEntry.acceptedOrDeclined = null;
            newEntry.medicalPersonnelIdForRecipient = reciever.medicalPersonnelID;
            newEntry.organID = r.OrganID;
            newEntry.organType = r.organType_organtypeID;
            newEntry.recipientID = reciever.recipentID;


            OrganDonorSystemDB.AddToMatchTables(newEntry);
            OrganDonorSystemDB.SaveChanges();
        }
          
    }
}

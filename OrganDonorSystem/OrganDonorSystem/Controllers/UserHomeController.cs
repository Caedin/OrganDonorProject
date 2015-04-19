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
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }

            try
            {
                //viewModel has counts
                var viewModel = new UserHomeViewModel(Session["UserName"].ToString());
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
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }

            try
            {
                //view model contains queries and stores data
                var viewModel = new UserHomeViewModel(Session["UserName"].ToString());
                viewModel.setDonorsFromMedicalID(Int32.Parse(Session["UserName"].ToString()));

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
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }
            int loggedIN = Int32.Parse(Session["UserName"].ToString());

            try
            {
                //Getting Data from database and passing number of donors,reps and organs into View
                var viewModel = new UserHomeViewModel(Session["UserName"].ToString())
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
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }
            int loggedIN = Int32.Parse(Session["UserName"].ToString());

            try
            {
                //Getting Data from database and passing number of donors,reps and organs into View
                var viewModel = new UserHomeViewModel(Session["UserName"].ToString())
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
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }
            int loggedIN = Int32.Parse(Session["UserName"].ToString());


            if (r.orignialID == null) { return View(); }

            r.medicalPersonnelID = loggedIN;

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
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }
            int loggedIN = Int32.Parse(Session["UserName"].ToString());

            if (r.OriginalID == null) { return View(); }

            r.MedicalPersonnelID = loggedIN;
            
            try
            {
                if (ModelState.IsValid)
                {
                    OrganDonorSystemDB.Organs.AddObject(r);
                    OrganDonorSystemDB.SaveChanges();


                    Action matchMakingAsynch = runMatchMaking;
                    matchMakingAsynch.BeginInvoke(ar => matchMakingAsynch.EndInvoke(ar), null);
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
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }
            int loggedIN = Int32.Parse(Session["UserName"].ToString());

            if (r.originalID == null) { return View(); }

            r.medicalPersonnelId = loggedIN;

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

            // List of organs with a NULL recipient
            List<Organ> organs_not_assigned = (from Organ in OrganDonorSystemDB.Organs
                                  where Organ.Recipient_RecipientID == null
                                  select Organ).ToList();

            // List of organs that are already in the matching table, minus declined organs.
            List<int> matched_organs = (from MatchTable in OrganDonorSystemDB.MatchTables
                                               where MatchTable.acceptedOrDeclined == 1 ||
                                               MatchTable.acceptedOrDeclined == null
                                               select MatchTable.organID).ToList();

            // Remove duplicates
            HashSet<int> matched_organ_ids = new HashSet<int>();
            foreach (int x in matched_organs) matched_organ_ids.Add(x);


            // Remove from list of NULL recipient organs the ones that are already in the matching table, except declines that must be re-matched.
            foreach (int x in matched_organ_ids)
            {
                organs_not_assigned.RemoveAll(i => i.OrganID == x);
            }

            // Calculate the match for each organ, and enter it into the match table.
            foreach (Organ y in organs_not_assigned)
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
            int loggedIN = Int32.Parse(Session["UserName"].ToString());

            Medical_Personnel m = (from Medical_Personnel in OrganDonorSystemDB.Medical_Personnel
                                   where Medical_Personnel.medicalPersonnelId == loggedIN
                                       select Medical_Personnel).Single();

            waitList.populateList(r.organType_organtypeID, r.BloodType_BloodTypeID, m.State, m.City);
            if (waitList.getList().Count() > 0)
            {
                // If there is a match found, add it to the match table. Otherwise, bypass the matching.

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
}

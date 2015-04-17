using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.ViewModels;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class AcceptAndDeclineController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();
        //
        // GET: /AcceptAndDecline/
        [HttpGet]
        public ActionResult Index()
        {
            //getting logged in userID and insuring some one is logged in
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }
            int userID = CurrentlyLoggedIn.getUserID() ?? default(int);

            MatchingViewModel viewModel = new MatchingViewModel();
            viewModel.getMatches(userID);
            return View(viewModel);
        }

        public ActionResult Accept()
        {
            // This code handles the accepting of an organ.
            int userID = CurrentlyLoggedIn.getUserID() ?? default(int);
            int tID;
            string transcation_id = Request.QueryString["tID"];
            bool result = Int32.TryParse(transcation_id, out tID);

            // Update Match Table
            MatchTable update_match = (from MatchTable in OrganDonorSystemDB.MatchTables
                                      where MatchTable.transactionID == tID
                                      select MatchTable).Single();
            update_match.acceptedOrDeclined = 1;

            // Update Organ State
            Organ deliveredOrgan = (from Organ in OrganDonorSystemDB.Organs
                                    where Organ.OrganID == update_match.organID
                                    select Organ).Single();
            deliveredOrgan.available = false;
            deliveredOrgan.Recipient_RecipientID = update_match.recipientID;

            // Update Recipient State
            Recipient reciever = (from Recipient in OrganDonorSystemDB.Recipients
                                  where Recipient.recipentID == update_match.recipientID
                                  select Recipient).Single();
            reciever.organsOrganID = deliveredOrgan.OrganID;
            reciever.organTypeOrganTypeID = deliveredOrgan.organType_organtypeID;
            reciever.needsOrgan = "F";

            // Transplant Complete!
            OrganDonorSystemDB.SaveChanges();

            return RedirectToAction("Index");
        }

        public ActionResult Decline()
        {
            // This code handles the declining of an organ.
            int userID = CurrentlyLoggedIn.getUserID() ?? default(int);
            int tID;
            string transcation_id = Request.QueryString["tID"];
            bool result = Int32.TryParse(transcation_id, out tID);

            // Update Match Table
            MatchTable update_match = (from MatchTable in OrganDonorSystemDB.MatchTables
                                       where MatchTable.transactionID == tID
                                       select MatchTable).Single();
            update_match.acceptedOrDeclined = 0;

            // Update Recipient to remove them from the list.
            Recipient reciever = (from Recipient in OrganDonorSystemDB.Recipients
                                  where Recipient.recipentID == update_match.recipientID
                                  select Recipient).Single();
            reciever.needsOrgan = "F";

            // Transplant Rejected!
            OrganDonorSystemDB.SaveChanges();

            return RedirectToAction("Index");
        }


    }
}
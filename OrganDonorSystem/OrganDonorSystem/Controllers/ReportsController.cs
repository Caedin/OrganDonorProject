using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.ViewModels;
using OrganDonorSystem.Models;
using System.Data.Entity;

namespace OrganDonorSystemDB.Controllers
{
    public class ReportsController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        //
        // GET: /Reports/

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult OrgansReport()
        {

            return View();

        }


        public ActionResult RecipientsReport()
        {
            return View();
        }


        public ActionResult MatchedReport()
        {
            return View();
        }

        public ActionResult OrganResults()
        {
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }

            bool Organresult;
            string organResult = Request.QueryString["Organs"];
            string availResult = Request.QueryString["Avail"];
            if (availResult == "Available")
                Organresult = true;
            else Organresult = false;

            var Oresults = (from organ in OrganDonorSystemDatabase.Organs
                           join bloodType in OrganDonorSystemDatabase.BloodTypes on organ.BloodType_BloodTypeID equals bloodType.bloodTypeID
                           join organType in OrganDonorSystemDatabase.OrganTypes on organ.organType_organtypeID equals organType.organTypeID
                           where organType.organName == organResult
                                && organ.available == Organresult
                                                   
                           select new AvailableOrgans {  regDate = organ.dateAqcuired ,organID = organ.OrganID, exp = organ.expirationDate, bloodTypeID = bloodType.bloodTypeName}).ToList();



            var viewModel = new ReportsViewModel()
            {
                result1 = organResult,
                result2 = availResult,
                availableOrgans = Oresults

            };


            return View(viewModel);

        }


        public ActionResult RecipientsResults()
        {
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }

            
            string organResult = Request.QueryString["Organs"];
            string bloodResult = Request.QueryString["Blood"];
            DateTime current = DateTime.Now;
            
            var Rresults = (from recipient in OrganDonorSystemDatabase.Recipients
                           join bloodType in OrganDonorSystemDatabase.BloodTypes on recipient.bloodTypeBloodTypeID equals bloodType.bloodTypeID
                           join organType in OrganDonorSystemDatabase.OrganTypes on  recipient.organTypeOrganTypeID equals organType.organTypeID
                           where bloodType.bloodTypeName == bloodResult
                               && organType.organName == organResult
                                && recipient.organsOrganID ==null
                           select new RecipientsWaiting { waitTime = recipient.dateRegistered, recepID = recipient.recipentID, gender = recipient.gender, age = recipient.age, severity = recipient.severity }).ToList();
            
            

            var viewModel = new ReportsViewModel()
            {
                recipientsWaiting = Rresults,
                     
                result1 = organResult,
                result2 = bloodResult,
                
            };

            
            return View(viewModel);
            
        }

        public ActionResult MatchedResults()
        {  
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }
            
            int number;
            int yearInt;
            string year = Request.QueryString["Matched"];
            bool yearResult = Int32.TryParse(year, out number);  
            yearInt = number;
           
            sbyte? Matchedresult;
            string status = Request.QueryString["Accept"];
            if (status == "Accepted")
                Matchedresult = 1;
            else Matchedresult = 0;
            

           var Mresults = (from matched in OrganDonorSystemDatabase.MatchTables
                           join organType in OrganDonorSystemDatabase.OrganTypes on matched.organType equals organType.organTypeID
                           where matched.acceptedOrDeclined == Matchedresult
                                && matched.dateMatched.Year  == yearInt
                           select new Matched { organID = matched.organID, recipientID = matched.recipientID, organType = organType.organName, dateMatched = matched.dateMatched, transID = matched.transactionID }).ToList();
            
            
            var viewModel = new ReportsViewModel()
            {
                matchedList = Mresults,
                result1 = year,
                result2 = status
                

            };

            
            return View(viewModel);

        }

    }

}

           
            
            
            
            
            /*
            return View();


        }
    }
}


            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }

            bool result;
            string organResult = Request.QueryString["Organs"];
            string availResult = Request.QueryString["Available"];
            if (availResult == "Available")
                result = true; 
            else result = false;
            int bloodType = 2;
            int organType = 1;
            //create var out here
            
             
            var viewModel = new ReportsViewModel()
            {
                organL = //from Organs in OrganDonorSystemDatabase.Organs &&
                            from OrganType in OrganDonorSystemDatabase.OrganTypes
                           //join OrgansType in OrganDonorSystemDatabase.OrganTypes on OrganType.organTypeID equals Organs.organType_organtypeID 
                           where OrganType.organName == organResult
                           select OrganType).ToList();
                
            // create iterator pointing To var that is outside of the viewmodel
            //whatever
           // pass this To view
                
             };

*/
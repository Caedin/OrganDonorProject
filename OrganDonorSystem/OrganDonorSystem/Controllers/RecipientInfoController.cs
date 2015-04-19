using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class RecipientInfoController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        //
        // GET: /RecipientInfo/
        
        public ActionResult Index()
        {

            //getting logged in userID and insuring some one is logged in
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }

            int number;
            string blah = Request.QueryString["rID"];
            bool result = Int32.TryParse(blah, out number);
            int rID = number;
            var viewModel = new RecipientInfoIndexViewModel
            {
                 
                recipientID = rID,
                
                age = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID == rID
                       select Recipient.age).Single(),

                gender = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID == rID
                       select Recipient.gender).Single(),
                bloodType = (from Recipient in OrganDonorSystemDatabase.Recipients
                             join BloodTypes in OrganDonorSystemDatabase.BloodTypes on Recipient.bloodTypeBloodTypeID equals BloodTypes.bloodTypeID
                             where Recipient.recipentID == rID
                             select BloodTypes.bloodTypeName).Single(),
                organNeeded = (from Recipient in OrganDonorSystemDatabase.Recipients
                               join OrgansType in OrganDonorSystemDatabase.OrganTypes on Recipient.organTypeOrganTypeID equals OrgansType.organTypeID
                               where Recipient.recipentID ==rID
                               select OrgansType.organName).Single(),
                severity = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID == rID
                       select Recipient.severity).Single(),
                registration = (from Recipient in OrganDonorSystemDatabase.Recipients
                                where Recipient.recipentID == rID
                                select Recipient.dateRegistered).Single(),
                MedicalPersonnelID = (from Recipient in OrganDonorSystemDatabase.Recipients
                                      where Recipient.recipentID == rID
                                      select Recipient.medicalPersonnelID).Single(),
                };


            //checks to see if user is trying to access data that is not theirs, if so sends them back to userHome
            if (viewModel.MedicalPersonnelID != Int32.Parse(Session["UserName"].ToString())) { return RedirectToAction("Index", "UserHome"); }

            return View(viewModel);

        }



        
    }

}


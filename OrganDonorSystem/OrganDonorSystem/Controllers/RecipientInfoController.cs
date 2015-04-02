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
        {   int number;
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
                       where Recipient.recipentID == rID
                       select Recipient.bloodTypeBloodTypeID).Single(),
                organNeeded = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID ==rID
                       select Recipient.organTypeOrganTypeID).Single(),
                severity = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID == rID
                       select Recipient.severity).Single(),
                registration = (from Recipient in OrganDonorSystemDatabase.Recipients
                                where Recipient.recipentID == rID
                                select Recipient.dateRegistered).Single(),
                };



             return View(viewModel);

        }



        
    }

}


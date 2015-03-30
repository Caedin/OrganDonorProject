using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OrganDonorSystem.Controllers
{
    public class RecipientInfoController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        //
        // GET: /RecipientInfo/

        public ActionResult Index()
        {
            var viewModel = new RecipientInfoIndexViewModel
            {
                recipientID = 32,
                
                age = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID == 3
                       select Recipient.age).Single(),
                gender = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID == 3
                       select Recipient.gender).Single(),
                bloodType = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID == 3
                       select Recipient.BloodType).Single(),
                organNeeded = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID == 3
                       select Recipient.OrganType).Single(),
                severity = (from Recipient in OrganDonorSystemDatabase.Recipients
                       where Recipient.recipentID == 3
                       select Recipient.severity).Single(),
                registration = (from Recipient in OrganDonorSystemDatabase.Recipients
                                where Recipient.recipentID == 3
                                select Recipient.dateRegistered).Single(),
                };



             


            return View(viewModel);

        }



        // return View();
    }

}
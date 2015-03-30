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
                age = 19, 
                gender = (from Recipient in OrganDonorSystemDatabase.Recipients
                                 where Recipient.recipentID == 3
                                 select Recipient.gender).Single(),  
                
                
                phone = "233-222-1411", bloodType = "Type DD", organNeeded = "heart", severity = "3"
            };



             //registration = 



            return View(viewModel);

        }



        // return View();
    }

}
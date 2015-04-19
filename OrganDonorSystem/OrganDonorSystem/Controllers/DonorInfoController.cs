using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class DonorInfoController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        //
        // GET: /DonorInfo/

        public ActionResult Index()
        {
            //getting logged in userID and insuring some one is logged in
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }

            int number;
            string blah = Request.QueryString["dID"];
            bool result = Int32.TryParse(blah, out number);
            int dID = number;
            var viewModel = new DonorInfoIndexViewModel();
            viewModel.setSingleDonorFromID(dID);

            //checks to see if user is trying to access data that is not theirs, if so sends them back to userHome
            if (viewModel.MedicalPersonnelID != Int32.Parse(Session["UserName"].ToString())) { return RedirectToAction("Index", "UserHome"); }

            return View(viewModel);

        }
            
            
            
           
    }

}
           
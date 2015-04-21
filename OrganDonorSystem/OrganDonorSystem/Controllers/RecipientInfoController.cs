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
            var viewModel = new RecipientInfoIndexViewModel();
            viewModel.setRecipientWithID(rID);

            //checks to see if user is trying to access data that is not theirs, if so sends them back to userHome
            if (viewModel.MedicalPersonnelID != Int32.Parse(Session["UserName"].ToString())) { return RedirectToAction("Index", "UserHome"); }

            return View(viewModel);

        } 
    }
}


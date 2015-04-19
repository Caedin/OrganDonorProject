using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    public class OrganTypeViewModel
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();

        public List<OrganType> theOrganTypes { get; set; }
        public List<SelectListItem> listTypes { get; set; }
        public OrganTypeViewModel()
        {
            this.listTypes = new List<SelectListItem>();
            theOrganTypes = (from OrganType in OrganDonorSystemDB.OrganTypes
                             select OrganType).ToList();
            for (int i = 0; i < theOrganTypes.Count(); i++)
           {
               SelectListItem temp = new SelectListItem { Text = theOrganTypes[i].organName, Value = theOrganTypes[i].organTypeID.ToString() };
               listTypes.Add(temp);
           }
        }
    }
}
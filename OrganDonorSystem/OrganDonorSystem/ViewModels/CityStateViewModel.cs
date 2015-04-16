using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    public class CityStateViewModel
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();

        public List<State> TheStates {get;set;}
        public CityStateViewModel()
        {
            TheStates = (from State in OrganDonorSystemDB.States
                         select State).ToList();
        }
       
    }
}


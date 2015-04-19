using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    public class MatchingViewModel
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();

        public List<MatchTable> listOfMatches = new List<MatchTable>();
        public void getMatches(int medical_id) 
        {
            listOfMatches = (from MatchTable in OrganDonorSystemDatabase.MatchTables
                             where MatchTable.medicalPersonnelIdForRecipient == medical_id
                             select MatchTable).ToList();

        }
    }
}
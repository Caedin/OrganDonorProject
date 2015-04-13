using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrganDonorSystem.Models
{
    public class RecipientWaitList
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        List<Recipient> recipients = new List<Recipient>();

        public void populateList(int organType, int bloodType, State state, City city)
        {
            recipients = new List<Recipient>();

            recipients = (from Recipient in OrganDonorSystemDatabase.Recipients
                          where Recipient.organsOrganID == null &&
                                Recipient.bloodTypeBloodTypeID == bloodType &&
                                Recipient.organTypeOrganTypeID == organType
                          select Recipient).ToList();

            recipients = sortList(recipients, state, city);
        }

        private List<Recipient> sortList(List<Recipient> rlist, State state, City city)
        {
            List<Tuple<Recipient, int>> scoredList = new List<Tuple<Recipient, int>>();
            for (int x = 0; x < rlist.Count; x++)
            {
                int score = Convert.ToInt32(rlist[x].severity);
                int medical_id_for_recipient = rlist[x].medicalPersonnelID;
                Medical_Personnel m = (from Medical_Personnel in OrganDonorSystemDatabase.Medical_Personnel
                                       where Medical_Personnel.medicalPersonnelId == medical_id_for_recipient
                                       select Medical_Personnel).Single();

                if (m.State.stateID != state.stateID) score = score - 2;
                if (m.City.cityID != city.cityID) score = score - 1;


                Tuple<Recipient, int> temp_tuple = new Tuple<Recipient, int>(rlist[x], score);
                scoredList.Add(temp_tuple);
            }

            scoredList.Sort((x, y) => y.Item2.CompareTo(x.Item2));

            rlist = new List<Recipient>();
            foreach(Tuple<Recipient, int> x in scoredList)
            {
                rlist.Add(x.Item1);
            }

            return rlist;
        }

        public List<Recipient> getList() { return recipients; }
    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Managers
{
    [DataObject]
    public class UsersManager
    {
        public static List<AspNetUser> GetAllUsers()
        {
            using (var db = new EntitiesContext())
            {
                return db.AspNetUsers.ToList();
            }
        }
        public static void DeleteUser(string userId)
        {
            using (var db = new EntitiesContext())
            {
                var user = db.AspNetUsers.SingleOrDefault(x => x.Id == userId);
                var places = db.Places.Where(x => x.IdPartner == userId).ToList();
                foreach (var place in places)
                {
                    PlacesManager.DeletePlace(place.IdPlace);
                }

                var reviews = db.PlacesReviews.Where(x => x.IdUser == userId).ToList();
                foreach (var review in reviews)
                {
                    db.PlacesReviews.Remove(review);
                }

                var searches = db.UserSearchHistories.Where(x => x.IdUser == userId).ToList();
                foreach (var search in searches)
                {
                    db.UserSearchHistories.Remove(search);
                }

                var userprofile = db.UserProfiles.Where(x => x.IdUser == userId).SingleOrDefault();
                if (userprofile != null)
                {
                    db.UserProfiles.Remove(userprofile);
                    db.SaveChanges();
                }

                db.AspNetUsers.Remove(user);
                db.SaveChanges();
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Managers
{
    [DataObject]
    public class UserProfileManager
    {
        public static void UpdateProfile(UserProfile profile)
        {
            using (var db = new EntitiesContext())
            {
                var dbProfile = db.UserProfiles.Where(x => x.IdUser == profile.IdUser).SingleOrDefault();
                if (dbProfile == null)
                {
                    db.UserProfiles.Add(profile);
                    db.SaveChanges();
                }
                else
                {
                    //db.Entry(dbProfile).CurrentValues.SetValues(profile);
                    dbProfile.IdCity = profile.IdCity;
                    dbProfile.City = profile.City;
                    dbProfile.MinRating = profile.MinRating;
                    dbProfile.MinPrice = profile.MinPrice;
                    dbProfile.MaxPrice = profile.MaxPrice;
                    db.SaveChanges();
                }
            }
        }

        public static UserProfile GetUserProfile(string userId)
        {
            using (var db = new EntitiesContext())
            {
                return db.UserProfiles.Where(x => x.IdUser == userId).SingleOrDefault();
            }
        }

        public static bool HasUserCustomProfile(string userId)
        {
            using (var db = new EntitiesContext())
            {
                var profile = db.UserProfiles.Where(x => x.IdUser == userId).SingleOrDefault();
                if (profile != null)
                    return true;
                return false;
            }
        }

        public static void DeleteUserProfile(string userId)
        {
            using (var db = new EntitiesContext())
            {
                var profile = db.UserProfiles.Where(x => x.IdUser == userId).SingleOrDefault();
                db.UserProfiles.Remove(profile);
                db.SaveChanges();
            }
        }
    }
}

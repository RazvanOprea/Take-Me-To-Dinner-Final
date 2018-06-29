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
                    profile.RequestedAcces = false;
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

        public static bool HasPartnerRequestedAcces(string userId)
        {
            using (var db = new EntitiesContext())
            {
                var profile = db.UserProfiles.Where(x => x.IdUser == userId).SingleOrDefault();
                if (profile == null) return false;
                if (profile.RequestedAcces == true)
                    return true;
                else
                    return false;
            }
        }

        public static void SetRequestedTrue(string userId)
        {
            using (var db = new EntitiesContext())
            {
                var profile = db.UserProfiles.Where(x => x.IdUser == userId).SingleOrDefault();
                if (profile != null)
                {
                    profile.RequestedAcces = true;
                    db.SaveChanges();
                }
                else
                {
                    var myProfile = new UserProfile { IdUser = userId, RequestedAcces = true, IdCity=1, City="Iasi", MinPrice=0,MaxPrice=100, MinRating=1 };
                    db.UserProfiles.Add(myProfile);
                    db.SaveChanges();
                }
            }
        }
    }
}

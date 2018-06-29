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
                db.AspNetUsers.Remove(user);
                db.SaveChanges();
            }
        }

    }
}

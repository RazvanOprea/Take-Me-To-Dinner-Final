//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Business.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserSearchHistoryModel
    {
        public int IdSearch { get; set; }
        public string IdUser { get; set; }
        public int IdPlace { get; set; }
    
        public virtual PlaceModel Place { get; set; }
    }
}

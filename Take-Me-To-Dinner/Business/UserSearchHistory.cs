//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Business
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserSearchHistory
    {
        public int IdSearch { get; set; }
        public string IdUser { get; set; }
        public int IdPlace { get; set; }
    
        public virtual Place Place { get; set; }
    }
}

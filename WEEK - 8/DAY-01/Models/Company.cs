using System.ComponentModel.DataAnnotations;

namespace WebApplication7.Models
{
    public class Company
    {
        [Key]
        public int CompanyId { get; set; }

        [Required]
        public string CompanyName { get; set; } 

            // Navigation Property
            public List<ContactInfo> Contacts { get; set; }
    }
}
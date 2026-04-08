using System.ComponentModel.DataAnnotations;

namespace WebApplication7.Models
{
    public class Department
    {
        [Key]
        public int DepartmentId { get; set; }

        [Required]
        public string DepartmentName { get; set; } = string.Empty;

        // Navigation Property
        public List<ContactInfo> Contacts
        {
            get; set;
        }
    }
}
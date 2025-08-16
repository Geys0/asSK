using System.ComponentModel.DataAnnotations;

namespace asSK.Domain.Entities;

public class User
{
    public Guid Id { get; set; }
    
    [Required]
    [MaxLength(100)]
    public string Name { get; set; } = string.Empty;
    
    [Required]
    [EmailAddress]
    [MaxLength(255)]
    public string Email { get; set; } = string.Empty;
    
    [MaxLength(20)]
    public string? Phone { get; set; }
    
    [Required]
    public string PasswordHash { get; set; } = string.Empty;
    
    public string? Avatar { get; set; }
    
    public bool IsVerified { get; set; } = false;
    
    public bool IsActive { get; set; } = true;
    
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    
    public DateTime? UpdatedAt { get; set; }
    
    public DateTime? LastLoginAt { get; set; }
    
    // Navigation properties
    public virtual ICollection<TaskItem> PostedTasks { get; set; } = new List<TaskItem>();
    public virtual ICollection<TaskAssignment> AcceptedTasks { get; set; } = new List<TaskAssignment>();
    public virtual ICollection<Review> GivenReviews { get; set; } = new List<Review>();
    public virtual ICollection<Review> ReceivedReviews { get; set; } = new List<Review>();
    public virtual ICollection<Message> SentMessages { get; set; } = new List<Message>();
    public virtual ICollection<Message> ReceivedMessages { get; set; } = new List<Message>();
    
    // User statistics
    public int TasksPosted { get; set; } = 0;
    public int TasksCompleted { get; set; } = 0;
    public decimal TotalEarnings { get; set; } = 0;
    public decimal TotalSpent { get; set; } = 0;
    public double AverageRating { get; set; } = 0;
    public int ReviewCount { get; set; } = 0;
}

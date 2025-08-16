using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore;

namespace asSK.Domain.Entities;

public class TaskItem
{
    public Guid Id { get; set; }
    
    [Required]
    [MaxLength(200)]
    public string Title { get; set; } = string.Empty;
    
    [Required]
    [MaxLength(2000)]
    public string Description { get; set; } = string.Empty;
    
    [Required]
    [MaxLength(50)]
    public string Category { get; set; } = string.Empty;
    
    public int BountyCents { get; set; } // Store in cents to avoid floating point issues
    
    public TaskStatus Status { get; set; } = TaskStatus.Open;
    
    public Guid PosterUserId { get; set; }
    
    // Location information
    public double Latitude { get; set; }
    public double Longitude { get; set; }
    
    [MaxLength(500)]
    public string? Address { get; set; }
    
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    
    public DateTime? UpdatedAt { get; set; }
    
    public DateTime? DueAt { get; set; }
    
    public DateTime? CompletedAt { get; set; }
    
    // Task metadata
    public int ViewCount { get; set; } = 0;
    public int ApplicationCount { get; set; } = 0;
    
    [MaxLength(1000)]
    public string? Requirements { get; set; }
    
    public bool IsUrgent { get; set; } = false;
    
    public bool IsFeatured { get; set; } = false;
    
    // Navigation properties
    public virtual User Poster { get; set; } = null!;
    public virtual TaskAssignment? Assignment { get; set; }
    public virtual ICollection<Review> Reviews { get; set; } = new List<Review>();
    public virtual ICollection<TaskImage> Images { get; set; } = new List<TaskImage>();
}

public enum TaskStatus
{
    Open,
    Accepted,
    InProgress,
    Completed,
    Cancelled,
    Expired
}

public class TaskImage
{
    public Guid Id { get; set; }
    public Guid TaskId { get; set; }
    public string ImageUrl { get; set; } = string.Empty;
    public string? Caption { get; set; }
    public int Order { get; set; } = 0;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    
    public virtual TaskItem Task { get; set; } = null!;
}

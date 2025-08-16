using System.ComponentModel.DataAnnotations;

namespace asSK.Domain.Entities;

public class Review
{
    public Guid Id { get; set; }
    
    public Guid FromUserId { get; set; }
    
    public Guid ToUserId { get; set; }
    
    public Guid TaskId { get; set; }
    
    [Range(1, 5)]
    public int Rating { get; set; }
    
    [Required]
    [MaxLength(1000)]
    public string Comment { get; set; } = string.Empty;
    
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    
    public DateTime? UpdatedAt { get; set; }
    
    public bool IsEdited { get; set; } = false;
    
    public bool IsHidden { get; set; } = false;
    
    [MaxLength(500)]
    public string? AdminNotes { get; set; }
    
    // Navigation properties
    public virtual User FromUser { get; set; } = null!;
    public virtual User ToUser { get; set; } = null!;
    public virtual TaskItem Task { get; set; } = null!;
}

using System.ComponentModel.DataAnnotations;

namespace asSK.Domain.Entities;

public class Message
{
    public Guid Id { get; set; }
    
    public Guid FromUserId { get; set; }
    
    public Guid ToUserId { get; set; }
    
    public Guid? TaskId { get; set; }
    
    [Required]
    [MaxLength(2000)]
    public string Content { get; set; } = string.Empty;
    
    public MessageType Type { get; set; } = MessageType.Text;
    
    public string? AttachmentUrl { get; set; }
    
    public string? AttachmentName { get; set; }
    
    public long? AttachmentSize { get; set; }
    
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    
    public DateTime? ReadAt { get; set; }
    
    public bool IsEdited { get; set; } = false;
    
    public DateTime? EditedAt { get; set; }
    
    public bool IsDeleted { get; set; } = false;
    
    public DateTime? DeletedAt { get; set; }
    
    // Navigation properties
    public virtual User FromUser { get; set; } = null!;
    public virtual User ToUser { get; set; } = null!;
    public virtual TaskItem? Task { get; set; }
}

public enum MessageType
{
    Text,
    Image,
    File,
    Location,
    TaskOffer,
    TaskAccept,
    TaskComplete,
    Payment,
    System
}

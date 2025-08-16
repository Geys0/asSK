using System.ComponentModel.DataAnnotations;

namespace asSK.Domain.Entities;

public class TaskAssignment
{
    public Guid Id { get; set; }
    
    public Guid TaskId { get; set; }
    
    public Guid WorkerUserId { get; set; }
    
    public DateTime AcceptedAt { get; set; } = DateTime.UtcNow;
    
    public DateTime? StartedAt { get; set; }
    
    public DateTime? CompletedAt { get; set; }
    
    public DateTime? CancelledAt { get; set; }
    
    public AssignmentStatus Status { get; set; } = AssignmentStatus.Accepted;
    
    [MaxLength(1000)]
    public string? WorkerNotes { get; set; }
    
    [MaxLength(1000)]
    public string? PosterNotes { get; set; }
    
    public decimal? FinalAmountCents { get; set; }
    
    public bool IsDisputed { get; set; } = false;
    
    [MaxLength(1000)]
    public string? DisputeReason { get; set; }
    
    // Navigation properties
    public virtual TaskItem Task { get; set; } = null!;
    public virtual User Worker { get; set; } = null!;
}

public enum AssignmentStatus
{
    Accepted,
    InProgress,
    Completed,
    Cancelled,
    Disputed
}

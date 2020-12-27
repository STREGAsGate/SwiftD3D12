
import _d3d12

/// Defines priority levels for a command queue.
public enum CommandQueuePriority {
    ///	Normal priority.
    case normal
    ///	High priority.
    case high
    ///	Global realtime priority.
    case globalRealtime

    internal var rawValue: _d3d12.D3D12_COMMAND_QUEUE_PRIORITY {
        switch self {
        case .normal:
            return _d3d12.D3D12_COMMAND_QUEUE_PRIORITY_NORMAL
        case .high:
            return _d3d12.D3D12_COMMAND_QUEUE_PRIORITY_HIGH
        case .globalRealtime:
            return _d3d12.D3D12_COMMAND_QUEUE_PRIORITY_GLOBAL_REALTIME
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "CommandQueuePriority")
public typealias D3D12_COMMAND_QUEUE_PRIORITY = CommandQueuePriority

public extension CommandQueuePriority  {
    @available(*, deprecated, renamed: "normal")
    static let D3D12_COMMAND_QUEUE_PRIORITY_NORMAL = Self.normal
  
    @available(*, deprecated, renamed: "high")
    static let D3D12_COMMAND_QUEUE_PRIORITY_HIGH = Self.high
  
    @available(*, deprecated, renamed: "globalRealtime")
    static let D3D12_COMMAND_QUEUE_PRIORITY_GLOBAL_REALTIME = Self.globalRealtime
}
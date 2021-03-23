/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the memory pool for the heap.
public enum D3DMemoryPool {
    public typealias RawValue = WinSDK.D3D12_MEMORY_POOL

    ///	The memory pool is unknown.
    case unknow
    ///	The memory pool is L0.
    /// L0 is the physical system memory pool.
    /// When the adapter is discrete/NUMA, this pool has greater bandwidth for the CPU and less bandwidth for the GPU.
    /// When the adapter is UMA, this pool is the only one which is valid.
    case shared
    ///	The memory pool is L1.
    /// L1 is typically known as the physical video memory pool.
    /// L1 is only available when the adapter is discrete/NUMA, and has greater bandwidth for the GPU and cannot even be accessed by the CPU.
    /// When the adapter is UMA, this pool is not available.
    case dedicated

    case _unimplemented(RawValue)

    public var rawValue: RawValue {
        switch self {
        case .unknow:
            return WinSDK.D3D12_MEMORY_POOL_UNKNOWN
        case .shared:
            return WinSDK.D3D12_MEMORY_POOL_L0
        case .dedicated:
            return WinSDK.D3D12_MEMORY_POOL_L1
        case let ._unimplemented(rawValue):
            return rawValue
        }
    }

    public init(_ rawValue: RawValue) {
        switch rawValue {
        case WinSDK.D3D12_MEMORY_POOL_UNKNOWN:
            self = .unknow
        case WinSDK.D3D12_MEMORY_POOL_L0:
            self = .shared
        case WinSDK.D3D12_MEMORY_POOL_L1:
            self = .dedicated
        default:
            self = ._unimplemented(rawValue)
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DMemoryPool")
public typealias D3D12_MEMORY_POOL = D3DMemoryPool


@available(*, deprecated, renamed: "D3DMemoryPool.unknow")
public let D3D12_MEMORY_POOL_UNKNOWN = D3DMemoryPool.unknow

@available(*, deprecated, renamed: "D3DMemoryPool.shared")
public let D3D12_MEMORY_POOL_L0 = D3DMemoryPool.shared

@available(*, deprecated, renamed: "D3DMemoryPool.dedicated")
public let D3D12_MEMORY_POOL_L1 = D3DMemoryPool.dedicated

#endif

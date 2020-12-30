/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Describes the level of support for shader caching in the current graphics driver.
public struct ShaderCacheSupportFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates that the driver does not support shader caching.
    //static let none = ShaderCacheSupportFlags(rawValue: _d3d12.D3D12_SHADER_CACHE_SUPPORT_NONE.rawValue)

    ///	Indicates that the driver supports the CachedPSO member of the D3D12_GRAPHICS_PIPELINE_STATE_DESC and D3D12_COMPUTE_PIPELINE_STATE_DESC structures. This is always supported.
    static let singlePSO = ShaderCacheSupportFlags(rawValue: _d3d12.D3D12_SHADER_CACHE_SUPPORT_SINGLE_PSO.rawValue)
    ///	Indicates that the driver supports the ID3D12PipelineLibrary interface, which provides application-controlled PSO grouping and caching. This is supported by drivers targetting the Windows 10 Anniversary Update.
    static let library = ShaderCacheSupportFlags(rawValue: _d3d12.D3D12_SHADER_CACHE_SUPPORT_LIBRARY.rawValue)
    ///	Indicates that the driver supports an OS-managed shader cache that stores compiled shaders in memory during the current run of the application.
    static let automaticInProcessCache = ShaderCacheSupportFlags(rawValue: _d3d12.D3D12_SHADER_CACHE_SUPPORT_AUTOMATIC_INPROC_CACHE.rawValue)
    ///	Indicates that the driver supports an OS-managed shader cache that stores compiled shaders on disk to accelerate future runs of the application.
    static let automaticDiskCache = ShaderCacheSupportFlags(rawValue: _d3d12.D3D12_SHADER_CACHE_SUPPORT_AUTOMATIC_DISK_CACHE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ShaderCacheSupportFlags")
public typealias D3D12_SHADER_CACHE_SUPPORT_FLAGS = ShaderCacheSupportFlags

public extension ShaderCacheSupportFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_SHADER_CACHE_SUPPORT_NONE: ShaderCacheSupportFlags = []

    @available(*, deprecated, renamed: "singlePSO")
    static let D3D12_SHADER_CACHE_SUPPORT_SINGLE_PSO = Self.singlePSO
    
    @available(*, deprecated, renamed: "library")
    static let D3D12_SHADER_CACHE_SUPPORT_LIBRARY = Self.library
    
    @available(*, deprecated, renamed: "automaticInProcessCache")
    static let D3D12_SHADER_CACHE_SUPPORT_AUTOMATIC_INPROC_CACHE = Self.automaticInProcessCache
    
    @available(*, deprecated, renamed: "automaticDiskCache")
    static let D3D12_SHADER_CACHE_SUPPORT_AUTOMATIC_DISK_CACHE = Self.automaticDiskCache
}

#endif

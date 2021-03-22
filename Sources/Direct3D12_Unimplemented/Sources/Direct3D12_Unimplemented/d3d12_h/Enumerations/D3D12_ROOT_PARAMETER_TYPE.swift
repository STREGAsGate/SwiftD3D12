/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of root signature slot.
public enum RootParameterType {
    ///	The slot is for a descriptor table.
    case descriptorTable
    ///	The slot is for root constants.
    case constants
    ///	The slot is for a constant-buffer view (CBV).
    case constantBufferView
    ///	The slot is for a shader-resource view (SRV).
    case shaderResourceView
    ///	The slot is for a unordered-access view (UAV).
    case unorderedAccessView

    internal var rawValue: WinSDK.D3D12_ROOT_PARAMETER_TYPE {
        switch self {
        case .descriptorTable:
            return WinSDK.D3D12_ROOT_PARAMETER_TYPE_DESCRIPTOR_TABLE
        case .constants:
            return WinSDK.D3D12_ROOT_PARAMETER_TYPE_32BIT_CONSTANTS
        case .constantBufferView:
            return WinSDK.D3D12_ROOT_PARAMETER_TYPE_CBV
        case .shaderResourceView:
            return WinSDK.D3D12_ROOT_PARAMETER_TYPE_SRV
        case .unorderedAccessView:
            return WinSDK.D3D12_ROOT_PARAMETER_TYPE_UAV
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RootParameterType")
public typealias D3D12_ROOT_PARAMETER_TYPE = RootParameterType

public extension RootParameterType  {
    @available(*, deprecated, renamed: "descriptorTable")
    static let D3D12_ROOT_PARAMETER_TYPE_DESCRIPTOR_TABLE = Self.descriptorTable

    @available(*, deprecated, renamed: "constants")
    static let D3D12_ROOT_PARAMETER_TYPE_32BIT_CONSTANTS = Self.constants

    @available(*, deprecated, renamed: "constantBufferView")
    static let D3D12_ROOT_PARAMETER_TYPE_CBV = Self.constantBufferView

    @available(*, deprecated, renamed: "shaderResourceView")
    static let D3D12_ROOT_PARAMETER_TYPE_SRV = Self.shaderResourceView

    @available(*, deprecated, renamed: "unorderedAccessView")
    static let D3D12_ROOT_PARAMETER_TYPE_UAV = Self.unorderedAccessView
}

#endif
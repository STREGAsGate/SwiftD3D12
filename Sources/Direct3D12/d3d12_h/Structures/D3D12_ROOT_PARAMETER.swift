/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the slot of a root signature version 1.0.
public struct D3DRootParameter {
    public typealias RawValue = WinSDK.D3D12_ROOT_PARAMETER
    internal var rawValue: RawValue

    /// A D3D12_ROOT_PARAMETER_TYPE-typed value that specifies the type of root signature slot. This member determines which type to use in the union below.
    public var `type`: D3DRootParameterType {
        get {
            return D3DRootParameterType(rawValue.ParameterType)
        }
        set {
            rawValue.ParameterType = newValue.rawValue
        }
    }

    /// A D3D12_ROOT_DESCRIPTOR_TABLE structure that describes the layout of a descriptor table as a collection of descriptor ranges that appear one after the other in a descriptor heap.
    public var descriptorTable: D3DRootDescriptorTable {
        get {
            return D3DRootDescriptorTable(rawValue.DescriptorTable)
        }
        set {
            rawValue.DescriptorTable = newValue.rawValue
        }
    }

    /// A D3D12_ROOT_CONSTANTS structure that describes constants inline in the root signature that appear in shaders as one constant buffer.
    public var constants: D3DRootConstants {
        get {
            return D3DRootConstants(rawValue.Constants)
        }
        set {
            rawValue.Constants = newValue.rawValue
        }
    }

    /// A D3D12_ROOT_DESCRIPTOR structure that describes descriptors inline in the root signature that appear in shaders.
    public var descriptor: D3DRootDescriptor {
        get {
            return D3DRootDescriptor(rawValue.Descriptor)
        }
        set {
            rawValue.Descriptor = newValue.rawValue
        }
    }

    /// A D3D12_SHADER_VISIBILITY-typed value that specifies the shaders that can access the contents of the root signature slot.
    public var shaderVisibility: D3DShaderVisibility {
        get {
            return D3DShaderVisibility(rawValue.ShaderVisibility)
        }
        set {
            rawValue.ShaderVisibility = newValue.rawValue
        }
    }

    /** Describes the slot of a root signature version 1.0.
    - parameter type: A D3D12_ROOT_PARAMETER_TYPE-typed value that specifies the type of root signature slot. This member determines which type to use in the union below.
    - parameter descriptorTable: A D3D12_ROOT_DESCRIPTOR_TABLE structure that describes the layout of a descriptor table as a collection of descriptor ranges that appear one after the other in a descriptor heap.
    - parameter constants: A D3D12_ROOT_CONSTANTS structure that describes constants inline in the root signature that appear in shaders as one constant buffer.
    - parameter descriptor: A D3D12_ROOT_DESCRIPTOR structure that describes descriptors inline in the root signature that appear in shaders.
    - parameter shaderVisibility: A D3D12_SHADER_VISIBILITY-typed value that specifies the shaders that can access the contents of the root signature slot.
    */
    public init(type: D3DRootParameterType,
                descriptorTable: D3DRootDescriptorTable,
                constants: D3DRootConstants,
                descriptor: D3DRootDescriptor,
                shaderVisibility: D3DShaderVisibility) {
        self.rawValue = RawValue()
        self.type = type
        self.descriptorTable = descriptorTable
        self.constants = constants
        self.descriptor = descriptor
        self.shaderVisibility = shaderVisibility
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DRootParameter")
public typealias D3D12_ROOT_PARAMETER = D3DRootParameter

#endif
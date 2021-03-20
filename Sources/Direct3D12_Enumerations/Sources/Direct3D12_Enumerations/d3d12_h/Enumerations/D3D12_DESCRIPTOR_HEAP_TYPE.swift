/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies a type of descriptor heap.
public enum D3DDescriptorHeapType {
    public typealias RawValue = WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE
    ///	The descriptor heap for the combination of constant-buffer, shader-resource, and unordered-access views.
    case constantBufferShaderResourceAndUnordererAccess
    ///	The descriptor heap for the sampler.
    case sampler
    ///	The descriptor heap for the render-target view.
    case renderTargetView
    ///	The descriptor heap for the depth-stencil view.
    case depthStencilView
    ///	The number of types of descriptor heaps.
    case numberOfTypes

    public var rawValue: RawValue {
        switch self {
        case .constantBufferShaderResourceAndUnordererAccess:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV
        case .sampler:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER
        case .renderTargetView:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_RTV
        case .depthStencilView:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_DSV
        case .numberOfTypes:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_NUM_TYPES
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DDescriptorHeapType")
public typealias D3D12_DESCRIPTOR_HEAP_TYPE = D3DDescriptorHeapType


@available(*, deprecated, renamed: "D3DDescriptorHeapType.constantBufferShaderResourceAndUnordererAccess")
public let D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV = D3DDescriptorHeapType.constantBufferShaderResourceAndUnordererAccess

@available(*, deprecated, renamed: "D3DDescriptorHeapType.sampler")
public let D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER = D3DDescriptorHeapType.sampler

@available(*, deprecated, renamed: "D3DDescriptorHeapType.renderTargetView")
public let D3D12_DESCRIPTOR_HEAP_TYPE_RTV = D3DDescriptorHeapType.renderTargetView

@available(*, deprecated, renamed: "D3DDescriptorHeapType.depthStencilView")
public let D3D12_DESCRIPTOR_HEAP_TYPE_DSV = D3DDescriptorHeapType.depthStencilView

@available(*, deprecated, renamed: "D3DDescriptorHeapType.numberOfTypes")
public let D3D12_DESCRIPTOR_HEAP_TYPE_NUM_TYPES = D3DDescriptorHeapType.numberOfTypes

#endif

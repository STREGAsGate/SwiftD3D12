/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the type of a state object. Use with D3D12_STATE_OBJECT_DESC.
public enum StateObjectType {
    ///	Collection state object.
    case collection
    ///	Raytracing pipeline state object.
    case raytracingPipeline

    internal var rawValue: _d3d12.D3D12_STATE_OBJECT_TYPE {
        switch self {
        case .collection:
            return _d3d12.D3D12_STATE_OBJECT_TYPE_COLLECTION
        case .raytracingPipeline:
            return _d3d12.D3D12_STATE_OBJECT_TYPE_RAYTRACING_PIPELINE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "StateObjectType")
public typealias D3D12_STATE_OBJECT_TYPE = StateObjectType

public extension StateObjectType  {
    @available(*, deprecated, renamed: "collection")
    static let D3D12_STATE_OBJECT_TYPE_COLLECTION = Self.collection

    @available(*, deprecated, renamed: "raytracingPipeline")
    static let D3D12_STATE_OBJECT_TYPE_RAYTRACING_PIPELINE = Self.raytracingPipeline
}

#endif

/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the type of a raytracing hit group state subobject. Use a value from this enumeration with the D3D12_HIT_GROUP_DESC structure.
public enum HitGroupType {
    ///	The hit group uses a list of triangles to calculate ray hits. Hit groups that use triangles can’t contain an intersection shader.
    case triangles
    ///	The hit group uses a procedural primitive within a bounding box to calculate ray hits. Hit groups that use procedural primitives must contain an intersection shader.
    case proceduralPrimitive

    internal var rawValue: _d3d12.D3D12_HIT_GROUP_TYPE {
        switch self {
        case .triangles:
            return _d3d12.D3D12_HIT_GROUP_TYPE_TRIANGLES
        case .proceduralPrimitive:
            return _d3d12.D3D12_HIT_GROUP_TYPE_PROCEDURAL_PRIMITIVE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "HitGroupType")
public typealias D3D12_HIT_GROUP_TYPE = HitGroupType

public extension HitGroupType  {
    @available(*, deprecated, renamed: "triangles")
    static let D3D12_HIT_GROUP_TYPE_TRIANGLES = Self.triangles

    @available(*, deprecated, renamed: "proceduralPrimitive")
    static let D3D12_HIT_GROUP_TYPE_PROCEDURAL_PRIMITIVE = Self.proceduralPrimitive
}

#endif
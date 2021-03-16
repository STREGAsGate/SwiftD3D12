/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct RaytracingGeometryAABBsDescription {
    internal var rawValue: WinSDK.D3D12_RAYTRACING_GEOMETRY_AABBS_DESC


    internal init(_ rawValue: WinSDK.D3D12_RAYTRACING_GEOMETRY_AABBS_DESC) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingGeometryAABBsDescription")
public typealias D3D12_RAYTRACING_GEOMETRY_AABBS_DESC = RaytracingGeometryAABBsDescription

#endif
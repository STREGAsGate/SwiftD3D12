/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies triangles facing a particular direction are not drawn.
public enum D3DCullMode {
    public typealias RawValue = WinSDK.D3D12_CULL_MODE

    ///	Always draw all triangles.
    case disabled
    ///	Do not draw triangles that are front-facing.
    case front
    ///	Do not draw triangles that are back-facing.
    case back

    case _unimplemented(RawValue)

    public var rawValue: RawValue {
        switch self {
        case .disabled:
            return WinSDK.D3D12_CULL_MODE_NONE
        case .front:
            return WinSDK.D3D12_CULL_MODE_FRONT
        case .back:
            return WinSDK.D3D12_CULL_MODE_BACK
        case let ._unimplemented(rawValue):
            return rawValue
        }
    }

    public init(_ rawValue: RawValue) {
        switch rawValue {
        case WinSDK.D3D12_CULL_MODE_NONE:
            self = .disabled
        case WinSDK.D3D12_CULL_MODE_FRONT:
            self = .front
        case WinSDK.D3D12_CULL_MODE_BACK:
            self = .back
        default:
            self = ._unimplemented(rawValue)
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DCullMode")
public typealias D3D12_CULL_MODE = D3DCullMode


@available(*, deprecated, renamed: "D3DCullMode.disabled")
public let D3D12_CULL_MODE_NONE = D3DCullMode.disabled

@available(*, deprecated, renamed: "D3DCullMode.front")
public let D3D12_CULL_MODE_FRONT = D3DCullMode.front

@available(*, deprecated, renamed: "D3DCullMode.back")
public let D3D12_CULL_MODE_BACK = D3DCullMode.back

#endif

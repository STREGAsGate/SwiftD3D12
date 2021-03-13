/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Identifies whether conservative rasterization is on or off.
public enum ConservativeRasterizationMode {
    ///	Conservative rasterization is off.
    case off
    ///	Conservative rasterization is on.
    case on

    internal var rawValue: WinSDK.D3D12_CONSERVATIVE_RASTERIZATION_MODE {
        switch self {
        case .off:
            return WinSDK.D3D12_CONSERVATIVE_RASTERIZATION_MODE_OFF
        case .on:
            return WinSDK.D3D12_CONSERVATIVE_RASTERIZATION_MODE_ON
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ConservativeRasterizationMode")
public typealias D3D12_CONSERVATIVE_RASTERIZATION_MODE = ConservativeRasterizationMode

public extension ConservativeRasterizationMode  {
    @available(*, deprecated, renamed: "off")
    static let D3D12_CONSERVATIVE_RASTERIZATION_MODE_OFF = Self.off
    
    @available(*, deprecated, renamed: "on")
    static let D3D12_CONSERVATIVE_RASTERIZATION_MODE_ON = Self.on
}

#endif
/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct RenderTargetFormatArray {
    internal var rawValue: WinSDK.D3D12_RT_FORMAT_ARRAY


    internal init(_ rawValue: WinSDK.D3D12_RT_FORMAT_ARRAY) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RenderTargetFormatArray")
public typealias D3D12_RT_FORMAT_ARRAY = RenderTargetFormatArray

#endif
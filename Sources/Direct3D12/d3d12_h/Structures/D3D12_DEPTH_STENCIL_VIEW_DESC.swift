/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct D3DDepthStencilViewDescription {
    internal var rawValue: WinSDK.D3D12_DEPTH_STENCIL_VIEW_DESC


    internal init(_ rawValue: WinSDK.D3D12_DEPTH_STENCIL_VIEW_DESC) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DDepthStencilViewDescription")
public typealias D3D12_DEPTH_STENCIL_VIEW_DESC = D3DDepthStencilViewDescription

#endif
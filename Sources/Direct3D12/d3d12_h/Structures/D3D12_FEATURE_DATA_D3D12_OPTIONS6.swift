/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct FeatureDataD3d12Options6 {
    internal var rawValue: WinSDK.D3D12_FEATURE_DATAWinSDK_OPTIONS6


    internal init(_ rawValue: WinSDK.D3D12_FEATURE_DATAWinSDK_OPTIONS6) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FeatureDataD3d12Options6")
public typealias D3D12_FEATURE_DATAWinSDK_OPTIONS6 = FeatureDataD3d12Options6

#endif

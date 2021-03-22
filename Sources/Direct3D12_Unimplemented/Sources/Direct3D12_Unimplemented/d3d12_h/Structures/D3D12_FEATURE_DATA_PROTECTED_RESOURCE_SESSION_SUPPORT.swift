/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct FeatureDataProtectedResourceSessionSupport {
    internal var rawValue: WinSDK.D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_SUPPORT


    internal init(_ rawValue: WinSDK.D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_SUPPORT) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FeatureDataProtectedResourceSessionSupport")
public typealias D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_SUPPORT = FeatureDataProtectedResourceSessionSupport

#endif
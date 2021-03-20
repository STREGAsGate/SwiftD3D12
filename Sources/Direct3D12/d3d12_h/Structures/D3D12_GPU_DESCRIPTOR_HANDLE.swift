/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct D3DGPUDescriptorHandle {
    internal var rawValue: WinSDK.D3D12_GPU_DESCRIPTOR_HANDLE


    internal init(_ rawValue: WinSDK.D3D12_GPU_DESCRIPTOR_HANDLE) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DGPUDescriptorHandle")
public typealias D3D12_GPU_DESCRIPTOR_HANDLE = D3DGPUDescriptorHandle

#endif

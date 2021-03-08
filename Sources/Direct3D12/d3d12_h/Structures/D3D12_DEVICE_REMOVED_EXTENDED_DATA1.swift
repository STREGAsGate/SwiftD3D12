/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct DeviceRemovedExtendedData1 {
    internal var rawValue: WinSDK.D3D12_DEVICE_REMOVED_EXTENDED_DATA1


    internal init(_ rawValue: WinSDK.D3D12_DEVICE_REMOVED_EXTENDED_DATA1) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DeviceRemovedExtendedData1")
public typealias D3D12_DEVICE_REMOVED_EXTENDED_DATA1 = DeviceRemovedExtendedData1

#endif

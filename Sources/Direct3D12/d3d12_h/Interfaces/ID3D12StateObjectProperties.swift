/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

public class StateObjectProperties: IUnknown {
    
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "StateObjectProperties")
public typealias ID3D12StateObjectProperties = StateObjectProperties

#endif
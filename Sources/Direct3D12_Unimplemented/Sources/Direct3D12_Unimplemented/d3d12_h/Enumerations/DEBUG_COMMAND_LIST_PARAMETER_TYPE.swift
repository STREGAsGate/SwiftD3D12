/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Indicates the debug parameter type used by [ID3D12DebugCommandList1::SetDebugParameter](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-setdebugparameter) and [ID3D12DebugCommandList1::GetDebugParameter](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-getdebugparameter).
public enum DebugCommandListParameterType {
    ///	Indicates the parameter is type [D3D12_DEBUG_COMMAND_LIST_GPU_BASED_VALIDATION_SETTINGS](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_command_list_gpu_based_validation_settings).
    case gpuBasedValidationSettings

    internal var rawValue: WinSDK.D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE {
        switch self {
            case .gpuBasedValidationSettings:
                return WinSDK.D3D12_DEBUG_COMMAND_LIST_PARAMETER_GPU_BASED_VALIDATION_SETTINGS
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DebugCommandListParameterType")
public typealias D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE = DebugCommandListParameterType

public extension DebugCommandListParameterType  {
    @available(*, deprecated, renamed: "gpuBasedValidationSettings")
    static let D3D12_DEBUG_COMMAND_LIST_PARAMETER_GPU_BASED_VALIDATION_SETTINGS = Self.gpuBasedValidationSettings
}

#endif

/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the blend state.
public struct D3DBlendDescription {
    public typealias RawValue = WinSDK.D3D12_BLEND_DESC
    internal var rawValue: RawValue

    /// Specifies whether to use alpha-to-coverage as a multisampling technique when setting a pixel to a render target. For more info about using alpha-to-coverage, see Alpha-To-Coverage.
    public var alphaToCoverageEnabled: Bool {
        get {
            return rawValue.AlphaToCoverageEnable.boolValue
        }
        set {
            rawValue.AlphaToCoverageEnable = WindowsBool(booleanLiteral: newValue)
        }
    }

    /// Specifies whether to enable independent blending in simultaneous render targets. Set to TRUE to enable independent blending. If set to FALSE, only the RenderTarget[0] members are used; RenderTarget[1..7] are ignored.
    public var independentBlendEnabled: Bool {
        get {
            return rawValue.IndependentBlendEnable.boolValue
        }
        set {
            rawValue.IndependentBlendEnable = WindowsBool(booleanLiteral: newValue)
        }
    }

    /// An array of D3D12_RENDER_TARGET_BLEND_DESC structures that describe the blend states for render targets; these correspond to the eight render targets that can be bound to the output-merger stage at one time.
    public var renderTarget: [D3DRenderTargetBlendDescription] {
        get {
            return withUnsafePointer(to: rawValue.RenderTarget.0) {p in
                let buffer = UnsafeBufferPointer(start: p, count: MemoryLayout.size(ofValue: rawValue.RenderTarget))
                return buffer.map({D3DRenderTargetBlendDescription($0)})
            }
        }
        set {
            typealias Tuple = (D3DRenderTargetBlendDescription.RawValue, D3DRenderTargetBlendDescription.RawValue,
                               D3DRenderTargetBlendDescription.RawValue, D3DRenderTargetBlendDescription.RawValue,
                               D3DRenderTargetBlendDescription.RawValue, D3DRenderTargetBlendDescription.RawValue,
                               D3DRenderTargetBlendDescription.RawValue, D3DRenderTargetBlendDescription.RawValue)
            newValue.map({$0.rawValue}).withUnsafeBytes {buf in
                rawValue.RenderTarget = buf.bindMemory(to: Tuple.self)[0]  
            } 
        }
    }

    /// Describes the blend state.
    public init() {
        self.rawValue = RawValue()
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DBlendDescription")
public typealias D3D12_BLEND_DESC = D3DBlendDescription 

#endif

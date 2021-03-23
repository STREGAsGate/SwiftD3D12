/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the input-buffer data for the input-assembler stage.
public struct D3DInputLayoutDesription {
    public typealias RawValue = WinSDK.D3D12_INPUT_LAYOUT_DESC
    internal var rawValue: RawValue

    /// An array of D3D12_INPUT_ELEMENT_DESC structures that describe the data types of the input-assembler stage.
    public var elementDescriptions: [D3DInputElementDescription] {
        get {
            let buffer = UnsafeBufferPointer(start: rawValue.pInputElementDescs, count: Int(rawValue.NumElements))
            return buffer.map({D3DInputElementDescription($0)})
        }
        set {
            newValue.map({$0.rawValue}).withUnsafeBufferPointer {
                rawValue.pInputElementDescs = $0.baseAddress!
            }
            rawValue.NumElements = UInt32(newValue.count)
        }
    }

    /** Describes the input-buffer data for the input-assembler stage.
    - parameter elementDescriptions: An array of D3D12_INPUT_ELEMENT_DESC structures that describe the data types of the input-assembler stage.
    */
    public init(elementDescriptions: [D3DInputElementDescription]) {
        self.rawValue = RawValue()
        self.elementDescriptions = elementDescriptions
    }

    /// Describes the input-buffer data for the input-assembler stage.
    public init() {
        self.rawValue = RawValue()
    }

    internal init(_ rawValue: WinSDK.D3D12_INPUT_LAYOUT_DESC) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DInputLayoutDesription")
public typealias D3D12_INPUT_LAYOUT_DESC = D3DInputLayoutDesription

#endif

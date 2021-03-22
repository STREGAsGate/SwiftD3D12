/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class DGISwapChain: DGIDeviceSubObject {

    /** Accesses one of the swap-chain's back buffers.
    - parameter index: A zero-based buffer index.
    - returns: A pointer to a back-buffer interface.
    */
    public func backBuffer(at index: UInt32) throws -> D3DResource {
        return try perform(as: RawValue.self) {pThis in
            let Buffer = index
            var riid = D3DResource.interfaceID
            var ppSurface: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.GetBuffer(pThis, Buffer, &riid, &ppSurface).checkResult()
            guard let p = ppSurface else {throw Error(.invalidArgument)}
            return D3DResource(win32Pointer: p)
        }
    }

    /** Changes the swap chain's back buffer size, format, and number of buffers. This should be called when the application window is resized.
    - parameter count: The number of buffers in the swap chain (including all back and front buffers). This number can be different from the number of buffers with which you created the swap chain. This number can't be greater than DXGI_MAX_SWAP_CHAIN_BUFFERS. Set this number to zero to preserve the existing number of buffers in the swap chain. You can't specify less than two buffers for the flip presentation model.
    - parameter width: The new width of the back buffer. If you specify zero, DXGI will use the width of the client area of the target window. You can't specify the width as zero if you called the IDXGIFactory2::CreateSwapChainForComposition method to create the swap chain for a composition surface.
    - parameter height: The new height of the back buffer. If you specify zero, DXGI will use the height of the client area of the target window. You can't specify the height as zero if you called the IDXGIFactory2::CreateSwapChainForComposition method to create the swap chain for a composition surface.
    - parameter format: A DXGI_FORMAT-typed value for the new format of the back buffer. Set this value to DXGI_FORMAT_UNKNOWN to preserve the existing format of the back buffer. The flip presentation model supports a more restricted set of formats than the bit-block transfer (bitblt) model.
    - parameter flags: A combination of DXGI_SWAP_CHAIN_FLAG-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for swap-chain behavior.
    */
    public func resizeBuffers(count: UInt32 = 0, width: UInt32, height: UInt32, format: DGIFormat = .unknown, flags: DGISwapChainFlags = .allowModeSwitch) throws {
        try perform(as: RawValue.self) {pThis in
            let BufferCount = count
            let Width = width
            let Height = height
            let NewFormat = format.rawValue
            let SwapChainFlags = UInt32(flags.rawValue)
            try pThis.pointee.lpVtbl.pointee.ResizeBuffers(pThis, BufferCount, Width, Height, NewFormat, SwapChainFlags).checkResult() 
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension DGISwapChain {
    typealias RawValue = WinSDK.IDXGISwapChain1
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension DGISwapChain.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_IDXGISwapChain1}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "DGISwapChain")
public typealias IDXGISwapChain = DGISwapChain

public extension DGISwapChain {
    @available(*, unavailable, renamed: "backBuffer(at:)")
    func GetBuffer(_ Buffer: Any,
                   _ riid: Any,
                   _ ppSurface: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "resizeBuffers(count:width:height:format:flags:)")
    func ResizeBuffers(_ BufferCount: Any,
                       _ Width: Any,
                       _ Height: Any,
                       _ NewFormat: Any,
                       _ SwapChainFlags: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif

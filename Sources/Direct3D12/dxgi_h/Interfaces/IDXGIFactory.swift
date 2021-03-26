/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class DGIFactory: DGIObject {
    
    /** Enumerates the adapters (video cards).
    - parameter index: The index of the adapter to enumerate.
    */
    public func enumAdapter(at index: UInt32) throws -> DGIAdapter {
        return try perform(as: RawValue.self) {pThis in 
            let Adapter = index
            var ppAdapter: UnsafeMutablePointer<DGIAdapter.RawValue>?
            try pThis.pointee.lpVtbl.pointee.EnumAdapters(pThis, Adapter, &ppAdapter).checkResult()
            guard let v = DGIAdapter(winSDKPointer: ppAdapter) else {throw Error(.invalidArgument)}
            v.release()
            return v
        }
    }

    /// Creates an appropriate D3DDevice
    public func createDefaultDevice() throws -> D3DDevice {
        do {
            let adapter = try enumAdapter(at: 0)
            return try D3DDevice(adapter: adapter, minimumFeatureLevel: .v11)
        }catch{
            do {
                print("Failed to create hardware device: \(error)")
                print("Trying to create WARP (software) device...")
                let warpAdapter = try self.enumWarpAdapter() // A software adapter fallback
                let device = try D3DDevice(adapter: warpAdapter, minimumFeatureLevel: .v11)
                print("Successfully created WARP device.")
                return device
            }catch{
                throw Error("No supported devices found.")
            }
        }
    }

    public init() throws {
        #if DEBUG
        let flags = UInt32(DXGI_CREATE_FACTORY_DEBUG)
        #else
        let flags: UInt32 = 0
        #endif
        var riid = DGIFactory.interfaceID
        var ppFactory: UnsafeMutableRawPointer?
        try WinSDK.CreateDXGIFactory2(flags, &riid, &ppFactory).checkResult()
        guard let p = ppFactory else {throw Error(.invalidArgument)}
        super.init(winSDKPointer: p)!
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension DGIFactory {// Always use Factory4
    typealias RawValue = WinSDK.IDXGIFactory4
}
extension DGIFactory.RawValue {// Always use Factory4
    static var interfaceID: WinSDK.IID {WinSDK.IID_IDXGIFactory4}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DGIFactory")
public typealias IDXGIFactory = DGIFactory

public extension DGIFactory {
    @available(*, unavailable, renamed: "enumAdapter(at:)")
    func EnumAdapters(_ Adapter: Any,
                      _ ppAdapter: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
    @available(*, unavailable, renamed: "createSwapChain(destiption:window:fullScreen:commandQueue:)")
    func CreateSwapChain(_ pDevice: Any,
                         _ pDesc: Any,
                         _ ppSwapChain: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif

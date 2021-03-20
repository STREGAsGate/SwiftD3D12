/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies a range of tile mappings.
public struct D3DTileRangeFlags: OptionSet {
    public typealias RawType = WinSDK.D3D12_TILE_RANGE_FLAGS
    public typealias RawValue = WinSDK.D3D12_TILE_RANGE_FLAGS.RawValue
    public let rawValue: RawValue
    //Use an empty collection `[]` to represent none in Swift.
    ///// No tile-mapping flags are specified.
    //static let none = TileRangeFlags(rawValue: WinSDK.D3D12_TILE_RANGE_FLAG_NONE.rawValue)

    ///	The tile range is NULL.
    static let null = D3DTileRangeFlags(rawValue: WinSDK.D3D12_TILE_RANGE_FLAG_NULL.rawValue)
    ///	Skip the tile range.
    static let skip = D3DTileRangeFlags(rawValue: WinSDK.D3D12_TILE_RANGE_FLAG_SKIP.rawValue)
    ///	Reuse a single tile in the tile range.
    static let reuseSingleTile = D3DTileRangeFlags(rawValue: WinSDK.D3D12_TILE_RANGE_FLAG_REUSE_SINGLE_TILE.rawValue)

    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DTileRangeFlags")
public typealias D3D12_TILE_RANGE_FLAGS = D3DTileRangeFlags


@available(*, deprecated, message: "Use [] to represent none in Swift.")
public let D3D12_TILE_RANGE_FLAG_NONE: D3DTileRangeFlags = []

@available(*, deprecated, renamed: "D3DTileRangeFlags.null")
public let D3D12_TILE_RANGE_FLAG_NULL = D3DTileRangeFlags.null

@available(*, deprecated, renamed: "D3DTileRangeFlags.skip")
public let D3D12_TILE_RANGE_FLAG_SKIP = D3DTileRangeFlags.skip

@available(*, deprecated, renamed: "reuseSingleTile")
public let D3D12_TILE_RANGE_FLAG_REUSE_SINGLE_TILE = D3DTileRangeFlags.reuseSingleTile

#endif

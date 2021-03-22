/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

extension String {
    init(lpcwstr: LPCWSTR) {
        self.init(decodingCString: lpcwstr, as: UTF16.self)
    }

    var lpcwSTR: Array<WCHAR> {
        return self.withCString(encodedAs: UTF16.self) { buffer in
            return Array<WCHAR>(unsafeUninitializedCapacity: self.utf16.count + 1) {
                wcscpy_s($0.baseAddress, $0.count, buffer)
                $1 = $0.count
            }
        }
    }
}
//
// Copyright (C) 2020 Signal Messenger, LLC.
// All rights reserved.
//
// SPDX-License-Identifier: GPL-3.0-only
//
// Generated by zkgroup/codegen/codegen.py - do not edit

import Foundation
import libzkgroup

public class ProfileKeyCredentialPresentation : ByteArray {

  public static let SIZE: Int = 713

  public init(contents: [UInt8]) throws  {
    try super.init(newContents: contents, expectedLength: ProfileKeyCredentialPresentation.SIZE)

    
    let ffi_return = FFI_ProfileKeyCredentialPresentation_checkValidContents(self.contents, UInt32(self.contents.count))

    if (ffi_return == Native.FFI_RETURN_INPUT_ERROR) {
      throw ZkGroupException.InvalidInput
    }

    if (ffi_return != Native.FFI_RETURN_OK) {
      throw ZkGroupException.ZkGroupError
    }
  }

  public func getUuidCiphertext() throws  -> UuidCiphertext {
    var newContents: [UInt8] = Array(repeating: 0, count: UuidCiphertext.SIZE)

    let ffi_return = FFI_ProfileKeyCredentialPresentation_getUuidCiphertext(self.contents, UInt32(self.contents.count), &newContents, UInt32(newContents.count))

    if (ffi_return != Native.FFI_RETURN_OK) {
      throw ZkGroupException.ZkGroupError
    }

    do {
      return try UuidCiphertext(contents: newContents)
    } catch ZkGroupException.InvalidInput {
      throw ZkGroupException.AssertionError
    }

  }

  public func getProfileKeyCiphertext() throws  -> ProfileKeyCiphertext {
    var newContents: [UInt8] = Array(repeating: 0, count: ProfileKeyCiphertext.SIZE)

    let ffi_return = FFI_ProfileKeyCredentialPresentation_getProfileKeyCiphertext(self.contents, UInt32(self.contents.count), &newContents, UInt32(newContents.count))

    if (ffi_return != Native.FFI_RETURN_OK) {
      throw ZkGroupException.ZkGroupError
    }

    do {
      return try ProfileKeyCiphertext(contents: newContents)
    } catch ZkGroupException.InvalidInput {
      throw ZkGroupException.AssertionError
    }

  }

  public func serialize() -> [UInt8] {
    return contents
  }

}

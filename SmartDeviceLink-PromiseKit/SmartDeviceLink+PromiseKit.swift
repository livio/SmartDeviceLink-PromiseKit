//
//  SmartDeviceLink+PromiseKit.swift
//  SmartDeviceLink-PromiseKit
//
//  Created by Joel Fischer on 2/6/17.
//  Copyright © 2017 livio. All rights reserved.
//

import SmartDeviceLink
import PromiseKit

extension SDLFileManager {
    public func delete(name: String) -> Promise<UInt> {
        return Promise { fulfill, reject in
            deleteRemoteFile(withName: name, completionHandler: { (success, bytesAvailable, error) in
                if let error = error {
                    reject(error)
                } else {
                    fulfill(bytesAvailable)
                }
            })
        }
    }

    public func upload(file: SDLFile) -> Promise<UInt> {
        return Promise { fulfill, reject in
            uploadFile(file, completionHandler: { (success, bytesAvailable, error) in
                if let error = error {
                    reject(error)
                } else {
                    fulfill(bytesAvailable)
                }
            })
        }
    }
}

extension SDLManager {
    public func start() -> Promise<Void> {
        return Promise { fulfill, reject in
            start(readyHandler: { (success, error) in
                if let error = error {
                    reject(error)
                } else {
                    fulfill()
                }
            })
        }
    }

    public func send(request: SDLRPCRequest) -> Promise<(SDLRPCRequest, SDLRPCResponse)> {
        return Promise { fulfill, reject in
            send(request, withResponseHandler: { (request, response, error) in
                if let error = error {
                    reject(error)
                } else {
                    fulfill((request!, response!))
                }
            })
        }
    }
}

extension SDLPermissionManager {
    public func observe(rpcNames: [String], type: SDLPermissionGroupType) -> Promise<([String: NSNumber], SDLPermissionGroupStatus)> {
        return wrap{ addObserver(forRPCs: rpcNames, groupType: type, withHandler: $0) }
    }
}

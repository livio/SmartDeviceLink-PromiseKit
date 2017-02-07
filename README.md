# SmartDeviceLink+PromiseKit

This project adds [promises](https://github.com/mxcl/PromiseKit) to [SmartDeviceLink iOS](https://github.com/smartdevicelink/sdl_ios).

## Usage

```swift
let file = SDLFile(data: Data(), name: "Temp", fileExtension: "bmp")
sdlManager.fileManager.upload(file: file).then { bytesAvailable in
    print("\(bytesAvailable) bytes remaining on remote system")
    // Do something if you'd like
}.then(execute: { () -> Promise<(SDLRPCRequest, SDLRPCResponse)> in
    // The upload succeeded if we got here
    let image = SDLImage(name: "Temp", of: .dynamic())
    let show = SDLShow(mainField1: "Update", mainField2: "Show", mainField3: nil, mainField4: nil, alignment: .centered(), statusBar: nil, mediaClock: nil, mediaTrack: nil, graphic: image, softButtons: nil, customPresets: nil)!
    return sdlManager.send(request: show)
}).then { request, response -> Void in
    // We are guaranteed it succeeded if we get here
    print("The show request: \(request)")
    print("The show's successful response: \(response)")
}.catch { error in
    // Something went wrong at some point if we got here
    print("The upload or show errored: \(error)")
}
```

## Cocoapods
```ruby
pod 'SmartDeviceLink+PromiseKit', '~> 0.1'
```

## Carthage
```ruby
github "Livio/SmartDeviceLink+PromiseKit" ~> 0.1
```

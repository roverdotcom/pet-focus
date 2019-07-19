# PetFocus

PetFocus is an image view that automatically centers images on any pets (dogs or cats) shown in the image. It's useful when cropping photos to squares or circles. Pets don't always cooperate when they're having their photos taken, so PetFocus helps show the best part of any photo, no matter how it actually turned out.

PetFocus is usable in projects deployed on iOS 10 and up, but will only perform pet-focused cropping on iOS 13. When running on versions older than iOS 13, PetFocus will fall back to the default cropping behavior.

Read more about the creation of PetFocus on the [Rover Engineering blog](https://www.rover.com/blog/engineering/post/detecting-pets-with-the-ios-vision-framework/).

## Installing

### Swift Package Manager

In Xcode 11, you can use the new Swift Package Manager integration to add PetFocus to your project. Select the menu item File > Swift Packages > Add Package Dependency… and enter in the PetFocus repository URL to add the package to your project:

```
https://github.com/roverdotcom/pet-focus.git
```

### Carthage

If your project doesn't currently use Swift Package Manager, you can also use [Carthage](https://www.github.com/Carthage/Carthage). If your project is already using Carthage, just add PetFocus to your Cartfile:

```ruby
github "roverdotcom/pet-focus" == 0.0.2
```

### CocoaPods

PetFocus can also be added via [CocoaPods](http://cocoapods.org/). Simply add the following to your Podfile:

```ruby
pod 'PetFocus', :git => 'https://github.com/roverdotcom/pet-focus.git'
```

## Usage

PetFocus provides `PetFocusedImageView`, a drop-in replacement for `UIImageView`. It can be used in exactly the same way as a `UIImageView`.

```swift
import PetFocus

class PetViewController: UIViewController {
    func viewDidLoad() {
        let imageView = PetFocusedImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        addSubview(imageView)
        imageView.image = myDogImage
    }
}
```

## License

PetFocus is available under the [MIT License](https://choosealicense.com/licenses/mit/). See the LICENSE file for details.
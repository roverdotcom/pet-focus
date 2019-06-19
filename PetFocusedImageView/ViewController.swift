//  Created by Geoff Pado on 6/17/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let image = UIImage(named: "doggo") else { fatalError("extreme lack of doggo") }
        PetFocusedImageCropper().crop(image, aspectRatio: 1) { (image, error) in
            dump(image)
        }
    }
    
    private let cropper = PetFocusedImageCropper()
}

//  Created by Geoff Pado on 6/17/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let detectionOperation = detectionOperation else { return }

        let finalizeOperation = BlockOperation { [weak self] in
            guard let detectionOperation = self?.detectionOperation else { return }
            dump(detectionOperation.petObservations)
        }

        finalizeOperation.addDependency(detectionOperation)
        operationQueue.addOperations([detectionOperation, finalizeOperation], waitUntilFinished: false)
    }

    // MARK: Boilerplate

    private let detectionOperation = PetDetectionOperation(image: UIImage(named: "boofer")!)
    private let operationQueue = OperationQueue()
}

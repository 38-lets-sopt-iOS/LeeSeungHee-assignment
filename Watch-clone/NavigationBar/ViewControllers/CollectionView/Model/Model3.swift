
import UIKit

struct Model3 {
    let poster: UIImage
}

extension Model3 {
    static func dummy() -> [Model3] {
        return [
            Model3(poster: .b1),
            Model3(poster: .b1),
            Model3(poster: .b1)
        ]
    }
}

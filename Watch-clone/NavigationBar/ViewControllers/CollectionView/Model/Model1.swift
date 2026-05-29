
import UIKit

struct Model1 {
    let poster: UIImage
}

extension Model1 {
    static func dummy() -> [Model1] {
        return [
            Model1(poster: .b2),
            Model1(poster: .t2),
            Model1(poster: .t3)
        ]
    }
}

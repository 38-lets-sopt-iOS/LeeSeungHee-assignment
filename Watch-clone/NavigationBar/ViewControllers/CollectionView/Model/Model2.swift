
import UIKit

struct Model2 {
    let poster: UIImage
}

extension Model2 {
    static func dummy() -> [Model2] {
        return [
            Model2(poster: .t1),
            Model2(poster: .t2),
            Model2(poster: .t3),
            Model2(poster: .t1),
            Model2(poster: .t2),
            Model2(poster: .t3)
        ]
    }
}

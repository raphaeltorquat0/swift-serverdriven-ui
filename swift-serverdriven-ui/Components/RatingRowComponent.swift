import Foundation
import SwiftUI

struct RatingRowComponent: UIComponent {
    let id: UUID = UUID()
    let uiModel: RatingRowUIModel
    
    func render() -> AnyView {
        RatingView(rating: .constant(uiModel.rating)).toAnyView()
    }
}

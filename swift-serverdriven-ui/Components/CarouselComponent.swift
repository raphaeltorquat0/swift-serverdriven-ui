import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    let uiModel: carouselUIModel
    let id = UUID()
    
    
    func render() -> AnyView {
        CarouselView(uiModel: uiModel).toAnyView()
    }
}

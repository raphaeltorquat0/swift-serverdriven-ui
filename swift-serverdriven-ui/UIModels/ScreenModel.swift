import Foundation

enum ComponentError: Error {
    case decodingError
}

enum ComponentType: String, Decodable {
    case featuredImage
    case carousel
    case textRow
    case ratingRow
    case list
}

struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}

struct ComponentModel: Decodable {
    let type: ComponentType?
    let data: [String: Any]
    
    private enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try? container.decode(ComponentType.self, forKey: .type)
        self.data = try container.decode(JSON.self, forKey: .data).value as! [String: Any]
    }
}

extension ScreenModel {
    func buildComponents() throws -> [UIComponent] {
        var components: [UIComponent] = []
        for component in self.components {
            switch component.type {
            case .featuredImage:
                guard let uiModel: FeaturedImageUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(FeaturedImageComponent(uiModel: uiModel))
            case .carousel:
                guard let uiModel: carouselUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(CarouselComponent(uiModel: uiModel))
            case .textRow:
                guard let uiModel: TextRowUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(TextRowComponent(uiModel: uiModel))
            case .ratingRow:
                guard let uiModel: RatingRowUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(RatingRowComponent(uiModel: uiModel))
            case .list:
                guard let uiModel: ListUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(ListComponent(uiModel: uiModel))
            case .none:
                components.append(EmptyComponent())
            }
        
            
        }
        return components
    }
}

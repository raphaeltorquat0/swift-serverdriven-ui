import Foundation

struct CarouselUIRowModel: Decodable, Identifiable {
    let id = UUID()
    let petId: Int
    let imageUrl: URL
    
    private enum CodingKeys: String, CodingKey {
        case petId
        case imageUrl
    }
}

struct carouselUIModel: Decodable {
    let items: [CarouselUIRowModel]
    let action: Action
}

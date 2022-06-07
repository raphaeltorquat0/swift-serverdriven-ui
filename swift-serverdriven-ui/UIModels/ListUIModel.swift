import Foundation

struct RowUIModel: Decodable {
    let id: Int
    let title: String
    let subTitle: String?
    let imageUrl: URL?
}

struct ListUIModel: Decodable {
    let rows: [RowUIModel]
    let action: Action
}

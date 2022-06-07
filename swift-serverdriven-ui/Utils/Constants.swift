import Foundation

struct Constants {
    
    struct ScreenResources {
        static let baseUrl = "localhost:3000"
        static let petListing = "pet-listing"
        
        static func petDetail(petId: Int) -> String {
            return "pet-detail/\(petId)"
        }
        
        static func resource(for resourceName: String) -> URL? {
            var components = URLComponents()
            components.scheme = "http"
            components.percentEncodedHost = "\(self.baseUrl)"
            components.path = "/\(resourceName)"
            return components.url
        }
    }
    
    struct Urls {
        static let baseUrl = "http://localhost:3000"
        static let petListing = "\(baseUrl)/pet-listing"
    }
}

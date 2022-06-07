import SwiftUI

struct PetDetailScreen: View {
    let petId: Int
    
    @StateObject private var viewModel: PetDetailViewModel
    init(petId: Int) {
        _viewModel = StateObject(wrappedValue: PetDetailViewModel(service: Webervice()))
        self.petId = petId
    }
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.components, id: \.id) { component in
                component.render()
            }
            
        }.task {
            await viewModel.load(petId: petId)
        }
    }
}

struct PetDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailScreen(petId: 2)
    }
}
                                                

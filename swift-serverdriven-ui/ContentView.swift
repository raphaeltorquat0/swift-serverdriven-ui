import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: PetListViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: PetListViewModel(service: Webervice()))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.components, id: \.id) { component in
                    component.render()
                }
                .navigationTitle("Pets")
            }
            .listStyle(.plain)
            .task {
                await viewModel.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

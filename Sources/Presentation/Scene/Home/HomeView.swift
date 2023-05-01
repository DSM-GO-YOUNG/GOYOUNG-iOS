import SwiftUI

struct HomeView: View {
    @State var text: String = ""

    var body: some View {
        NavigationView {
            List(0..<10) { _ in
                OfficeListCell()
                    .listRowSeparator(.hidden)
            }
            .padding(.top, 20)
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.inset)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    GSearchBar(text: $text, action: { })
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

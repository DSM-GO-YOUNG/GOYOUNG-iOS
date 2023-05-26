import SwiftUI

struct ApplicantListView: View {

    @StateObject var viewModel = ApplicationListViewModel()

    var body: some View {
        NavigationView {
            List(0..<10, id: \.self) { _ in
                ApplicationListCell()
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 16))
            }
            .listStyle(.inset)
            .navigationTitle("지원자")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ApplicantListView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicantListView()
    }
}

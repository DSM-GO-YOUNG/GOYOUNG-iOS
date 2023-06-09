import SwiftUI

struct ApplicantListView: View {

    @StateObject var viewModel = ApplicationListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.applicationList, id: \.id) { application in
                NavigationLink(destination: { ApplicationDetailView(id: application.id) }) {
                    ApplicationListCell(applicationEntity: application)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 16))
                }
            }
            .onAppear(perform: viewModel.fetchApplicationList)
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

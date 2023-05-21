import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = HomeViewModel()

    init() {
        UINavigationBar.appearance().shadowImage = UIImage()
    }

    var body: some View {
        NavigationView {
            List(viewModel.companyList, id: \.id) {
                OfficeListCell(company: $0)
                    .listRowSeparator(.hidden)
            }
            .padding(.top, 20)
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.inset)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    GSearchBar(text: $viewModel.searchText, action: viewModel.searchCompany)
                }
            }
            .onChange(of: viewModel.searchText) { _ in
                self.viewModel.searchCompany()
            }
            .onAppear(perform: viewModel.fetchCompany)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

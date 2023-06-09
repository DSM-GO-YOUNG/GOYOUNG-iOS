import SwiftUI

struct ProfileView: View {

    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                AsyncImage(url: viewModel.company?.image) { image in
                    image
                        .resizable()
                        .frame(width: 194, height: 194)
                } placeholder: {
                    Color.gray50
                        .frame(width: 194, height: 194)
                }
                .padding(.top, 20)
                CompanyInfoView(company: viewModel.company)
                ProfileButton(
                    image: .write,
                    title: "모집 공고 작성",
                    destination: { WriteJobOfferView() }
                )
                ProfileButton(
                    image: .company,
                    title: "회사 프로필 수정",
                    destination: { EditCompanyView() }
                )
                Spacer()
                NavigationLink(
                    isActive: $viewModel.notFoundCompany,
                    destination: { RegistrationCompanyView() },
                    label: { EmptyView() }
                )
            }
            .onAppear(perform: viewModel.fetchMyCompany)
            .padding(.horizontal, 16)
            .navigationTitle("회사 프로필")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

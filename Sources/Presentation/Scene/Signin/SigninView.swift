import SwiftUI

struct SigninView: View {

    @StateObject var viewModel = SigninViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image.logo
                .frame(width: 149, height: 142)
                .padding(.bottom, 33)
            GTextField(placeholder: "전화번호", text: $viewModel.phoneNumber)
            GTextField(placeholder: "비밀번호", text: $viewModel.password)
                .padding(.bottom, 52)
            GFillButton(title: "로그인", action: viewModel.login)
            Spacer()
        }
        .fullScreenCover(isPresented: $viewModel.isSuccess, content: {
            MainView()
        })
        .padding(.horizontal, 16)
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .background(Color.background)
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}

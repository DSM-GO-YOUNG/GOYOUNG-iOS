import SwiftUI

struct SignupView: View {

    @StateObject var viewModel = SignupViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 40) {
            Spacer()
                .frame(height: 50)
            Image.logo
                .frame(width: 149, height: 142)
            GTextField(placeholder: "전화번호", text: $viewModel.phoneNumber)
            GTextField(placeholder: "비밀번호", text: $viewModel.password)
            GTextField(placeholder: "이름", text: $viewModel.name)
                .padding(.bottom, 33)
            GFillButton(title: "회원가입", action: viewModel.signup)
                .padding(.bottom, 53)
            Spacer()
        }
        .onChange(of: viewModel.isSuccess, perform: { isSuccess in
            if isSuccess {
                dismiss()
            }
        })
        .padding(.horizontal, 16)
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .background(Color.background)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

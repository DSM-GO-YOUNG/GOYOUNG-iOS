import SwiftUI

struct SigninView: View {
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image.logo
                .frame(width: 149, height: 142)
                .padding(.bottom, 33)
            GTextField(placerholder: "이메일", text: $email)
            GTextField(placerholder: "비밀번호", text: $password)
                .padding(.bottom, 52)
            GFillButton(title: "로그인", action: { })
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color.background)
        .navigationTitle("로그인")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}

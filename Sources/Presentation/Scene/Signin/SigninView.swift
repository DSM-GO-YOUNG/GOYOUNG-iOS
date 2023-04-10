import SwiftUI

struct SigninView: View {
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image.logo
                .frame(width: 149, height: 142)
            Spacer()
            GTextField(placerholder: "이메일", text: $email)
            GTextField(placerholder: "비밀번호", text: $password)
                .padding(.bottom, 52)
            GFillButton(title: "로그인", action: { })
            Spacer()
        }
        .background(Color.background)
        .padding(.horizontal, 16)
        .navigationTitle("로그인")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}

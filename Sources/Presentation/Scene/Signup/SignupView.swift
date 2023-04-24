import SwiftUI

struct SignupView: View {
    @State var phoneNumber: String = ""
    @State var password: String = ""
    @State var name: String = ""

    var body: some View {
        VStack(spacing: 40) {
            Spacer()
                .frame(height: 50)
            Image.logo
                .frame(width: 149, height: 142)
            GTextField(placeholder: "전화번호", text: $phoneNumber)
            GTextField(placeholder: "비밀번호", text: $password)
            GTextField(placeholder: "이름", text: $name)
                .padding(.bottom, 33)
            GFillButton(title: "회원가입", action: { })
                .padding(.bottom, 53)
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color.background)
        .navigationTitle("회원가입")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

import SwiftUI

struct SignupView: View {
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var name: String = ""
    @State var officeName: String = ""
    @State var officePosition: String = ""
    @State var officeType: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            GTextField(placerholder: "전화번호", text: $phoneNumber)
            GTextField(placerholder: "이메일", text: $email)
            GTextField(placerholder: "이름", text: $name)
            GTextField(placerholder: "회사명", text: $officeName)
            GTextField(placerholder: "회사 위치", text: $officePosition)
            GTextField(placerholder: "회사 종류", text: $officeType)
                .padding(.bottom, 50)
            GFillButton(title: "회원가입", action: { })
                .padding(.bottom, 63)
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

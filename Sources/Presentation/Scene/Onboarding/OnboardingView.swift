import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()
                Image.logo
                    .frame(width: 149, height: 142)
                Spacer()
                GFillNavigationLink(
                    title: "로그인",
                    destination: { SigninView() }
                )
                .padding(.bottom, 19)
                GFillNavigationLink(
                    title: "회원가입",
                    destination: { SignupView() },
                    backgroundColor: .white,
                    textColor: .black,
                    borderColor: .mainGreen,
                    borderWidth: 2
                )
                .padding(.bottom, 71)
            }
            .background(Color.background)
            .padding(.horizontal, 16)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

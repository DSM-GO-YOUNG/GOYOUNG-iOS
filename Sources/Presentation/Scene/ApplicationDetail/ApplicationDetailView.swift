import SwiftUI

struct ApplicationDetailView: View {
    let id: String

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 194, height: 194)
                } placeholder: {
                    Color.gray50
                        .frame(width: 194, height: 194)
                }
                .padding(.bottom, 20)
                VStack(alignment: .leading) {
                    Text("기본정보")
                        .font(.suseongBatang(18))
                        .foregroundColor(.gray100)
                    HStack {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("이름 : 김멍멍자")
                            Text("나이 : 56세")
                            Text("주소 : 이 세상 어딘가에 살고 있습니다.")
                        }
                        Spacer()
                    }
                    .font(.suseongBatang(16))
                    .padding(15)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.line, lineWidth: 1)
                    }
                }
                .padding(.bottom, 10)
                VStack(alignment: .leading) {
                    Text("자기소개서")
                        .font(.suseongBatang(18))
                        .foregroundColor(.gray100)
                    HStack(alignment: .top) {
                        Text("비컨에서 탈모 치료를 담당했습니다. 반가워요 진짜 반가워요 제가 사람을 오랜만에 봤어요")
                        Spacer()
                    }
                    .font(.suseongBatang(16))
                    .padding(15)
                    .frame(height: 194)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.line, lineWidth: 1)
                    }
                }
                .padding(.bottom, 12)
                HStack(spacing: 20) {
                    NavigationLink(destination: WriteReviewView()) {
                        Text("후기 작성")
                            .font(.suseongBatang(18))
                            .foregroundColor(.white)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 41)
                            .background(Color.mainPink)
                            .cornerRadius(50)
                    }
                    Button("면접 신청", action: { })
                        .font(.suseongBatang(18))
                        .foregroundColor(.white)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 41)
                        .background(Color.mainGreen)
                        .cornerRadius(50)
                }
            }
            .padding(.horizontal, 16)
            .navigationTitle("지원자 조회")
            .navigationBarTitleDisplayMode(.inline)
            .setNavigationBackButton()
            .navigationBarBackButtonHidden()
        }
    }
}

struct ApplicationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationDetailView(id: "")
    }
}

import SwiftUI

struct WriteReviewView: View {

    @StateObject var viewModel = WriteReviewViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 36) {
            HStack(spacing: 24) {
                AsyncImage(url: URL(string: "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 118, height: 140)
                } placeholder: {
                    Color.gray50
                        .frame(width: 118, height: 140)
                }
                VStack(alignment: .leading) {
                    Text("이름 : 김복자")
                    Text("나이 : 67세")
                    Text("주소 : 이 세상 누군가")
                }
                .font(.suseongBatang(22))
            }
            GTextView(placeholder: "리뷰 작성", text: $viewModel.content)
            Spacer()
            GFillButton(title: "리뷰 작성하기", action: viewModel.writeReview)
        }
        .onChange(of: viewModel.isSuccess, perform: { isSuccess in
            if isSuccess {
                self.dismiss()
            }
        })
        .padding(.horizontal, 16)
        .navigationTitle("리뷰 작성")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WriteReviewView_Previews: PreviewProvider {
    static var previews: some View {
        WriteReviewView()
    }
}

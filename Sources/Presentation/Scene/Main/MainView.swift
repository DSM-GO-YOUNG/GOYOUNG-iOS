import SwiftUI

struct MainView: View {
    @State private var selectedIndex: Int = 1
    let iconList: [String] = ["People", "List", "Office"]
    let selectedIconList: [String] = ["SelectedPeople", "SelectedList", "SelectedOffice"]
    let titleList: [String] = ["지원자", "회사 리스트", "회사 프로필"]

    var body: some View {
        ZStack {
            switch selectedIndex {
            case 0:
                Color.red
            case 1:
                Color.green
            default:
                Color.blue
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ForEach(0..<iconList.count, id: \.self) { index in
                        VStack(spacing: 0) {
                            Image(selectedIndex == index ? selectedIconList[index] : iconList[index])
                                .resizable()
                                .frame(width: 35, height: 35)
                            Text(titleList[index])
                                .font(.suseongBatang(10))
                        }
                        .foregroundColor(selectedIndex == index ? .deepPink : .gray100)
                        .onTapGesture {
                            self.selectedIndex = index
                        }
                        Spacer()
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 20)
                .background(Color.white)
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

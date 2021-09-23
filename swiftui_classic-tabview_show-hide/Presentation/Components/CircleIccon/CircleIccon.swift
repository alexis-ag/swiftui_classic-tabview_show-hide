import SwiftUI

struct CircleIcon: View {
    let props: Props

    var body: some View {
        icon
    }

    @ViewBuilder
    private var icon: some View{
        switch props.style{

        case .filled(let imageName):
            Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: props.size, height: props.size)
                    .cornerRadius(props.size/2)

        case .systemImage(let systemImageName, let font, let backgroundColor, let foregroundColor):
            Image(systemName: systemImageName)
                    .frame(width: props.size, height: props.size)
                    .font(font)
                    .foregroundColor(foregroundColor)
                    .background(backgroundColor)
                    .cornerRadius(props.size/2)
        }
    }
}

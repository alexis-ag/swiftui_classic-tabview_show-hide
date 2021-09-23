import SwiftUI
import Combine

class KeyboardObserver: ObservableObject {
    private var cancellable: AnyCancellable?

    @Published private(set) var currentHeight: CGFloat = 0

    func isShown() -> Bool {
        currentHeight > 0
    }

    let keyboardWillShow = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height }

    let keyboardWillHide = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ -> CGFloat in 0 }

    init() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
                .subscribe(on: RunLoop.main)
                .assign(to: \.currentHeight, on: self)
    }
}

struct AdaptsToSoftwareKeyboard: ViewModifier {
    @State var currentHeight: CGFloat = 0

    func body(content: Content) -> some View {
        content
                .padding(.bottom, self.currentHeight)
                .edgesIgnoringSafeArea(self.currentHeight == 0 ? Edge.Set() : .bottom)
                .onAppear(perform: subscribeToKeyboardEvents)
    }

    private let keyboardWillOpen = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .map { $0.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect }
            .map { $0.height }

    private let keyboardWillHide =  NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat.zero }

    private func subscribeToKeyboardEvents() {
        _ = Publishers.Merge(keyboardWillOpen, keyboardWillHide)
                .subscribe(on: RunLoop.main)
                .assign(to: \.self.currentHeight, on: self)
    }
}

final class KeyboardResponder: ObservableObject {
    private var _center: NotificationCenter
    private var delta: CGFloat
    @Published var currentHeight: CGFloat = 0

    init(delta: CGFloat = 0, center: NotificationCenter = .default) {
        self.delta = delta
        _center = center
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.size.height {
            currentHeight = height + delta
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }
}
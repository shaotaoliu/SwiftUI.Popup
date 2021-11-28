import SwiftUI

struct PopupView<PopupContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    @ViewBuilder let popupContent: () -> PopupContent
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            popupContent()
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(15)
                .padding()
                .shadow(radius: 10)
                .scaleEffect(isPresented ? 1 : 0)
            
        }
        .animation(.default, value: isPresented)
    }
}

extension View {
    func popup<Content: View>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View {
        modifier(PopupView(isPresented: isPresented, popupContent: content))
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        @State var isPresented: Bool = true
        
        return Button("Show Popup") {
            isPresented = true
        }
        .popup(isPresented: $isPresented, content: {
            AddItemView()
                .environmentObject(ViewModel())
        })
    }
}

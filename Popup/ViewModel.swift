import Foundation

class ViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var showPopup = false
    
    init() {
        for i in 1...5 {
            add(item: Item(name: "Item \(i)", description: "This is Item \(i)"))
        }
    }
    
    func add(item: Item) {
        items.append(item)
    }
}

struct Item {
    let id = UUID()
    var name = ""
    var description = ""
}

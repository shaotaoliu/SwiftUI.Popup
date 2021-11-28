import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var item = Item()
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("Name", text: $item.name)
                .textFieldStyle(.roundedBorder)
            
            TextField("Description", text: $item.description)
                .textFieldStyle(.roundedBorder)
            
            HStack(spacing: 50) {
                Button("Cancel") {
                    vm.showPopup = false
                }
                
                Button("Save") {
                    vm.add(item: item)
                    vm.showPopup = false
                }
            }
            .padding(.top, 10)
        }
        .padding(30)
        .onChange(of: vm.showPopup, perform: { show in
            if !show {
                item.name = ""
                item.description = ""
            }
        })
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
            .environmentObject(ViewModel())
    }
}

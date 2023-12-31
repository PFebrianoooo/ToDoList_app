//
//  AddItem.swift
//  ToDoList
//
//  Created by Putra Pebriano Nurba on 31/12/23.
//

import SwiftUI

struct AddItem: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment (\.dismiss) var dismiss
    @State private var addItemsList: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                TextField("add Here".capitalized, text: $addItemsList)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1.5)
                    }
                
                Button(action: {
                    saveItemsToArraysData()
                }, label: {
                    Text("save".capitalized)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 4)
                })
                .buttonStyle(.borderedProminent)
                
            }
            .padding(.horizontal)
            .alert("Check Your message".capitalized, isPresented: $showAlert) {
                
            }message: {
                Text("Your value must be at least 3 characters left or higher".capitalized)
            }
        }
        .navigationTitle("Add Items")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func saveItemsToArraysData() {
        if ifDataNotQualify() == true {
            listViewModel.addItems(value: addItemsList)
            dismiss()
        }else {
            showAlert = true
        }
    }
    
    func ifDataNotQualify() -> Bool {
        if addItemsList.count < 3 {
            return false
        }
        return true
    }

}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddItem()
        }
        .environmentObject(ListViewModel())
    }
}

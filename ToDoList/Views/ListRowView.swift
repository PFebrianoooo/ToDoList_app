//
//  ListRowView.swift
//  ToDoList
//
//  Created by Putra Pebriano Nurba on 31/12/23.
//

import SwiftUI


struct ListRowView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.dataList.isEmpty {
                InformationTextView()
            }else {
                List {
                    ForEach(listViewModel.dataList) { itemsdata in
                        ListComponents(item: itemsdata)
                            .onTapGesture {
                                withAnimation(Animation.linear(duration: 1.0)){
                                    listViewModel.updateItem(item: itemsdata)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItems)
                    .onMove(perform: listViewModel.moveItems)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("To Do List")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
                    .fontWeight(.semibold)
                    .buttonStyle(.borderedProminent)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: {
                    AddItem()
                }, label: {
                    Text("Add")
                        .fontWeight(.semibold)
                })
                .buttonStyle(.borderedProminent)
            }
        }
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListRowView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(ListViewModel())

        NavigationStack {
            ListRowView()
                .preferredColorScheme(.light)
        }
        .environmentObject(ListViewModel())
        
        
        
    }
}

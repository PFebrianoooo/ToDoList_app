//
//  ListComponents.swift
//  ToDoList
//
//  Created by Putra Pebriano Nurba on 31/12/23.
//

import SwiftUI

struct ListComponents: View {
    let item: ListModel
    var body: some View {
        HStack {
            Image(systemName: item.isComplete ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplete ? .green : .red)
            Text(item.value)
                .font(.subheadline)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

struct ListComponents_Previews: PreviewProvider {
    static private var item: ListModel = ListModel(isComplete: false, value: "hello there this is first item")
    static private var item2: ListModel = ListModel(isComplete: true, value: "hello there this is second item")
    static var previews: some View {
        Group {
            ListComponents(item: item)
            ListComponents(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}

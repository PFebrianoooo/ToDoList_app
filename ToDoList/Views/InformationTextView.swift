//
//  InformationTextView.swift
//  ToDoList
//
//  Created by Putra Pebriano Nurba on 31/12/23.
//

import SwiftUI

struct InformationTextView: View {
    @State private var isAnimated: Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                Text("welcome in to do list app".capitalized)
                    .fontWeight(.semibold)
                    .font(.title3)
                Text("welcome and ready to make a new list in here, have a great time and day, go ahead make a new list items.".capitalized)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                Text("Stay Learning")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                
                NavigationLink {
                    AddItem()
                } label: {
                    Text("Add New Items")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(
                            width: isAnimated ? 200 : 150,
                            height: isAnimated ? 50 : 45
                        )
                        
                }
                .background(isAnimated ? Color("AnimateColor") : Color("AnimateColor").opacity(0.9))
                .shadow(color: Color.black, radius: 2.0)
                .cornerRadius(10)

            }
            .padding(.all)
            .onAppear(perform: onAppear)
            .transition(AnyTransition.move(edge: .top).animation(.easeInOut(duration: 1.5)))
        }
    }
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                Animation
                    .linear(duration: 1.5)
                    .repeatForever()
            ) {
                isAnimated = true
            }
        }
    }
}

struct InformationTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            InformationTextView()
                .navigationTitle("title")
        }
    }
}

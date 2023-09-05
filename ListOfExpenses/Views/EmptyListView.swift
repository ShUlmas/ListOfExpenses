//
//  EmptyListView.swift
//  ListOfExpenses
//
//  Created by O'lmasbek on 05/09/23.
//

import SwiftUI

struct EmptyListView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("If there are no expenses listed here, please click the Add button and add the expenses to the list. 🖊️")
                    .font(Font.custom("Rubik-Bold", size: 20))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                NavigationLink {
                    AddExpenseView()
                } label: {
                    Text("Add 📋")
                        .font(Font.custom("Rubik-Bold", size: 20))
                        .padding()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(animate ? Color.accentColor : Color("secondaryAccentColor"))
                        .cornerRadius(16)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.accentColor : Color("secondaryAccentColor").opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 500)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .navigationTitle("List is empty 🗿")
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EmptyListView()
        }
    }
}

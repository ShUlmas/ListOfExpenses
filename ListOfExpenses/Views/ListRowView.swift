//
//  ListRowView.swift
//  ListOfExpenses
//
//  Created by O'lmasbek on 05/09/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack() {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .foregroundColor(item.isCompleted ? Color.green : Color.gray.opacity(0.7))
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        
                    }
                Text(item.title)
                    .font(Font.custom("Rubik-Bold", size: 15))
            }
            Spacer()
            Text(item.amount)
                .font(Font.custom("Rubik-Bold", size: 15))
                .foregroundColor(.accentColor)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListRowView(item: ItemModel(title: "First title here", isCompleted: false, amount: "10000"))
            ListRowView(item: ItemModel(title: "Second title here", isCompleted: true, amount: "25000"))
        }
    }
}


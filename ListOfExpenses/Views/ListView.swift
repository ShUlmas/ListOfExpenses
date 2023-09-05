//
//  ListView.swift
//  ListOfExpenses
//
//  Created by O'lmasbek on 05/09/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.listItems.isEmpty {
                EmptyListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(viewModel.listItems) { item in
                        ListRowView(item: item)
                            .onTapGesture(count: 2) {
                                withAnimation(.linear) {
                                    viewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onMove(perform: viewModel.moveItem)
                    .onDelete(perform: viewModel.deleteItem)
                }
                .navigationTitle("List of expenses ✍️")
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddExpenseView()
                } label: {
                    Text("Add")
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}


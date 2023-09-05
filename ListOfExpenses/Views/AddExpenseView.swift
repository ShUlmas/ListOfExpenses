//
//  AddExpenseView.swift
//  ListOfExpenses
//
//  Created by O'lmasbek on 05/09/23.
//

import SwiftUI

struct AddExpenseView: View {
    @EnvironmentObject var viewModel: ListViewModel
    
    @Environment(\.dismiss) var dismisss
    @State var titleTextFieldText: String = ""
    @State var amountTextFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
   
    var body: some View {
        VStack {
            TextField(text: $titleTextFieldText) {
                Text("add new expense here")
                    .font(Font.custom("Rubik-Medium", size: 15))
                    
            }
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color.gray.opacity(0.2))
            .frame(maxWidth: .infinity)
            .cornerRadius(16)
            
            TextField(text: $amountTextFieldText) {
                Text("add amount")
                    .font(Font.custom("Rubik-Medium", size: 15))
                    
            }
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color.gray.opacity(0.2))
            .frame(maxWidth: .infinity)
            .cornerRadius(16)
            
            Button {
                saveButtonTapped()
            } label: {
                Text("Save")
                    .foregroundColor(Color.white)
                    .font(Font.custom("Rubik-Bold", size: 15))
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(16)
            Spacer()
            
        }
        .frame(maxWidth: 500)
        .padding(16)
        .navigationTitle("Add expense 🖊️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonTapped() {
        if textIsAppropirate() {
            viewModel.addItem(
                title: titleTextFieldText,
                amount: amountTextFieldText + "UZS")
            dismisss()
        }
    }
    
    func textIsAppropirate() -> Bool {
        if titleTextFieldText.count < 1 || amountTextFieldText.count < 1 {
            alertTitle = "Your expense title or\n amount is empty 🗿"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddExpenseView()
        }
        .environmentObject(ListViewModel())
    }
}


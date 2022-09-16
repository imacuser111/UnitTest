//
//  ContentView.swift
//  UnitTest
//
//  Created by Cheng-Hong on 2022/9/14.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var accountData = AccountData()
    
    let viewMdoel = ContentViewModel()
    
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("account", text: $accountData.account)
                    .padding()
                
                TextField("password", text: $accountData.password)
                    .padding()
                
                Text(accountData.errorStr)
                    .font(.body)
                    .foregroundColor(.red)
                
                Button("Login") {
                    trans()
                }
                .padding()
                
                NavigationLink(destination: Text("Success Login"), isActive: $isPresented) { }
            }
        }
    }
    
    private func trans() {
        let output = viewMdoel.checkFormat(input: .init(accountData: accountData))
        accountData.errorStr = !output.state.isError ? "" : output.state.rawValue
        
        if !output.state.isError {
            isPresented.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

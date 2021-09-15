//
//  ContentView.swift
//  SplitUp
//
//  Created by Yash Poojary on 15/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipAmount = Double(tipPercentages[tipPercentage])
        let checkTotal = Double(checkAmount) ?? 0
        
        let tipFigure = checkTotal * tipAmount / 100
        let finalTotal = checkTotal + tipFigure
        let perPerson = finalTotal / peopleCount

        return perPerson
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                
                Section(header: Text("How much would you like to tip")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            
                
                
                Section {
                    Text("₹\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("SplitUp")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

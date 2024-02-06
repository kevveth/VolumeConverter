//
//  ContentView.swift
//  VolumeConverter
//
//  Created by Kenneth Oliver Rathbun on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    // State variables to track user input and selected units
    @State private var inputUnit = "milliliters"
    @State private var outputUnit = "liters"
    @State private var userInput = 1.0
    
    // Units and their conversion rates to milliliters
    let units = ["milliliters": 1.0,
                 "liters": 1000,
                 "cups": 236.5882365,
                 "pints": 473.17647274592001,
                 "gallons": 3785.411789132031272]
    
    // Computed property to calculate the input value in milliliters
    var inputValueInMilliliters: Double {
        userInput * units[inputUnit]!
    }
    
    // Computed property to calculate the converted output value
    var userOutput: Double {
        inputValueInMilliliters / units[outputUnit]!
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // Picker for input unit
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units.keys.sorted(), id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    // Picker for output unit
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units.keys.sorted(), id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                // Accept user input for value to convert
                Section("Input") {
                    TextField("Initial value", value: $userInput, format: .number)
                }
                
                // Display converted value
                Section("Output") {
                    Text(userOutput.formatted() + " \(outputUnit)")
                }
            }
            .navigationTitle("↔️ Volume Converter")
        }
    }
}

#Preview {
    ContentView()
}

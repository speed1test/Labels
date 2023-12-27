//
//  ContentView.swift
//  Labels
//
//  Created by elsalvador on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var number1: String = ""
    @State private var number2: String = ""
    @State private var sumResult: Double = 0.0

    var body: some View {
        VStack {
            Text("Suma de dos números")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text("Número #1")
            TextField("Ingresa el primer número", text: $number1)
                .padding()

            Text("Número #2")
            TextField("Ingresa el segundo número", text: $number2)
                .padding()

            Button(action: {
                self.calculateSum()
            }) {
                Text("Calcular Suma")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .buttonStyle(DefaultButtonStyle())

            Label("Suma:", systemImage: "star")
            Text(String(format: "%.2f", sumResult))
                .padding()
        }
        .padding()
    }

    private func calculateSum() {
        if let num1 = Double(number1), let num2 = Double(number2) {
            sumResult = (num1 + num2).rounded(toPlaces: 2)
        } else {
            // Handle invalid input
            sumResult = 0.0
        }
    }
}

// Extension to round the double to a specific number of decimal places
extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Cotharticren
//
//  Created by Justin Venable on 8/4/21.
//
import Foundation
import SwiftUI
import CoreData
import Combine

struct windowSize {
let minWidth : CGFloat = 100
let minHeight : CGFloat = 100
let maxWidth : CGFloat = 600
let maxHeight : CGFloat = 600
}

struct ContentView: View {
    @State var fahrenheit = Double()
    @State var fahrenheitresult = Double()
    @State var celsius = Double()
    @State var celsiusresult = Double()
    @State var sigfah = Double()
    @State var sigfahresult = Double()
    @State var sigcel = Double()
    @State var sigcelresult = Double()
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    //func sigcothianFahrenheit = (((radicalthermal-273.15)-295.372)/.55555556)+32;
    //func sigcothianCelsius = (radicalthermal-273.15)-295.372;
    func convertCelsiusToFahrenheit(fahrenheitresult: Double) -> Double { fahrenheit * 9 / 5 + 32 }
    func convertFahrenheitToCelsius(celsiusresult: Double) -> Double { (celsius - 32) * 5 / 9 }
    var body: some View {
        VStack(alignment: .center) {
        Image("DARTMeadowCSMwidthwood27edgelabe300")
            .shadow(radius: 3)
            .padding(.top, 10)
            .padding()
            .padding()
            Divider()
            HStack(alignment: .center) {
            Image("atm26100")
                .shadow(radius: 3)
                .padding(.top, 10)
                Divider()
                HStack(alignment: .bottom) {
                Text("ATM26")
                    .font(.largeTitle)
                    .bold()
                    .colorInvert()
                .padding()
                .padding()
                }
            }
        //.background(Color.yellow)
        HStack(alignment: .center) {
        VStack(alignment: .leading) {
            
            Text("Celsius Measurement:")
                .font(.callout)
                .bold()
            TextField("#", value: self.$fahrenheit, formatter: formatter)
            //.onReceive(Just(self.orbit), perform: self.numericValidator)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                //.fixedSize(horizontal: true, vertical: true)
            //TextField("Orbit Measurement: ", value: self.$orbitresult, formatter: formatter)
            //.onReceive(Just(self.orbitresult), perform: self.numericValidator)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                //.fixedSize(horizontal: true, vertical: true)
            Text("Celsius Conversion: \(convertCelsiusToFahrenheit(fahrenheitresult: fahrenheit))")
                .font(.callout)
                .bold()
                //.frame(width: 200, height: 30, alignment: .leading)
                .padding()
                .padding()
        }.padding()
            .frame(minWidth: windowSize().minWidth, minHeight: windowSize().minHeight)
                .frame(maxWidth: windowSize().maxWidth, maxHeight: windowSize().maxHeight)
                //.border(Color.blue, width: 1)
            .padding()
            .padding().background(Color.blue)
            Divider()
            VStack(alignment: .leading) {
                Text("Fahrenheit Measurement:")
                    .font(.callout)
                    .bold()
                TextField("#", value: self.$celsius, formatter: formatter)
                //.onReceive(Just(self.orbit), perform: self.numericValidator)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.fixedSize(horizontal: true, vertical: true)
                //TextField("Orbit Measurement: ", value: self.$orbitresult, formatter: formatter)
                //.onReceive(Just(self.orbitresult), perform: self.numericValidator)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    //.fixedSize(horizontal: true, vertical: true)
                Text("Fahrenheit Conversion: \(convertFahrenheitToCelsius(celsiusresult: celsius))")
                    .font(.callout)
                    .bold()
                    //.frame(width: 200, height: 30, alignment: .leading)
                    .padding()
                    .padding()
            }.padding()
            
                .frame(minWidth: windowSize().minWidth, minHeight: windowSize().minHeight)
                    .frame(maxWidth: windowSize().maxWidth, maxHeight: windowSize().maxHeight)
                    //.border(Color.blue, width: 1)
                .padding()
                .padding().background(Color.blue)
            
        }
        }.background(Color.white)
    }
    }
//NODE

    
    /*func numericValidator(newValue: String) {
        if newValue.range(of: "^\\d+$", options: .regularExpression) != nil {
            self.orbit = newValue
        } else if !self.orbit.isEmpty {
            self.orbit = String(newValue.prefix(self.orbit.count - 1))
        }
    }*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
       
    }
}


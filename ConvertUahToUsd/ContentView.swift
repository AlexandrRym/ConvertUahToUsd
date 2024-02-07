//
//  ContentView.swift
//  ConvertUahToUsd
//
//  Created by AlexRymar on 05.02.2024.
//


import SwiftUI

struct ContentView: View {
    @State private var сurrency = 0
    @State private var enteryCash = ""
    @State private var enteryCourse = "40"
    let array = ["USD->UAH","UAH->USD"]
    var calculate:Double{
        if сurrency == 0{
            let ENTERY_CASH:Double = Double(enteryCash) ?? 0
            let Course:Double = Double(enteryCourse) ?? 0
            let result:Double = ENTERY_CASH * Course
            return result
}
        else{
            let ENTERY_CASH:Double = Double(enteryCash) ?? 0
            let Course:Double = Double(enteryCourse) ?? 0
            let result:Double = ENTERY_CASH / Course
            return result
        }
    }
    var emoj:String{
        if сurrency == 0{
            return "\u{20B4}"
        }else{
            return "\u{0024}"
        }
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker(selection: $сurrency,  label: Text("select conversion ")){
                        ForEach (0 ..< 2){
                            Text(array[$0]).bold().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    }.font(.title).padding(15)
                }
                HStack{
                    Section{
                        TextField("Course",text: $enteryCourse).padding(30).bold()
                    }
                    Divider()
                    Section{
                        TextField("Enter amount",text: $enteryCash).padding(15).bold()
                    }
                }
                Section{
                    Text("\(calculate ,specifier: "%.2f") \(emoj)").padding(15).bold()
                }
                .navigationTitle("Convert\u{1F4B0}")
            }
        }
    }
}

#Preview {
    ContentView()
}

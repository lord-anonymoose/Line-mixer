//
//  ContentView.swift
//  LineBreaker
//
//  Created by Philipp on 12/6/19.
//  Copyright © 2019 Philipp. All rights reserved.
//

import SwiftUI

func randomEmoji() -> String {
    let range = ["🙃","🤨","😒","😞","😔","😟","😕","🙁","☹️","😣","😖","😫","😩","🥺","😢","😭","😤","😠","🤯","😳","😱","😨","😰","😥","😓","🤔","🤭","😶","😐","😑","😯","😦","😧","😮","🥱","😴","🤤","😪","😵","🤐"]
    return range.randomElement() ?? "😕"
}

func buttonOnClick (line1: String, line2: String) -> String
{
    let myString1 = line1
    let myString2 = line2
    var resultString = ""

    let components1 = myString1.components(separatedBy:CharacterSet.whitespaces.union(CharacterSet.punctuationCharacters))
    let words1 = components1.filter { !$0.isEmpty }
    
    let components2 = myString2.components(separatedBy:CharacterSet.whitespaces.union(CharacterSet.punctuationCharacters))
    let words2 = components2.filter { !$0.isEmpty }
    
    if (words1.count == 0) && (words2.count == 0) {resultString = randomEmoji() + " Кажется, Вы ввели пустые строчки."}
    var i = 0
    var maxCount = 0
    var minCount = 0
    if (words1.count > words2.count) { maxCount = words1.count }
    if (words2.count > words1.count) { maxCount = words2.count }
    if (words1.count == words2.count) {minCount = words1.count}
    if (words1.count < words2.count) { minCount = words1.count }
    if (words2.count < words1.count) { minCount = words2.count }
    while i < minCount {resultString += words1[i] + " " + words2[i] + " "; i+=1}
    if (words1.count != words2.count)
    {
        if (words1.count == maxCount) { while i < maxCount {resultString += words1[i] + " "; i+=1}}
        if (words2.count == maxCount) { while i < maxCount {resultString += words2[i] + " "; i+=1}}
    }
    return (resultString)
}

struct ContentView: View {
    @State private var input1: String = ""
    @State private var input2: String = ""
    @State private var output: String = ""
        var body: some View {
            VStack {
            Text("Введите строки, которые нужно соединить:")
            TextField("...", text: $input1).frame(width:500, height:30)
            TextField("...", text: $input2).frame(width:500, height:30)
                Button(action: {self.output = buttonOnClick(line1: self.input1, line2: self.input2)}) {Text("Соединить")}
                Text("")
                Text(output)
            }.frame(width:600, height:300)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

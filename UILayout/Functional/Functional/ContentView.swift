//
//  ContentView.swift
//  Functional
//
//  Created by 熊熙 on 2020/11/3.
//

import SwiftUI


struct Student: Comparable {
    let name: String
    let age: Int
    let score: Int
    
    static func < (lhs: Student, rhs: Student) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        lhs.name == rhs.name
    }
}

extension Array where Element: Comparable {
    func quickSorted() -> [Element] {
        if self.count > 1 {
            let (pivot, remaining) = (self[0], dropFirst())
            let lhs = remaining.filter{ $0 <= pivot}
            let rhs = remaining.filter{ $0 > pivot}
            return lhs.quickSorted() + [pivot] + rhs.quickSorted()
        }
        return self
    }
}

func quickSort() {
    let students = [
        Student(name: "Calista", age: 18, score: 85),
        Student(name: "Griselda", age: 20, score: 88),
        Student(name: "Annabelle", age: 24, score: 92),
        Student(name: "Polly", age: 22, score: 93),
        Student(name: "Maud", age: 16, score: 95),
    ]
    
    let sortedNames = students.quickSorted().map{ $0.name }
    print(sortedNames)
}



struct ContentView: View {
    @State var students = [
        Student(name: "Calista", age: 18, score: 85),
        Student(name: "Griselda", age: 20, score: 88),
        Student(name: "Annabelle", age: 24, score: 92),
        Student(name: "Polly", age: 22, score: 93),
        Student(name: "Maud", age: 16, score: 95),
    ]
    
    
    var body: some View {
        Form {
            Section {
                Text("这个是学生名单列表")
                    .font(.title)
                ForEach(0 ..< students.count) {
                    Text(students[$0].name)
                }
                Button(action: {
                    let sortedNames = students.quickSorted()
                    students = sortedNames
                    print("执行快速排序")
                }, label: {
                    Text("快速排序")
                })
            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

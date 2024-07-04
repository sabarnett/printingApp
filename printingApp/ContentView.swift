//
// File: ContentView.swift
// Package: printingApp
// Created by: Steven Barnett on 04/07/2024
// 
// Copyright © 2024 Steven Barnett. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ContentViewModel()
    
    var body: some View {
        VStack {
            TextEditor(text: $vm.editContent)
            Button(action: { vm.convertAndPrint() },
                   label: { Text("Print") })
            
            HostingWindowFinder { win in
                guard let win else { return }
                vm.windowNumber = win.windowNumber
            }.frame(width: 0, height: 0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

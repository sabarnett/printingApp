//
// File: ContentViewModel.swift
// Package: printingApp
// Created by: Steven Barnett on 04/07/2024
// 
// Copyright © 2024 Steven Barnett. All rights reserved.
//

import SwiftUI
import MarkdownKit

class ContentViewModel: ObservableObject {
    
    @Published var windowNumber: Int = 0
    @Published var editContent: String = ""
    
    var printView: HTMLPrintView?
    
    init() {
        editContent = sampleText
    }
    
    func convertAndPrint() {
        // Step 1: convert markdown to HTML
        let html = htmlFromMarkdown(markdown: editContent)
        
        // Step 2: Get the current window reference
        guard let window = NSApplication.shared.windows.first(
            where: {$0.windowNumber == self.windowNumber})
        else { return }

        // Step 3: Create the parameters
        let options = PrintOptions(
            fileName: "example.txt",
            header: "Report Heading",
            htmlContent: html,
            window: window
        )
        
        // Step 4: Print the HTML
        printView = HTMLPrintView()
        printView!.printView(printOptions: options)
        print("Printed")
    }

    func htmlFromMarkdown(markdown: String) -> String {
        let markdown = MarkdownParser.standard.parse(markdown)
        return HtmlGenerator.standard.generate(doc: markdown)
    }
    
    
    private var sampleText = """
# This is a heading 1

## This is a heading 2

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do 
eiusmod tempor incididunt ut labore et dolore magna
aliqua. Ornare aenean euismod elementum nisi quis eleifend 
quam adipiscing vitae. Sit amet commodo nulla facilisi
nullam vehicula ipsum a arcu. Nulla facilisi nullam vehicula 
ipsum a arcu. Proin fermentum leo vel orci porta non
pulvinar neque. Blandit volutpat maecenas volutpat blandit 
aliquam etiam erat velit scelerisque. Risus nullam eget
felis eget nunc. Nibh nisl condimentum id venenatis.

* Ornare aenean euismod elementum
* Amet cursus sit amet dictum
* Volutpat sed cras ornare arcu dui.

Diam vulputate ut pharetra sit. Egestas quis ipsum suspendisse 
ultrices. Tempus imperdiet nulla malesuada pellentesque
elit eget gravida cum sociis. Amet cursus sit amet dictum sit 
amet justo donec enim. Pretium quam vulputate dignissim
suspendisse. Ut placerat orci nulla pellentesque. Quam nulla 
porttitor massa id neque aliquam vestibulum morbi blandit.
Sed euismod nisi porta lorem mollis aliquam ut porttitor leo. 
Non quam lacus suspendisse faucibus interdum posuere.
Metus vulputate eu scelerisque felis. Lorem sed risus ultricies 
tristique nulla aliquet enim tortor.

Diam maecenas ultricies mi eget mauris. Tincidunt augue 
interdum velit euismod in pellentesque. Nulla facilisi cras
fermentum odio eu feugiat pretium nibh. Volutpat sed cras 
ornare arcu dui. At volutpat diam ut venenatis tellus in.
Aliquam eleifend mi in nulla. Nunc sed augue lacus viverra 
vitae congue eu consequat. Leo vel orci porta non. Volutpat
blandit aliquam etiam erat velit scelerisque in dictum. Et 
netus et malesuada fames. Nisl nunc mi ipsum faucibus vitae
aliquet nec. At tempor commodo ullamcorper a lacus vestibulum. 
Eget arcu dictum varius duis.
"""
}

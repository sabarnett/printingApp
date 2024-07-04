//
// File: Bundle+Extensions.swift
// Package: printingApp
// Created by: Steven Barnett on 04/07/2024
// 
// Copyright © 2024 Steven Barnett. All rights reserved.
//

import Foundation

extension Bundle {
    public var appName: String { getInfo("CFBundleName")  }
    public var copyright: String {getInfo("NSHumanReadableCopyright")
        .replacing("\\\\n", with: "\n") }

    public var appBuild: String { getInfo("CFBundleVersion") }
    public var appVersionLong: String { getInfo("CFBundleShortVersionString") }
    public var appVersionFull: String {
        "\(self.appVersionLong).\(self.appBuild)"
    }

    fileprivate func getInfo(_ str: String) -> String {
        infoDictionary?[str] as? String ?? "⚠️"
    }
}

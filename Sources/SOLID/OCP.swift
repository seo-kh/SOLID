//
//  OCP.swift
//
//
//  Created by alphacircle on 10/14/24.
//  Open-Closed Principle
//  각 클래스는 확장에는 열려 있어야 하고, 변경에는 닫혀 있어야 한다.
//  -> 클래스를 수정하지 말고 확장해서 작성

import Foundation

// WORST CASE
public class ReportGenerator {
    public func generateReport(_ type: String) {
        if (type == "PDF") {
            print("Generating PDF report..")
        } else if (type == "HTML") {
            print("Generating HTML report..")
        } else {
            // ...
        }
        
        // If we need to add another format, we have to modify this method.
    }
}

// ---------------------------------

// BEST CASE

public protocol Report {
    func generate()
}

public class PDFReport: Report {
    public func generate() {
        print("Generating PDF report..")
    }
}

public class HTMLReport: Report {
    public func generate() {
        print("Generating HTML report..")
    }
}

// NEW
public class XMLReport: Report {
    public func generate() {
        print("Generating XML report..")
    }
}

// NEW
public class NewReportGenerator {
    public func generateReport(_ type: Report) {
        // OCP
        type.generate()
    }
}


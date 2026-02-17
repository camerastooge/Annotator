//
//  PageView.swift
//  Annotator
//
//  Created by Lucas Barker on 2/17/26.
//

import SwiftUI
import PDFKit

struct PDFViewRepresentable: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> some PDFView {
        let pdfView = makePDFView()
        
        return pdfView
    }
    
    private func makePDFView() -> some PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.displayDirection = .horizontal
        pdfView.pageBreakMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        pdfView.document = PDFDocument(url: url)
        
        return pdfView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

struct PageView: View {
    let url = Bundle.main.url(forResource: "whats-holding-you-back", withExtension: "pdf")
    
    var body: some View {
        PDFViewRepresentable(url: url!)
    }
}

#Preview {
    PageView()
}

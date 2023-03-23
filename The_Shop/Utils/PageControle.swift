//
//  PageControle.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 30.03.23.
//

import Foundation
import SwiftUI

//Dies ist eine Swift-Struktur namens "PageControl", die
//UIViewRepresentable implementiert. Die Struktur hat zwei
//Eigenschaften: "numberOfPages", die die Gesamtzahl der
//Seiten angibt, und "currentPage", die die aktuelle Seite
//angibt und von außen gebunden wird.

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    // Erstellt die UIView
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        return pageControl
    }

    // Aktualisiert die UIView
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }

}

//
//  ReadSize.swift
//  Vicinus
//
//  Created by Robert Adamczyk on 31.05.23.
//

/// COPIED FROM
/// https://github.com/FiveStarsBlog/CodeSamples/blob/0d764ee68ee1cfd634f6726f2867dcba383ebe99/SwiftUI-read-a-view-size/View%2BreadSize.swift
import SwiftUI

/*

Example:

var body: some View {
  childView
    .readSize { newSize in
      print("The new child size is: \(newSize)")
    }
}

*/

extension View {
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

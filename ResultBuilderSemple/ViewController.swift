//
//  ViewController.swift
//  ResultBuilderSemple
//
//  Created by 이시원 on 9/6/24.
//

import UIKit

@resultBuilder
struct UIViewBuilder {
  static func buildEither(first component: [UIView]) -> [UIView] {
    component
  }
  
  static func buildEither(second component: [UIView]) -> [UIView] {
    component
  }
  
  static func buildOptional(_ component: [UIView]?) -> [UIView] {
    return component ?? []
  }
  
  static func buildArray(_ components: [[UIView]]) -> [UIView] {
    components.flatMap { $0 }
  }
  
  static func buildPartialBlock(first: [UIView]) -> [UIView] {
    return first
  }
  
  static func buildPartialBlock(first: UIView) -> [UIView] {
    return [first]
  }
  
  static func buildPartialBlock(accumulated: [UIView], next: [UIView]) -> [UIView] {
    return accumulated + next
  }
  
  static func buildPartialBlock(accumulated: [UIView], next: UIView) -> [UIView] {
    return accumulated + [next]
  }
}

extension UIStackView {
  convenience init(@UIViewBuilder content: () -> [UIView]) {
    self.init(arrangedSubviews: content())
  }
}


class ViewController: UIViewController {
  
  //  private lazy var mainStackView: UIStackView = {
  //    let stack = UIStackView(arrangedSubviews: [fristStackView, secondStackView, thirdStackView])
  //    stack.distribution = .fillEqually
  //    return stack
  //  }()
  
  private let fristStackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [
      UIImageView(image: .init(systemName: "swift")),
      UIImageView(image: .init(systemName: "swift")),
      UIImageView(image: .init(systemName: "swift"))
    ])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    return stack
  }()
  
  private let secondStackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [
      UIImageView(image: .init(systemName: "swift")),
      UIImageView(image: .init(systemName: "swift")),
      UIImageView(image: .init(systemName: "swift"))
    ])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    return stack
  }()
  
  private let thirdStackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [
      UIImageView(image: .init(systemName: "swift")),
      UIImageView(image: .init(systemName: "swift")),
      UIImageView(image: .init(systemName: "swift"))
    ])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    return stack
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGroupedBackground
    
    //    for stack in [fristStackView, secondStackView, thirdStackView] {
    //      for _ in 0..<3 {
    //        stack.addArrangedSubview(UIImageView(image: .init(systemName: "swift")))
    //      }
    //    }
    
    let mainStackView = UIStackView {
      fristStackView
      
      for view in [secondStackView, thirdStackView] {
        view
      }
    }
    
    mainStackView.distribution = .fillEqually
    
    view.addSubview(mainStackView)
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      mainStackView.widthAnchor.constraint(equalToConstant: 300),
      mainStackView.heightAnchor.constraint(equalToConstant: 300)
    ])
  }
}


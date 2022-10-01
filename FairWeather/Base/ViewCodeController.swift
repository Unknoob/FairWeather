//
//  ViewCodeController.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 30/09/22.
//

import Foundation
import UIKit

public protocol ViewCodeControllerProtocol {
    func setupView()
    func setupSubviews()
    func setupConstraints()
}

public class ViewCodeController: UIViewController, ViewCodeControllerProtocol {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    public func setupView() {
        fatalError("Must be implemented in the subclass")
    }
    
    public func setupSubviews() {
        fatalError("Must be implemented in the subclass")
    }
    
    public func setupConstraints() {
        fatalError("Must be implemented in the subclass")
    }
}

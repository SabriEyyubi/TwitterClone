//
//  SignupController.swift
//  TwitterClone
//
//  Created by Sabri Eyyubi on 23.10.2022.
//

import Foundation
import UIKit


class SignupController: UIInputViewController {
    
    // MARK: Properties
    private let imagePicker = UIImagePickerController()
    
    private let photoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var emailContinerView: UIView = {
        let image  = UIImage(named: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: image ?? UIImage(), textField: emailTextField)
        
        return view
    }()
    private lazy var passwordContainerView: UIView = {
        let image = UIImage(named: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image ?? UIImage(), textField: passwordTextField)
        
        return view
    }()
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "E-mail")
        return tf
    }()
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let fullnameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Full Name")
        return tf
    }()
    private let usernameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Username")
        return tf
    }()
    private lazy var fullnameContinerView: UIView = {
        let image  = UIImage(named: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: image ?? UIImage(), textField: fullnameTextField)
        
        return view
    }()
    private lazy var usernameContainerView: UIView = {
        let image = UIImage(named: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image ?? UIImage(), textField: usernameTextField)
        
        return view
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have account", " Log in")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        
        return button
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - Selectors
    @objc func handleShowLogin(){
        navigationController?.popViewController(animated: true)
        
    }
    @objc func handleAddProfilePhoto(){
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    @objc func handleSignup(){
        
    }
    
    // MARK: Lifecyles

    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.isNavigationBarHidden = true
        configureUI()
        
        //view.backgroundColor = .systemRed
        
    }
    
// MARK: Helpers
    
    func configureUI(){
        view.backgroundColor = .twitterBlue
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(photoButton)
        photoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        photoButton.setDimensions(width: 128, height: 128)
        
        let stack = UIStackView(arrangedSubviews: [emailContinerView, passwordContainerView, fullnameContinerView, usernameContainerView, signupButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: photoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
}


// MARK : Picker Delegate
extension SignupController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else {return}
        photoButton.layer.cornerRadius = 128 / 2
        photoButton.layer.masksToBounds = true
        photoButton.imageView?.contentMode = .scaleAspectFit
        photoButton.imageView?.clipsToBounds = true
        photoButton.layer.borderColor = UIColor.white.cgColor
        photoButton.layer.borderWidth = 3
        self.photoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal) // check it later
        
        dismiss(animated: true)
        
    }
}

//
//  LoginViewController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 10/01/18.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
  
  var menuController: MenuViewController?
  
  var inputsContainerViewHeightAnchor: NSLayoutConstraint?
  var nameTextFieldHeightAnchor: NSLayoutConstraint?
  var emailTextFieldHeightAnchor: NSLayoutConstraint?
  var passwordTextFieldHeightAnchor: NSLayoutConstraint?
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // screen background color
    view.backgroundColor = UIColor(r: 0, g: 85, b: 146)
    
    view.addSubview(inputsContainerView)
    view.addSubview(loginRegisterButton)
    view.addSubview(profileImageView)
    view.addSubview(loginRegisterSegmentedControl)
    view.addSubview(messageText)
    
    setupInputsContainerView()
    setupLoginRegisterButton()
    setupProfileImageView()
    setupLoginRegisterSegmentedControl()
    setupMessageText()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    nameTextField.becomeFirstResponder()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
    super.touchesBegan(touches, with: event)
  }
  
  lazy var profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "default_image")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 10
    imageView.clipsToBounds = true
    
//        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
    imageView.isUserInteractionEnabled = true
    
    return imageView
  }()
  
  lazy var loginRegisterSegmentedControl: UISegmentedControl = {
    let sc = UISegmentedControl(items: ["Login", "Register"])
    sc.translatesAutoresizingMaskIntoConstraints = false
    sc.tintColor = UIColor(r: 255, g: 255, b: 255)
    sc.selectedSegmentIndex = 1
    sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
    return sc
  }()
  
  let inputsContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 5
    view.layer.masksToBounds = true
    return view
  }()
  
  let nameTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "User Name"
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  let nameSeparatorView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let emailTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Email"
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  let emailSeparatorView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let passwordTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Password"
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.isSecureTextEntry = true
    return tf
  }()

  lazy var loginRegisterButton: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = UIColor(r: 0, g: 100, b: 200)
    button.setTitle("Register", for: UIControl.State())
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitleColor(UIColor.white, for: UIControl.State())
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    button.layer.cornerRadius = 5
    
    button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
    
    return button
  }()

  let messageText: UILabel = {
    let tf = UILabel()
    tf.text = "If you are considering suicide please reach out to the Suicide Prevention Hotline at 1-800-273-8255."
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.numberOfLines = 4
    tf.textAlignment = .center
    tf.textColor = UIColor(r: 255, g: 255, b: 255)
    return tf
  }()
  
  @objc func handleLoginRegister() {
    if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
      handleLogin()
    } else {
      handleRegister()
    }
  }
 
  func handleRegister() {
    self.showSpinner(onView: self.view)
    guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text,
      !name.isEmpty, !email.isEmpty, !password.isEmpty
      else {
        invalidRegistrationAlert()
        self.removeSpinner()
        return
    }
    
    AppSettings.displayName = name
    Auth.auth().signInAnonymously(completion: nil)
  }

  @objc private func handleLogin() {
    self.showSpinner(onView: self.view)
    guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text,
      !name.isEmpty, !email.isEmpty, !password.isEmpty
      else {
        invalidLoginAlert()
        self.removeSpinner()
        return
    }
    
    AppSettings.displayName = name
    Auth.auth().signInAnonymously(completion: nil)
  }
  
  private func invalidLoginAlert() {
    let alert = UIAlertController(title: "Invalid Login", message: "Login is invalid", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
  func invalidRegistrationAlert() {
    let alert = UIAlertController(title: "Invalid Registration", message: "Registration is invalid", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }

  @objc func handleLoginRegisterChange() {
    let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
    loginRegisterButton.setTitle(title, for: UIControl.State())
/*
    // change height of inputContainerView, but how???
    inputsContainerViewHeightAnchor?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
    
    // change height of nameTextField
    nameTextFieldHeightAnchor?.isActive = false
    nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
    nameTextFieldHeightAnchor?.isActive = true
    nameTextField.isHidden = loginRegisterSegmentedControl.selectedSegmentIndex == 0
    
    emailTextFieldHeightAnchor?.isActive = false
    emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
    emailTextFieldHeightAnchor?.isActive = true
    
    passwordTextFieldHeightAnchor?.isActive = false
    passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
    passwordTextFieldHeightAnchor?.isActive = true
 */
  }
 
  func setupProfileImageView() {
    //need x, y, width, height constraints
    profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -12).isActive = true
    profileImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
  }

  func setupLoginRegisterSegmentedControl() {
    //need x, y, width, height constraints
    loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
    loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1).isActive = true
    loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
  }

  func setupInputsContainerView() {
    //need x, y, width, height constraints
    inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
    inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
    inputsContainerViewHeightAnchor?.isActive = true
    
    inputsContainerView.addSubview(nameTextField)
    inputsContainerView.addSubview(nameSeparatorView)
    inputsContainerView.addSubview(emailTextField)
    inputsContainerView.addSubview(emailSeparatorView)
    inputsContainerView.addSubview(passwordTextField)
    
    //need x, y, width, height constraints
    nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
    nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
    
    nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
    nameTextFieldHeightAnchor?.isActive = true
    
    //need x, y, width, height constraints
    nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
    nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
    nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    //need x, y, width, height constraints
    emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
    emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
    
    emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    
    emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
    
    emailTextFieldHeightAnchor?.isActive = true
    
    //need x, y, width, height constraints
    emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
    emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
    emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    //need x, y, width, height constraints
    passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
    passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
    
    passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
    passwordTextFieldHeightAnchor?.isActive = true
  }

  func setupLoginRegisterButton() {
    //need x, y, width, height constraints
    loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
    loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }


  func setupMessageText() {
    //need x, y, width, height constraints
    messageText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    messageText.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 180).isActive = true
    messageText.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
    messageText.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  
}

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements () {
        
        //Hide the error label
        errorLabel.alpha = 0;
        
        //Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else  {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constance.Storyboard.homeViewController) as? HomeViewController
                      
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}

import UIKit
import Lottie

public class SplashViewController: UIViewController {
    
    private var animationView: AnimationView?
    
    public override func viewDidAppear(_ animated: Bool) {
        animationView = .init(name: "business_idea_animation")
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 1.00
        view.addSubview(animationView!)
        animationView!.play{ (finished) in
            self.startFlutterApp()
        }
    }
    
    func startFlutterApp() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let flutterEngine = appDelegate.flutterEngine
        let flutterViewController =
            FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        flutterViewController.modalPresentationStyle = .custom
        flutterViewController.modalTransitionStyle = .crossDissolve
        
        present(flutterViewController, animated: true, completion: nil)
        
    }
}

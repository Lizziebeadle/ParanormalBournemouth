import UIKit
import MapKit

class ViewController: UIViewController {

 
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    mapView.showsUserLocation = true
    
    
    label.text = nil
    
    
    mapView.delegate = self
    
  }
  
  
  
  func addHomeAnnotation() {
    
    // 5.1
    let coordinate = CLLocationCoordinate2D(latitude: 50.784315, longitude: -1.989113)
    
    // 5.2
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    annotation.title = "Home"
    mapView.addAnnotation(annotation)
    
    // 5.3
    mapView.showAnnotations([annotation], animated: true)
  
  }
  
  @IBAction func addMarker(_ sender: Any) {
    // 6
    addHomeAnnotation()
  }
  
}



extension ViewController: MKMapViewDelegate {
  
  // 7
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
   
    // 7.1
    let annotation = view.annotation
    
    // 7.2
    label.text = annotation?.title ?? nil
    
  }
  
  // 8
  func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
    label.text = nil
  }
  
}

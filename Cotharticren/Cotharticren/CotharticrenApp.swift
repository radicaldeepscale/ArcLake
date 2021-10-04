import Foundation
import SwiftUI
import CoreData
import Combine
import PDFKit
import SceneKit
import WebKit



@main



struct CotharticrenApp: App {
    var body: some Scene {

        
       
    
        
        WindowGroup("Cotharticren") {
            
                
                
            ContentView()
        
                
                
            
        }.handlesExternalEvents(matching: Set(arrayLiteral: "Cotharticren"))
        
        WindowGroup("Nozzle Palette") {
            
                
                
            Content2View().frame(width: 400, height: 250, alignment: .center).padding(50).background(Color.white)
                
                
            
        }.handlesExternalEvents(matching: Set(arrayLiteral: "Nozzle Palette"))
  
    
        
 
        /*
        WindowGroup {
            NavigationView {
                ChromiumPond(
                    leafstore: leafstore,
                    selectedLeaf: $selectedLeaf,
                    selectedPond: $selectedPond
                )
                Text("Select leaf...")
                Text("Select pond...")
            }
           }.handlesExternalEvents(matching: Set(arrayLiteral: "ChromiumPond"))
         */
        .commands {
            CommandMenu("Articren") {
                Button(action: {
                    OpenPondGlass.ChromiumPond.openpond()
                }){
                            Text("Cotharticren")
                         }
                    Divider()
              
            }
            CommandMenu("DART Meadow Grid") {
            Button(action: {
                        OpenPondGlass.ExploreDM.exploredm()
                   }){
                        Text("DART Meadow")
                     }
                Divider()
            }
        }
    }
 
    /*
        WindowGroup {
            NavigationView {
                FactoryLab(
                    store: store,
                    selectedFolder: $selectedFolder,
                    selectedLabTable: $selectedLabTable
                )
                Text("Select folder...")
                Text("Select atm26table...")
                Text("Select orbittable...")
            }
        }.handlesExternalEvents(matching: Set(arrayLiteral: "FactoryLab"))
 */
     
    /*
     .commands {
         CommandMenu("Articren") {
    Button(action: {
                OpenWindows.FactoryLab.open()
    }){
                Text("Factory Lab")
             }
        Divider()
*/
                /*
                Button(action: {
                            OpenWindows.Shapes.open()
                       }){
                            Text("Orbit Shapes")
                         }
                    Divider()
 */
            
enum OpenPondGlass: String, CaseIterable {
    
    /*
    case Orbit = "Orbit"
    case Shapes  = "Shapes"
    case ATM26  = "ATM26"
    case FactoryLab  = "FactoryLab"
 */
    case ChromiumPond = "Cotharticren"
    case ExploreDM = "ExploreDM"
    //As many views as you need.
    func exploredm(){
       if let ExploreDM = URL(string: "https://www.dartmeadow.com"){
        NSWorkspace.shared.open(ExploreDM)
        }
        }
   func openpond(){
    if let url = URL(string: "Cotharticren://\(self.rawValue)") { //replace myapp with your app's name
    NSWorkspace.shared.open(url)
    
}
    func Google(_ sender: NSMenuItem) {
        if let url = URL(string: "http://google.fi") {
            NSWorkspace.shared.open(url)
        }
    }
        

   }
}
   
    }

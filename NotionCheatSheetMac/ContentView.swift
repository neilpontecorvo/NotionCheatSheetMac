import SwiftUI

struct ContentView: View {
    var body: some View {
        // Display the WebView, telling it to load your file
        // Use the base name of your file (without .html)
        WebView(localFileName: "notion_spa_che")
            // Give the app window a default size
            // You can change these values
            .frame(minWidth: 800, minHeight: 600)
    }
}

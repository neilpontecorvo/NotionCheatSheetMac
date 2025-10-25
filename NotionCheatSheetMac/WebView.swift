import SwiftUI
import WebKit

// This struct creates a SwiftUI view that wraps the macOS WKWebView
struct WebView: NSViewRepresentable {

    // The name of your local HTML file
    let localFileName: String

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        // --- NEW LINE ---
        // This line enables the Safari Web Inspector
        webView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
        // --- END NEW LINE ---
        
        // This allows the JavaScript in your file to run
        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        // Find the path to your HTML file in the app bundle
        if let url = Bundle.main.url(forResource: localFileName, withExtension: "html") {
            // Allow the WebView to read from this file path
            nsView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        } else {
            // Handle the error if the file isn't found
            let html = "<html><body><h1>Error: \(localFileName).html not found.</h1></body></html>"
            nsView.loadHTMLString(html, baseURL: nil)
        }
    }
}

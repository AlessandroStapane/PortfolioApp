import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // URL del widget di Buy Me a Coffee
        let urlString = "https://cdnjs.buymeacoffee.com/1.0.0/widget.prod.min.js"

        // Codice JavaScript per configurare il widget
        let scriptString = """
        var widget = document.createElement("script");
        widget.setAttribute("data-name", "BMC-Widget");
        widget.setAttribute("data-cfasync", "false");
        widget.src = "\(urlString)";
        document.body.appendChild(widget);
        """

        // Esegui il codice JavaScript nella WebView
        webView.evaluateJavaScript(scriptString, completionHandler: nil)
    }

    // Gestione degli errori di caricamento
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("WebView failed to load with error: \(error.localizedDescription)")
    }
}

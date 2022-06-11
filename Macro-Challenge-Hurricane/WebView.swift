//
//  WebViewController.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 18/05/22.
//


import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    
    // This has to be inside the representable structure
    class Coodinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // MARK: - UI Delegate
        
        //        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        //            self.alertMessage.wrappedValue = message
        //            self.showAlert.wrappedValue.toggle()
        //            completionHandler()
        //        }
        //
        //        func webView(_ webView: WKWebView,
        //                     runJavaScriptConfirmPanelWithMessage message: String,
        //                     initiatedByFrame frame: WKFrameInfo,
        //                     completionHandler: @escaping (Bool) -> Void) {
        //            self.alertMessage.wrappedValue = message
        //            self.showAlert.wrappedValue.toggle()
        //            completionHandler(true)
        //        }
        
        // MARK: - Navigation Delegate
        
        func webView(_ webView: WKWebView,
                     decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let fragment: String? = webView.url?.fragment
            
            if ((fragment?.contains("access_token")) != nil) {
                let pattern = #"access_token=(.*)&scope"#
                let regex = try! NSRegularExpression(pattern: pattern)
                let testString = fragment
                
                let stringRange = NSRange(location: 0, length: testString!.utf16.count)
                let matches = regex.matches(in: testString!, range: stringRange)
                var result: [[String]] = []
                for match in matches {
                    var groups: [String] = []
                    for rangeIndex in 1 ..< match.numberOfRanges {
                        let nsRange = match.range(at: rangeIndex)
                        guard !NSEqualRanges(nsRange, NSMakeRange(NSNotFound, 0)) else { continue }
                        let string = (testString! as NSString).substring(with: nsRange)
                        groups.append(string)
                    }
                    if !groups.isEmpty {
                        result.append(groups)
                    }
                }
                let token: String = (result.first?.first)!
                DataManager.standard.setToken(token: token)
                webView.removeFromSuperview()
            }
        }
        
        
        func webViewDidClose(_ webView: WKWebView) {
        }
        
    }
    
    func makeCoordinator() -> Coodinator {
        return Coodinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        let webview = WKWebView()
        webview.uiDelegate = context.coordinator
        webview.navigationDelegate = context.coordinator
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        let queryItems = [
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "client_id", value: "gr00lzfowgva96iyhapl47cswwghmg"),
            URLQueryItem(name: "redirect_uri", value: "https://twitch-service-apple-academy.herokuapp.com/oauth-callback"),
            URLQueryItem(name: "scope", value: "channel:manage:polls+channel:read:polls")
        ]
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "id.twitch.tv"
        urlComponents.path = "/oauth2/authorize"
        urlComponents.queryItems = queryItems
        
        let request = URLRequest(url: urlComponents.url!)
        uiView.load(request)
    }
}

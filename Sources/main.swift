////
////  main.swift
////  ETServer
////
////  Created by Bill Abt on 11/12/15.
////  Copyright © 2015 IBM. All rights reserved.
////
//
//#if os(OSX) || os(iOS) || os(tvOS) || os(watchOS)
//	import Darwin
//	import Foundation
//#elseif os(Linux)
//	import Foundation
//	import Glibc
//	import ETSocket
//#endif
//
//import Dispatch
//import SwiftSSL
//
//class ETServer {
//  
//  static let QUIT: String = "QUIT"
//  
//  let port: Int
//  
//  var listenSocket: ETSocket? = nil
//
//  init(port: Int) {
//    
//    self.port = port
//
//  }
//  
//  deinit {
//    
//    self.listenSocket?.close()
//  }
//  
//  func run() {
//    
//    do {
//
//      let credentials = SSLCredentials(certificateFile: "certificate.pem",
//	keyFile: "key.pem")
//      
//      try self.listenSocket = ETSocket.defaultSSLConfigured(credentials)
//      
//      guard let socket = self.listenSocket else {
//	
//	print("Unable to unwrap socket...")
//	return
//      }
//      
//      try socket.listenOn(self.port, maxPendingConnections: 10)
//      
//      print("Listening on port: \(self.port)")
//      
//      try socket.acceptConnection()
//      
//      print("Accepted connection from: \(socket.remoteHostName) on port \(socket.remotePort)")
//      
//      try self.listenSocket?.writeString("Hello, type 'QUIT' to end session\n")
//      
//      var bytesRead = 0
//      var response: String? = nil
//      repeat {
//	
//	let readData = NSMutableData()
//	bytesRead = try socket.readData(readData)
//	
//	var reply: String
//	if bytesRead > 0 {
//	  
//	  if let ns = NSString(data: readData, encoding: NSUTF8StringEncoding) {
//	    response = ns.substringWithRange(NSRange(location: 0, length: ns.length))
//	    print("Server received: \(response!)")
//	    reply = "Server response:\n\(response!)"
//	  } else {
//	    reply = "Unable to convert received string..."
//	  }
//	  
//	  try socket.writeString(reply)
//	}
//	
//	if bytesRead == 0 {
//	  
//	  break
//	}
//	
//      } while !response!.hasPrefix(ETServer.QUIT)
//      
//      socket.close()
//      
//    } catch let error as ETSocketError {
//      
//      print("Error reported:\n \(error.description)")
//      
//    } catch {
//      
//      print("Unexpected error...")
//    }
//  }
//}
//
//let port = 1337
//let server = ETServer(port:port)
//print("Connect using Terminal via 'telnet 127.0.0.1 \(port)'")
//server.run()

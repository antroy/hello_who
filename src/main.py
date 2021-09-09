#!/usr/bin/env python
# -*- coding: utf-8 -*-

from http.server import BaseHTTPRequestHandler
import socketserver
from os import environ

template = "<html><body>%s %s</body></html>"

class CustomHelloHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-Type', 'text/html')
        self.end_headers()

        greeting = environ.get("GREETING", "Hello")
        name = environ.get("NAME", "World")

        if "kill" in self.path:
            self.wfile.write(bytes(template % ("Exiting", ""), "utf-8"))
            print("Exiting")
            exit(0)
        self.wfile.write(bytes(template % (greeting, name), "utf-8"))
        

if __name__ == "__main__":
    PORT = int(environ.get("HELLO_PORT", "8000"))

    socketserver.TCPServer.allow_reuse_address=True

    with socketserver.TCPServer(("", PORT), CustomHelloHTTPRequestHandler) as httpd:
        print("serving at port", PORT)
        try:
            httpd.serve_forever()
        finally:
            httpd.server_close()

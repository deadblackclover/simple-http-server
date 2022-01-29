;;; server.scm --- Simple HTTP server
;;; Copyright (c) 2022, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Code:
(use-modules (ice-9 rdelim) 
             (ice-9 textual-ports) 
             (web request) 
             (web server) 
             (web uri))

(define content "")

(define (get-content filename) 
  (let ((input-file (open-file (string-append "." filename) "r"))) 
    (get-string-all input-file)))

(define (request-path-components request) 
  (uri-path (request-uri request)))

(define (my-handler request request-body) 
  (values '((content-type . (text/plain))) 
          (get-content (request-path-components request))))

(run-server my-handler 'http '(#:port 8081))
;;; server.scm ends here

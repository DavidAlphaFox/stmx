;; -*- lisp -*-

;; This file is part of STMX.
;; Copyright (c) 2013 Massimiliano Ghilardi
;;
;; This library is free software: you can redistribute it and/or
;; modify it under the terms of the Lisp Lesser General Public License
;; (http://opensource.franz.com/preamble.html), known as the LLGPL.
;;
;; This library is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty
;; of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;; See the Lisp Lesser General Public License for more details.


;;;; * STMX.UTIL

(in-package :cl-user)

(defpackage #:stmx.util
  
  (:use #:cl
        #:stmx.lang
        #:stmx)

  ;; no need for closer-mop version of typep and subtypep;
  ;; they even cause some tests to fail
  #+cmucl
  (:shadowing-import-from #:cl
                          #:typep
                          #:subtypep)

  (:import-from #:stmx
                #:+dummy-tvar+ #:peek-$ #:try-take-$ #:try-put-$)

  (:export #:tcons #:tlist #:tfirst #:trest #:tpush #:tpop ;; transactional CONS cell and list

           #:tcell #:tfifo #:tstack #:tchannel #:tport  ;; transactional containers
           
           #:full? #:empty? #:empty! ;; methods for transactional containers
           #:peek   #:take   #:put
           #:try-take    #:try-put

           ;; optimized versions of < > = /= useful with sorted maps
           #:fixnum< #:fixnum>
           #:fixnum= #:fixnum/=
           
           #:bmap  ;; generic binary tree
           #:rbmap ;; sorted map, implemented with red-black trees
           #:tmap  ;; transactional sorted map, implemented with red-black trees

           #:bmap-pred   #:bmap-count  #:bmap-empty?
           #:clear-bmap  #:copy-bmap   #:copy-bmap-into
           #:get-bmap    #:set-bmap    #:rem-bmap  ;; also (setf (get-bmap ...) ...)
           #:min-bmap    #:max-bmap         ;; get smallest and largest key/value
           #:map-bmap    #:do-bmap          ;; iterate on bmap
           #:bmap-keys   #:bmap-values #:bmap-pairs ;; list all keys, values, or pairs
           #:add-to-bmap #:remove-from-bmap ;; add or remove multiple keys

           ;; transactional hash table
           #:thash-table 
           #:thash-count #:thash-empty? #:clear-thash
           #:get-thash #:set-thash #:rem-thash   ;; also (setf (get-thash ... ) ... )
           #:map-thash #:do-thash  ;; iterate on thash-table

           ;; transactional simple-vector
           #:simple-tvector #:simple-tvector-length
           #:tsvref #:tsvref-tx #:tsvref-notx #:do-simple-tvector))




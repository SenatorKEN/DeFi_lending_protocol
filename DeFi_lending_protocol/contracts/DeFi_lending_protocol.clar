;; title: DeFi_lending_protocol

;; Constants and Error Codes
(define-constant CONTRACT-OWNER tx-sender)
(define-constant ERR-UNAUTHORIZED (err u1))
(define-constant ERR-INSUFFICIENT-BALANCE (err u2))
(define-constant ERR-LOAN-NOT-FOUND (err u3))
(define-constant ERR-INVALID-COLLATERAL (err u4))
(define-constant ERR-LIQUIDATION-NOT-ALLOWED (err u5))

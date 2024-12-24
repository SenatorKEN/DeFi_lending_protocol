;; title: DeFi_lending_protocol

;; Constants and Error Codes
(define-constant CONTRACT-OWNER tx-sender)
(define-constant ERR-UNAUTHORIZED (err u1))
(define-constant ERR-INSUFFICIENT-BALANCE (err u2))
(define-constant ERR-LOAN-NOT-FOUND (err u3))
(define-constant ERR-INVALID-COLLATERAL (err u4))
(define-constant ERR-LIQUIDATION-NOT-ALLOWED (err u5))

(define-constant MAX-UINT u340282366920938463463374607431768211455)
(define-constant PRECISION u1000000)

;; Additional Error Codes
(define-constant ERR-INSUFFICIENT-LIQUIDITY (err u6))
(define-constant ERR-TRANSFER-FAILED (err u7))
(define-constant ERR-ORACLE-FAILURE (err u8))

;; Storage Maps
(define-map users 
  {user: principal}
  {
    total-deposited: uint,
    total-borrowed: uint,
    health-factor: uint
  }
)

(define-map loans 
  {loan-id: uint}
  {
    borrower: principal,
    collateral-asset: principal,
    borrowed-asset: principal,
    collateral-amount: uint,
    borrowed-amount: uint,
    interest-rate: uint,
    created-at: uint,
    status: (string-ascii 20)
  }
)


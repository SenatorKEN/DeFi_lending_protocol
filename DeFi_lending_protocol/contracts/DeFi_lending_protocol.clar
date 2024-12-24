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

(define-map asset-pool
  {asset: principal}
  {
    total-liquidity: uint,
    available-liquidity: uint,
    current-utilization-rate: uint
  }
)

;; Health Factor Calculation
(define-private (calculate-health-factor (loan {
  collateral-amount: uint, 
  borrowed-amount: uint
}))
  (/ 
    (* (get collateral-amount loan) u100)
    (get borrowed-amount loan)
  )
)

;; Utility Functions
(define-read-only (get-loan-details (loan-id uint))
  (map-get? loans {loan-id: loan-id})
)

(define-read-only (get-user-health-factor (user principal))
  (default-to u0 (get health-factor (map-get? users {user: user})))
)
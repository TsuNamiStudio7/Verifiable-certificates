# 🎓 Verifiable Certificates

A blockchain-based system for issuing and verifying certificates. The project allows issuers to create certificates for recipients, which can later be verified by the recipients themselves. Perfect for educational platforms, certifications, or any decentralized system requiring verifiable credentials.

---

## 📦 Features

- Issue blockchain-based certificates.
- Verify certificates by the recipient.
- Immutable, transparent certificate records stored on-chain.
- Written in Solidity + Python (`web3.py`).

---

## 🛠 Files

- `VerifiableCertificates.sol` – Smart contract that handles certificate issuance and verification.
- `issue_certificate.py` – Python script to issue new certificates.
- `verify_certificate.py` – Python script for recipients to verify certificates.
- `VerifiableCertificates_abi.json` – ABI of the compiled contract (generated separately).

---

## 🚀 Getting Started

### 1. Deploy the contract

Use [Remix](https://remix.ethereum.org/) or a framework (e.g., Hardhat, Brownie) to deploy `VerifiableCertificates.sol`.  
Save the generated ABI to `VerifiableCertificates_abi.json`.

### 2. Install dependencies

```bash
pip install web3

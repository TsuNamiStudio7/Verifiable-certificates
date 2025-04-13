from web3 import Web3
import json

w3 = Web3(Web3.HTTPProvider("http://localhost:8545"))  # Albo Infura/Alchemy
contract_address = "0xYourContractAddressHere"
account = w3.eth.accounts[0]

with open("VerifiableCertificates_abi.json") as f:
    abi = json.load(f)

contract = w3.eth.contract(address=contract_address, abi=abi)

def issue_certificate(recipient, course):
    tx = contract.functions.issueCertificate(recipient, course).build_transaction({
        "from": account,
        "nonce": w3.eth.get_transaction_count(account),
        "gas": 3000000,
        "gasPrice": w3.to_wei("20", "gwei")
    })
    signed_tx = w3.eth.account.sign_transaction(tx, private_key="0xYourPrivateKeyHere")
    tx_hash = w3.eth.send_raw_transaction(signed_tx.rawTransaction)
    print(f"Certificate issued. Tx hash: {tx_hash.hex()}")

# Example usage:
# issue_certificate("0xRecipientAddress", "Blockchain Fundamentals")

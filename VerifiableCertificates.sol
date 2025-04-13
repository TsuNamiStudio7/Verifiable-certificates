// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VerifiableCertificates {

    struct Certificate {
        uint id;
        address issuer;
        address recipient;
        string course;
        uint timestamp;
        bool verified;
    }

    mapping(uint => Certificate) public certificates;
    uint public certificateCount;

    event CertificateIssued(uint id, address indexed issuer, address indexed recipient, string course);
    event CertificateVerified(uint id);

    // Issue a certificate for a recipient
    function issueCertificate(address recipient, string memory course) external {
        certificates[certificateCount] = Certificate({
            id: certificateCount,
            issuer: msg.sender,
            recipient: recipient,
            course: course,
            timestamp: block.timestamp,
            verified: false
        });
        emit CertificateIssued(certificateCount, msg.sender, recipient, course);
        certificateCount++;
    }

    // Verify a certificate by recipient
    function verifyCertificate(uint id) external {
        Certificate storage cert = certificates[id];
        require(msg.sender == cert.recipient, "Only recipient can verify the certificate");
        require(!cert.verified, "Certificate already verified");

        cert.verified = true;
        emit CertificateVerified(id);
    }

    // Get certificate details
    function getCertificate(uint id) external view returns (Certificate memory) {
        return certificates[id];
    }

    // Get all certificates
    function getAllCertificates() external view returns (Certificate[] memory) {
        Certificate[] memory allCertificates = new Certificate[](certificateCount);
        for (uint i = 0; i < certificateCount; i++) {
            allCertificates[i] = certificates[i];
        }
        return allCertificates;
    }
}

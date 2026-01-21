// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IoTDataIntegrity {

    // Structure to store batch data proof
    struct BatchRecord {
        string batchId;
        string timePeriod;
        string dataHash;
        uint256 timestamp;
    }

    // Mapping batch ID to record
    mapping(string => BatchRecord) private records;

    // Event to notify when data is stored
    event DataStored(
        string batchId,
        string timePeriod,
        string dataHash,
        uint256 timestamp
    );

    // Function called by Node.js to store hash
    function storeDataHash(
        string memory _batchId,
        string memory _timePeriod,
        string memory _dataHash
    ) public {
        records[_batchId] = BatchRecord(
            _batchId,
            _timePeriod,
            _dataHash,
            block.timestamp
        );

        emit DataStored(
            _batchId,
            _timePeriod,
            _dataHash,
            block.timestamp
        );
    }

    // Function for dashboard to read blockchain data
    function getBatchRecord(string memory _batchId)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            uint256
        )
    {
        BatchRecord memory record = records[_batchId];
        return (
            record.batchId,
            record.timePeriod,
            record.dataHash,
            record.timestamp
        );
    }
}
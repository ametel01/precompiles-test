// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModExp {
    error ProofInvalid();

    uint256 constant PRECOMPILE_MODEXP = 0x05;
    uint256 constant P =
        21888242871839275222246405745257275088696311157297823662689037894645226208583;

    function exp(uint256 a, uint256 e) internal view returns (uint256 x) {
        bool success;
        assembly ("memory-safe") {
            let f := mload(0x40)
            mstore(f, 0x20)
            mstore(add(f, 0x20), 0x20)
            mstore(add(f, 0x40), 0x20)
            mstore(add(f, 0x60), a)
            mstore(add(f, 0x80), e)
            mstore(add(f, 0xa0), P)
            success := staticcall(gas(), PRECOMPILE_MODEXP, f, 0xc0, f, 0x20)
            x := mload(f)
        }
        if (!success) {
            // Exponentiation failed.
            // Should not happen.
            revert ProofInvalid();
        }
    }

    function testExp(uint256 a, uint256 e) external view returns (uint256) {
        return exp(a, e);
    }
}

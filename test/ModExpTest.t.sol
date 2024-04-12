// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import "forge-std/console.sol";

import "../src/ModExp.sol";

contract ModExpTest is Test {
    ModExp modExp;

    function setUp() public {
        modExp = new ModExp();
    }

    function testModExp() public view {
        uint256 base = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
        uint256 exponent = 218882428718392752222464745257275088696311157297823662689037894645226208583;
        // uint256 expected = 24; // Since 2^10 % 1000 is 1024 % 1000

        uint256 result = modExp.testExp(base, exponent);
        console.log("This is a simple log message.");
        console.log("result: %e", result);
    }
}

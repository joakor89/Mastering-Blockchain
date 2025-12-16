pragma solidity ^0.5.0;

contract Addition {

    uint8 x; // declare variable x

    // define function addx with two parameters y and z
    function addx(uint8 y, uint8 z) public {
        x = y + z; // performs addition
    }

    // define function retrievex to retrieve the stored value x
    function retrievex() public view returns (uint8) {
        return x;
    }
}

pragma solidity >=0.4.21 <0.7.0;

contract Migrations {

    address public owner;
    uint public last_completed_migration;

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }
}


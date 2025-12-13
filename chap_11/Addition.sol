// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Addition {
    uint8 private x;

    function addx(uint8 y, uint8 z) public {
        x = y + z;
    }

    function retrievex() public view returns (uint8) {
        return x;
    }
}

### The Solidity language

// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract valueChecker {
    uint8 price=10;
    //price variable declared and initialized with a value of 10
    event valueEvent(bool returnValue);
    
    function Matcher(uint8 x) public returns (bool y)
    {
        if (x>=price)
        {
            emit valueEvent(true);
            y= true;
        }
    }
}

#### Functions

pragma solidity >8.0.0;
contract Test1
{
uint x=2;
function addition1() public view returns (uint y)
{
y=x+2;
}
}






// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Veggie is ERC20, ERC20Burnable {
    address shop;
    constructor(address _shop, string name, string symbol) ERC20(name, symbol) {
      shop = _shop;
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == shop);
        _mint(to, amount);
    }
}

//A factory for different seed types
contract SeedShop {

  address public owner;

  uint public carrotPrice;

  Veggie carrots;
  Veggie potatoes;
  Veggie tomatoes;
  Veggie broccoli;
  Veggie pumpkins;

  constructor(){
    owner = msg.sender;
    carrotPrice = = 1*10**15;

    //initialize carrots, potatoes, tomatoes, broccoli, pumpkins
    carrots = new Veggie(address(this), "Carrots", "Carrots");
    potatoes = new Veggie(address(this), "Potatoes", "Potatoes");
    tomatoes = new Veggie(address(this), "Tomatoes", "Tomatoes");
    broccoli = new Veggie(address(this), "Broccoli", "Broccoli");
    pumpkins = new Veggie(address(this), "Pumpkins", "Pumpkins");
  }

  function buyCarrots(uint numberOfCarrots) external payable{
    require(msg.value >= numberOfCarrots * carrotPrice);

  }

  function swapCarrotsForPotatoes() external{

  }


}

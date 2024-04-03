//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC404} from "../../ERC404/ERC404.sol";

contract MinimalERC404 is OwnableUpgradeable, ERC404 {
    function initialize(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        address initialOwner_
    ) public initializer {
        // Init the ERC404
        __ERC404_init(name_, symbol_, decimals_, 0);
        __Ownable_init(initialOwner_);
    }

    function mintERC20(address account_, uint256 value_) external onlyOwner {
        _mintERC20(account_, value_);
    }

    function tokenURI(
        uint256 id_
    ) public pure override returns (string memory) {
        return
            string.concat("https://example.com/token/", Strings.toString(id_));
    }

    function setERC721TransferExempt(
        address account_,
        bool value_
    ) external onlyOwner {
        _setERC721TransferExempt(account_, value_);
    }
}

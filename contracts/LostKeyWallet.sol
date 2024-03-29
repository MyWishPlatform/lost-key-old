pragma solidity ^0.4.23;

import "sc-library/contracts/wallet/WalletAbiMembers.sol";
import "sc-library/contracts/wallet/WalletAbiFunctions.sol";
import "./LostKeyERC20Wallet.sol";


contract LostKeyWallet is WalletAbiMembers, WalletAbiFunctions, LostKeyERC20Wallet {
    constructor(address _targetUser, address[] _recipients, uint[] _percents, uint64 _noActivityPeriod) public
        LostKeyERC20Wallet(_targetUser, _recipients, _percents, _noActivityPeriod) {
    }

    function execute(address _to, uint _value, bytes _data) external onlyTarget returns (bytes32) {
        sendFundsInternal(_value, _to, _data);
        return keccak256(msg.data, block.number);
    }
}

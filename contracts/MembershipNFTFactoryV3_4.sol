// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./MembershipNFTV3_4.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract MembershipNFTFactoryV3_4 {
    address public immutable claimIssuer;
    address public immutable tokenImplementation;

    address[] public nftsProxies;

    constructor(address _claimIssuer, address _trustedForwarder) {
        claimIssuer = _claimIssuer;
        tokenImplementation = address(new MembershipNFTV3_4(_trustedForwarder));
    }

    function deployContract(
        address _creator,
        bytes12 _communityId,
        string memory _name,
        string memory _symbol,
        string memory _description,
        bytes12 campaignId, // optional, pass 0x0..
        bytes32 merkleRoot, // optional, pass 0x0..
        uint64 expireAt, // optional, pass 0
        bool _isOpenMint,
        bool _isTradable
    ) public returns (address) {
        // address tokenImplementation = address(new UpgradableNFT());
        address proxyAddress = address(
            new ERC1967Proxy(
                tokenImplementation,
                abi.encodeWithSelector(
                    MembershipNFTV3_4(address(0)).initialize.selector,
                    claimIssuer,
                    _creator,
                    _communityId,
                    _name,
                    _symbol,
                    _description,
                    campaignId,
                    merkleRoot,
                    expireAt,
                    _isOpenMint,
                    _isTradable
                )
            )
        );

        nftsProxies.push(proxyAddress);
        return proxyAddress;
    }

    function getNft(uint256 index) public view returns (address) {
        return nftsProxies[index];
    }
}

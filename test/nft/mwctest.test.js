const { ethers } =require("ethers") ;

describe("Test MWC", function () {
  it("MWC", async function () {

    const wallet = new ethers.Wallet(
        "0x87a29d7934eb8b2306657a8a654202ddf42beb390265cdaa1b4f21855948be56", 
        new ethers.providers.StaticJsonRpcProvider("https://rpc.zklink.io")
    )

    const arti = require("../../artifacts-zk/contracts/TestMWC.sol/TestMWC.json")

    const testmwc = new ethers.Contract("0xe5Dd16b4F911C07a694E4C4f6828957062AA9715",arti.abi, wallet)
    await testmwc.testTransfer("0x78B61D24D6d347DB4E3e01Ed345C2fa06224007F", {value:"10000"});
  });
});

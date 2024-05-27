import { deployContract } from "./utils";

// An example of a basic deploy script
// It will deploy a Greeter contract to selected network
// as well as verify it on Block Explorer if possible for the network
export default async function () {
  const contractArtifactName = "MembershipNFTV3_4";
  const constructorArguments = ["0x84a0856b038eaAd1cC7E297cF34A7e72685A8693"];
  await deployContract(contractArtifactName, constructorArguments);
}

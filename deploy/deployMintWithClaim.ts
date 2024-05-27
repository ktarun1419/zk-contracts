import { deployContract } from "./utils";

// An example of a basic deploy script
// It will deploy a Greeter contract to selected network
// as well as verify it on Block Explorer if possible for the network
export default async function () {
  const contractArtifactName = "MintWithClaim";
  const constructorArguments = ["0xC5d5846b013D7929dAC053d4030b00047A14DDE3"];
  await deployContract(contractArtifactName, constructorArguments);
}

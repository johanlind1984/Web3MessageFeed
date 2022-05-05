const hre = require("hardhat");

async function main() {

  // deploy
  const MessageFeed = await hre.ethers.getContractFactory("MessageFeed");
  const messagefeedContract = await MessageFeed.deploy("This categorys first message");
  await messagefeedContract.deployed();

  // publish a article
  const firstMessageTransaction = await messagefeedContract.publish(3, "Clickbaity message in games");
  console.log(firstMessageTransaction);

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

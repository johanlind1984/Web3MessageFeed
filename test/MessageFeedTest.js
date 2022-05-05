const { expect } = require("chai");
const { ethers } = require("hardhat");

//emit PostMessage(_category, publisherMessage);
describe("MessageFeed", function () {
  it("Should emit PostMeassage", async function () {
    const MessageFeed = await (await ethers.getContractFactory("MessageFeed",  { value: ethers.utils.parseEther("0.01")}));
    const message = await MessageFeed.deploy("Hello World");
    await message.deployed();

    // wait until the transaction is mined
    await expect(message.publish(0, "This is a message in Politics"))
      .to.emit(message, "PostMessage");
  });
});

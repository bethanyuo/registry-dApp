# Document Registry dApp
A document registry is a repository that contains links to documents added in the system. The Document Registry DApp is a simple registry for documents stored in a decentralized system which only the contract creator can add, but anyone can see them.

## Goal
* To deploy a simple Smart Contract using Remix IDE in Ganache CLI – command version of Ganache, a personal Ethereum blockchain perfect for our development purposes.
* To create a simple JavaScript app, which will interact with the contract using Web3 API and MetaMask.
* To utilize IPFS in storing binary data. For the example, document images will not be stored in the contract, but in IPFS. The contract should only store a representation of the images (eg. IPFS hash).

## Requirements
*	[Remix IDE](https://remix.ethereum.org/)
*	Ganache CLI  v6.9.1
```bash
$ npm install –g ganache-cli@6.9.1
```
*	Web3  v2.6.1
*	MetaMask  v7.7.8
*	[NodeJS](https://nodejs.org/en/download/releases/)  v13.5.0
*	NPM  v6.13.4
*	[IPFS](https://dist.ipfs.io/go-ipfs/v0.4.23)  v0.4.23

You might find that your version is higher, that is okay. Avoid using versions lower than what is specified as libraries used in this exercise might not be available old older versions or screenshots may not match the ones that you see on your screen.
You may or may not experience difficulties, but if you do, make sure to comply with these versions first before reporting to the instructors.

## Setup the Project
1.	Clone or download the code template here:
```bash
$ git clone https://github.com/kingsland-innovation-center/document-registry.git
```
If you don’t have git, download the code templates here:
https://github.com/kingsland-innovation-center/document-registry

2.	Navigate to that folder in the terminal and install the dependencies:
```bash
$ npm install
```

## Create the Smart Contract
1.	Create a DocumentRegistry.sol file which will hold the smart contract implementation and define the version.
 
2.	Create a simple structure called Document, which stores the string hash of the document in IPFS and the date it has been added. The contract will have an array of documents and an address which will store the owner’s address.
 
3.	A simple modifier `onlyOwner` which makes sure the caller of the method is the contract owner.
 
4.	Create the constructor, which will make the executor owner of the contract.
 
5.	Create an add function, which adds a document in the array by from its hash and the current time (`block.timestamp`) in the structure. The function returns the date of the added document.
 
6.	Finally, create `getDocumentsCount()` and `getDocument(uint256 index)` functions. This returns the count of the documents and a document by a given index.
 
## Create JavaScript Front-end
1.	Create the jQuery function which will run as soon as the DOM becomes safe to manipulate.
 

2.	As of Metamask v4.14.0, a call to `ethereum.enable()` is necessary to gain access to a user’s accounts in Metamask and enable RPC interactions. Read more here if you want to look at more details: [EIPS](https://eips.ethereum.org/EIPS/eip-1102).

Allow access using the `Injected Web3` in the browser.

3.	Next, insert the constants of the contract address and contract ABI. We will get back to this and replace it with the correct values after the contract is deployed. Also, initialize the IPFS library.

4.	Prepare the function for uploading the document. There are preset codes before this code separated with User Interface Handlers Start/End markers. This takes care of adding handlers to the user interface components.
 
5.	Check if there is any file to upload, if not, show error message.
 
6.	Create a file reader to read the given document as an array buffer.
 
7.	In the onload property check whether web3 is included.
Then, use Buffer to get a buffer from the file reader result.

Initialize the contract using the ABI and contract address.
 
8.	Next, use IPFS to add the document.

After it is uploaded, call the contract by its ABI and address and add the document.
Putting it all together, you end up with this `uploadDocument()` implementation:
 
9.	Now the function showing the documents. First, it will check if web3 is defined:
 
10.	Finally, call the contract and get the count of the documents.
After the documents count is returned, implement a `for-loop` that iterates through the index and retrieves each document.

For each document, from the received image hash create a URL with `https://localhost:8080/ipfs/{hash}` and add it as a source of an `<img>` tag.

Beautify the received date and place it in a `<p>` tag. Then, append them both in a `<div>` and finally, append it to `#viewGetDocuments`.
 
## Deploy the Document Registry Contract

1.	Install ganache by the command:
```bash
$ npm install –g ganache-cli@6.9.1
```

2.	Start ganache-cli by issuing this command on the terminal:
```bash
$ ganache-cli
```
NOTE: Do not close this terminal as you go along with the next activities.

3.	Go to [Remix](remix.ethereum.org) and return to your DocumentRegistry.sol smart contract code.

4.	Compile and choose the Web3 Provider to connect to Ganache. If you get an error message, make sure you use `http` protocol (not `https`) when opening Remix. 

5.	In Account you must see the accounts from your local Ethereum network.

6.	Deploy the contract. After the deployment, the contract will appear beneath. Copy the contract address.

7.	To get the ABI, go back to Solidity compiler, copy the output.
 
8.	Go back to the project and paste the Contract Address and the ABI for the variables we previously wrote.
 
 
## IPFS Configuration
1.	You should have installed IPFS and added it to your Path or simply extract it somewhere and launch a terminal on that particular folder.
 

2.	In your IPFS configuration file, set the API HTTP CORS header so that there would be no CORS-related errors in the browser:
* For Windows, the configuration file can be found in:		 `%homepath%\.ipfs`
* For Unix-like platforms, the configuration file is located in:	 `~/.ipfs`
 

3.	Start the IPFS daemon:
```bash
$ ipfs daemon
```
 
## Interacting with the Contract and IPFS
1.	Log-in to MetaMask and switch to Local Network and prepare to import a private key.

2.	Import the private keys from ganache-cli:
* Contract creator account – The account used to deploy the contract previously in Remix IDE.
*	One random account.
 
3.	Go back to your document-registry workspace and launch the client:
```bash
$ npm start
```

4.	Go to your browser and visit http://localhost:3000.

5.	Upload any kind of a file in the [Submit Document] section. Click [Submit].
 
6.	A MetaMask prompt will appear, click [Confirm].

7.	Confirmation messages will appear both in the browser and in Ganache-CLI
 
8.	Go to [View Documents] to see successfully submitted documents.

## Module
MI4: Module 3: E2

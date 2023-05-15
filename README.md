# Echidna Token Distributor
We will implement a Token distribution contract that will add multiple members to the array so we can distribute the ERC20 token equally between them. 
We will also implemetn a fuzzing contract using assertion mode in echidna to check if there's still some token remaining in the contract.
## Installation on Windows
### If you're using Windows, follow these steps to install and use Foundry:

1-Install Foundry on your Windows machine.

2-Clone the repository to your local machine.

3-Open your terminal and run forge build.

Install Docker for Windows and the Trail of Bits Security Toolbox by following the instructions on their GitHub page: [Trail of Bits Security Toolbox](https://github.com/trailofbits/eth-security-toolbox).

Install Foundry by running ```curl -L https://foundry.paradigm.xyz | bash``` in your terminal.  

![alt text](https://github.com/PatoSF/Echidna_Token_Distributor/blob/master/Images/docker.png) 

After installing Docker and the Trail of Bits Security Toolbox, run ```docker build -t <ChooseAName>``` to create a Docker image with both security toolbox and foundry. Run ```docker run -it --mount type=bind,source="${PWD}",target=/code <ChooseAName>``` to create a container. If your project is located on your Desktop, navigate to it by running cd .. twice, then cd code.

![alt text](https://github.com/PatoSF/Echidna_Token_Distributor/blob/master/Images/Screenshot%20(433).png) 

Once you're in your project's path, run forge build to compile the project. To run the fuzz test, use the command ```echidna-test . --contract TutorialTest --test-mode assertion```.

![alt text](https://github.com/PatoSF/Echidna_Token_Distributor/blob/master/Images/Screenshot%20(434).png) 

Echidna divided 1 billion tokens between 15 addressess so 1,000,000,000 / 15 = 66,666,666.666667 tokens per user.

0.666667 x 15 = 10.000005 tokens left in the contract that's why the test will fail.

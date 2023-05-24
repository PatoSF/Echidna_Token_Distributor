# Echidna Token Distributor
We will implement a Token distribution contract that will add multiple members to the array so we can distribute the ERC20 token equally between them. 
We will also implemetn a fuzzing contract using assertion mode in echidna to check if there's still some token remaining in the contract.
## Installation on Windows
### If you're using Windows, follow these steps to install and use Foundry:



1-Install Foundry on your Windows machine.

2-Clone the repository to your local machine.

3-Open your terminal and run forge build.

Install [Docker](https://www.docker.com/) for Windows then install [Trail of Bits Security Toolbox](https://github.com/trailofbits/eth-security-toolbox) on docker and Foundry by running ```curl -L https://foundry.paradigm.xyz | bash``` in your terminal.  

![alt text](https://github.com/PatoSF/Echidna_Token_Distributor/blob/master/Images/docker.png)

After installing Foundry and the Trail of Bits Security Toolbox, run ```docker build -t <ChooseAName> .``` to create a Docker image with both ToB security toolbox and Foundry. 

| Steps | Copy/Paste commands |
|-----:|-----------|
|     1| ```docker build -t <ChooseAName> .``` to create a Docker image with both ToB security toolbox and Foundry|
|     2| ```docker run -it --mount type=bind,source="${PWD}",target=/code <ChooseAName>``` to create a container of the image  |
|     3| ```cd ..```       |
|     4| ```cd ..```       |
|     5| ```cd code```       |
|     6| ```forge build``` to compile the project       |
|     7| ```echidna-test . --contract TutorialTest --test-mode assertion``` to run echidna in assertion mode      |

Run ```docker run -it --mount type=bind,source="${PWD}",target=/code <ChooseAName>``` to create a container. If your project is located on your Desktop, navigate to it by running ```cd ..``` twice then ```cd code``` and run ```forge build```.

![alt text](https://github.com/PatoSF/Echidna_Token_Distributor/blob/master/Images/Screenshot%20(433).png) 

Then run the fuzz test using the command ```echidna-test . --contract TutorialTest --test-mode assertion```.

![alt text](https://github.com/PatoSF/Echidna_Token_Distributor/blob/master/Images/Screenshot%20(434).png) 

Echidna divided 1 billion tokens between 15 addressess so 1,000,000,000 / 15 = 66,666,666.666667 tokens per user.

0.666667 x 15 = 10.000005 tokens left in the contract that's why the test will fail.

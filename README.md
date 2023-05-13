# Token Distribution Fuzz Test

## Installation on Windows
If you're using Windows, follow these steps to install and use Foundry:

1-Install Foundry on your Windows machine.

2-Clone the repository to your local machine.

3-Open your terminal and run forge build.

Install Docker for Windows and the Trail of Bits Security Toolbox by following the instructions on their respective GitHub pages: Docker and Trail of Bits Security Toolbox.

Install Foundry by running ```curl -L https://foundry.paradigm.xyz | bash``` in your terminal.
![Screenshot of a comment on a GitHub issue showing an image, added in the Markdown, of an Octocat smiling and raising a tentacle.]([https://github.com/PatoSF/Echidna_Token_Distributor/blob/master/Images/Screenshot%20(426).png))

After installing Docker and the Trail of Bits Security Toolbox, run ```docker build -t <ChooseAName>``` to create a Docker image with both tools and Foundry.

Run ```docker run -it --mount type=bind,source="${PWD}",target=/code <ChooseAName>``` to create a container. If your project is located on your Desktop, navigate to it by running cd .. twice, then cd code.

Once you're in your project's path, run forge build to compile the project. To run the fuzz test, use the command ```echidna-test . --contract TutorialTest --test-mode assertion```.

In summary, these steps will set up a development environment on your Windows machine with the necessary tools to build and test smart contracts using Foundry. See below for a visual representation of the process:

import fs from "fs";
import readline from "readline";
import { spawn } from "child_process";

const githubDirectoryPath = "C:\\Users\\bradagy\\Desktop\\github\\tools";

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

rl.question("Enter the name of your project: ", (project) => {
    const projectPath = `${githubDirectoryPath}\\${project}`;

    console.log(`Project name: ${projectPath}`);

    if (!fs.existsSync(`${projectPath}`)) {
        fs.mkdirSync(`${githubDirectoryPath}\\${project}`);
    } else {
        console.log(`Project directory already exists at: ${projectPath}`);
    }

    process.chdir(projectPath);

    const child = spawn("npm", ["init", "-y"], { shell: true });

    child.stdout.on("data", (data) => {
        console.log(`stdout: ${data}`);
    });
    child.stderr.on("data", (data) => {
        console.log(`stderr: ${data}`);
    });
    child.on("error", (error) => {
        console.log(`Error: ${error.message}`);
    });
    child.on("close", (code) => {
        console.log(`Child process exited with code ${code}`);
    });

    rl.close();
});

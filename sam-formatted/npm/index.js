// This file serves as the entry point for the npm package. It requires the main script and exports necessary functions or configurations.

const { exec } = require('child_process');
const path = require('path');

// Path to the main script
const scriptPath = path.join(__dirname, '../..', 'bin', 'run-sam-formatted.sh');

// Function to execute the main script
const runScript = (args) => {
    const command = `${scriptPath} ${args.join(' ')}`;
    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error executing script: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`Script error: ${stderr}`);
            return;
        }
        console.log(stdout);
    });
};

// Export the runScript function for use in other modules
module.exports = {
    runScript,
};
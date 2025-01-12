#!/bin/bash

# Helper function to interactivly upgrade and install deps.
function upgrade_and_install {
    pnpx npm-check-updates -i

    echo "ℹ️ Starting clean up..."
    rm -rf node_modules pnpm-lock.yaml

    echo "ℹ️ Starting instalation..."
    pnpm i
}

# Upgrade deps for the npm package.
upgrade_and_install

# Upgrade deps for the page router example.
cd examples/with-pages-router || exit
upgrade_and_install
cd ../../

# Upgrade deps for the app router example.
cd examples/with-app-router || exit
upgrade_and_install
cd ../../

echo "✅ All done!"
exit 0

# GitHub Actions for Firebase-Tools

This Action for [firebase-tools](https://github.com/firebase/firebase-tools) enables arbitrary actions with the `firebase` command-line client.

## Inputs

- `args` - **Required**. This is the arguments you want to use for the `firebase` cli

## Environment variables

- `FIREBASE_TOKEN` - **Required**. The token to use for authentication. This token can be aquired through the `firebase login:ci` command.

- `PROJECT_ID` - **Required**. To specify a specific project to use for all commands.

- `PROJECT_PATH` - **Optional**. The path to `firebase.json` if it doesn't exist at the root of your repository. e.g. `./my-app`

## Example

To authenticate with Firebase, and deploy to Firebase Hosting:

```yaml
name: Build and deploy in Firebase Functions (Development)
on:
  push:
    branches:
      - dev

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - uses: actions/setup-node@master
        with:
          node-version: "10.x"
      - name: Install node dependencies
        run: npm install
        working-directory: "./functions"
      - uses: imenesesl/firebase-tools-action@main
        with:
          args: deploy --only functions
        env:
          FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
          PROJECT_ID: ${{ secrets.FIREBASE_PROJECT_ID }}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

### Gratitude

Gratitude to Jeremy Shore **w9jds**, this project is an adaptation focused on Firebase and his command line with firebase-tools

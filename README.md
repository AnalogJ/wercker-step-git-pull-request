# git-pull-request step

Will create a pull request from the current branch to the specified branch, if current branch name matches

### source
- type: string
- optional: false
- description: the source branch for the pull request (eg. development).
If the source branch does not match the current wercker branch name, this step will do nothing.

### destination
- type: string
- optional: false
- description: the destination branch for the pull request (eg. master).

## github_access_token
- type: string
- optional: false
- description: the github access token used to submit the pull request.

## Example
    - git-pull-request:
        source: development
        destination: master

# License

The MIT License (MIT)
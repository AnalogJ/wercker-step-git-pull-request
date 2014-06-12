if [ -z "$WERCKER_GIT_PULL_REQUEST_SOURCE"  ]; then
    export WERCKER_GIT_PULL_REQUEST_SOURCE="development";
fi

if [ -z "$WERCKER_GIT_PULL_REQUEST_DESTINATION"  ]; then
    export WERCKER_GIT_PULL_REQUEST_DESTINATION="master";
fi


if [ ! "$WERCKER_GIT_PULL_REQUEST_SOURCE" = "$WERCKER_GIT_BRANCH" ]; then
    setMessage "skipping, the source branch does not match the current branch"
    exit(0)
fi

echo "Creating pull request"
curl --user "$WERCKER_GIT_PULL_REQUEST_GITHUB_ACCESS_TOKEN:x-oauth-basic" \
       --request POST \
       --data '{"head": "$WERCKER_GIT_PULL_REQUEST_SOURCE", "base": "$WERCKER_GIT_PULL_REQUEST_DESTINATION","title":"wercker automated pull request from $WERCKER_GIT_BRANCH branch."}' \
       https://api.github.com/repos/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY/pulls
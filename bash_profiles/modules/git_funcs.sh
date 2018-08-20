function gitPullForce() {
  local BRANCH=$(git rev-parse --abbrev-ref HEAD)
  # echo "$BRANCH"
  git fetch
  git reset upstream/${BRANCH} --hard
}
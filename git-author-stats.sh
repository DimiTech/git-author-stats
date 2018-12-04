#!/bin/bash

if [ ! -d .git ]
then
  echo "Not a git repository root!"
  exit 1
fi

git shortlog -s | sort -n -r | while read COMMITS_AND_AUTHOR
do
  COMMITS=$(echo $COMMITS_AND_AUTHOR | cut -d ' ' -f 1)
  AUTHOR=$( echo $COMMITS_AND_AUTHOR | cut -d ' ' -f 2-)

  FILES_CHANGED=$(git log --author="$AUTHOR" --oneline --shortstat | grep -o "[0-9]\{1,\} files changed" | cut -d ' ' -f 1 | awk '{sum+=$1} END{print sum}')
  INSERTIONS=$(   git log --author="$AUTHOR" --oneline --shortstat | grep -o "[0-9]\{1,\} insertions(+)" | cut -d ' ' -f 1 | awk '{sum+=$1} END{print sum}')
  DELETIONS=$(    git log --author="$AUTHOR" --oneline --shortstat | grep -o "[0-9]\{1,\} deletions(-)"  | cut -d ' ' -f 1 | awk '{sum+=$1} END{print sum}')

  printf "%-14s%s %s\n" "Author Name"   ":" "$AUTHOR"
  printf "%-14s%s %s\n" "Commits"       ":" "$COMMITS"
  printf "%-14s%s %d\n" "Files changed" ":"  $FILES_CHANGED 
  printf "%-14s%s %d\n" "Insertions(+)" ":"  $INSERTIONS
  printf "%-14s%s %d\n" "Deletions (-)" ":"  $DELETIONS
  echo
done

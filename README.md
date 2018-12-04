# `git` author stats

```
###############################################################################
# A simple Bash script that prints out git repository authorship statistics   #
# including (per author):                                                     #
#                                                                             #
# * Number of commits                                                         #
# * Number of files changed                                                   #
# * Number of insertions                                                      #
# * Number of deletions                                                       #
#                                                                             #
# The output is sorted by number of commits.                                  #
# Authors with most commits come first.                                       #
###############################################################################

# Copy the script into the root of your git repository:

cp ./git-author-stats.sh ./path/to/your/git/repo/
cd ./path/to/your/git/repo/

# ... and run it:

./git-author-stats.sh
```

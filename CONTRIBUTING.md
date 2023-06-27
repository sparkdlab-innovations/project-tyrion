# Contributing

When contributing to this repository, please first discuss the change you wish to make via an issue or discussion thread with the maintainers of this repository before submitting a pull request.

Please note we have a code of conduct, please follow it in all your interactions with the project.

## Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a
   build. Add only relevant files to commit and ignore the rest to keep the repo clean.
2. Update the appropriate documentation with details of changes to the application, this includes new environment
   variables, exposed ports, useful file locations and container parameters.
3. To request a review after submitting a pull request, tag any maintainer in the comments section of the pull request.

## Instructions

- Git Workflow

```bash
## Step 1: Fork Repository

## Step 2: Git Set Up & Download
# Clone the repo
$ git clone https://github.com/<User-Name>/<Repo-Name>.git
# Add upstream remote
$ git remote add upstream https://github.com/rutajdash/<Repo-Name>.git
# Fetch and merge with upstream/main
$ git fetch upstream
$ git pull --ff upstream/main

## Step 2: Create and Publish Working Branch
$ git checkout -b <type>/<issue|issue-number>/{<additional-fixes>}
$ git push origin <type>/<issue|issue-number>/{<additional-fixes>}

## Types:
# wip - Work in Progress; long term work; mainstream changes;
# feat - New Feature; future planned; non-mainstream changes;
# fix - Bug Fixes
# exp - Experimental; random experiemntal features;
```

- On Task Ongoing and Completion:

```bash
## Committing and pushing your work
# Ensure branch
$ git branch
# Fetch and merge with upstream/main
$ git fetch upstream
$ git pull --ff upstream/main
# Stage files
$ git add <file-path>
# Commit all changes with an appropriate commit message and description
$ git commit -m "your-commit-message" -m "your-commit-description"
# Push changes to your forked repository
$ git push origin <type>/<issue|issue-number>/{<additional-fixes>}

## Creating the PR using GitHub Website
# Create Pull Request from <type>/<issue|issue-number>/{<additional-fixes>} branch in your forked repository to the main branch in the upstream repository
```

- After PR Merge

```bash
# Delete branch from forked repo
$ git branch -d <type>/<issue|issue-number>/{<additional-fixes>}
$ git push --delete origin <type>/<issue|issue-number>/{<additional-fixes>}
# Fetch and merge with upstream/main
$ git checkout main
$ git pull --ff upstream main
$ git push origin main
```

- Always follow [conventional commits specification](https://www.conventionalcommits.org/en/v1.0.0/)
- About the [fork-and-branch workflow](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/)

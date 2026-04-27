#!/usr/bin/env bash
# List all open PRs assigned to you across repos
gh search prs --assignee=@me --state=open --json title,url,repository \
  --jq '.[] | "[\(.repository.name)] \(.title)
  \(.url)"'

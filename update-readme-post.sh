#!/usr/bin/env bash

filename="_posts/$(date -Idate)-readme.md"

git rm _posts/*-readme.md
{ echo '---
layout: post
title:  How to Work with Us - lab530.github.io 开发手册
author: ivan_chien
categories: [ 开发 ]
tags: [ 开发 ]
ref: https://github.com/lab530/lab530.github.io/blob/main/readme.md
---';
echo "Updated at $(date) by \`update-readme-post.sh\`";
tail -n +2 readme.md; } > $filename

git add $filename
git commit -m "script: update readme in post"

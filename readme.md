English | [简体中文](./readme_CN.md)

# How to Work with Us

## Clone This Repo

```bash
git clone -b develop git@github.com:lab530/lab530.github.io.git
```

If you have cloned `main` , use this instruction to switch branch:

```bash
git checkout -b develop origin/develop
```

**Make sure that you are in `develop` branch.**

**I will use `(branch)` notation to mark current branch.**

**DO NOT operate `main` branch WITHOUT using pull request!**

## Git Basics

### Check local branches / current branch

```bash
git branch
```

### Switch to an existed branch(e.g.: `develop`)

```bash
git checkout develop
```

### Create a new branch(e.g.: `ly-dev`)

```bash
git checkout -b ly-dev
```

### Delete an existed branch

```bash
git branch -d ly-dev
```

### Push & set upstream, use `-u` or `--set-upstream`

```bash
(develop) git push -u origin develop
```

### Merge branch(e.g.: merge `ly-dev` into `develop`)

```bash
(develop) git merge ly-dev
```

## How to Modify This Repo

### 0. Create your own dev branch

```bash
(develop) git checkout -b yescafe-dev
(yescafe-dev) git branch  # check current branch
```

### 1. Sync `develop` branch

```bash
git checkout develop
(develop) git pull origin develop
```

If there are some new commits, merge back to your dev branch.

```bash
(develop) git checkout yescafe-dev
(yescafe-dev) git merge develop
```

### 2. Work on your dev branch

```bash
git checkout yescafe-dev
```

And then edit your codes and posts!

### 3. Make a commit

After you finish your work, add all modified files to cache and commit a message.

```bash
(yescafe-dev) git add -A
(yescafe-dev) git commit -m "A commit message here"
```

This is a basic operation, and this is not the only way. Learn and try it by yourself.

### 4. Deploy & check your modifications

Use Ruby and Jekyll to deploy the website on your local machine, I recommend RVM. If you use Lazarus’s server, you don’t need to setup Ruby and Jekyll environment by yourself, just execute it.

```bash
jekyll s --host 0.0.0.0
```

Then access `127.0.0.1:4000` on your browser, and check your modifications.

### 5. Merge to `develop`

If you think there is no error, switch to `develop` branch, sync with the upstream again, then merge commits.

```bash
(yescafe-dev) git checkout develop
(develop) git pull origin develop
(develop) git merge yescafe-dev
```

### 6. Push to upstream

```bash
(develop) git push origin develop
```

### 7. Next time, redo from 1!

### 8. Create a pull request

If you finished a feature or a job, such as a post, you can consider to create ONE pull request for your entire job.

DO NOT one commit one pull request.

And DO NOT review & merge the pull request by yourself. Codes should be reviewed by other people.

## For Admins: Code Review & Tackle Conflicts

reserved

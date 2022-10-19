English | [简体中文](./readme_CN.md)

# How to Work with Us

## Ruby & Jekyll

We recommend Ruby 2.7.2, if you use other version of Ruby, you need to handle all red alerts by yourself xd. And don't apply the modification of `Gemfile.lock` to git, this may make others can't use their environment.

## Clone This Repo

```bash
git clone git@github.com:lab530/lab530.github.io.git
```

**I will use `(branch)` notation to mark current branch.**

**DO NOT operate `main` branch directly. Please use your own branch and use `merge` to merge commits to `main` branch.**

## Git Basics

### Check local branches / current branch

```bash
git branch
```

### Switch to an existed branch(e.g.: `main`)

```bash
git checkout main
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
(main) git push -u origin main
```

### Merge branch(e.g.: merge `ly-dev` into `main`)

```bash
(main) git merge ly-dev
```

## How to Modify This Repo

### 0. Create your own dev branch

```bash
(main) git checkout -b yescafe-dev
(yescafe-dev) git branch  # check current branch
```

### 1. Sync `main` branch

**This is NECESSARY! DO NOT forget!**

```bash
git checkout main
(main) git pull origin main
```

If there are some new commits, merge back to your dev branch.

```bash
(main) git checkout yescafe-dev
(yescafe-dev) git merge main
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

If you are using the Lazarus's server and not sure of whether you are the only one using jekyll at the meantime, you should use a different specified port instead of the default one(4000), such as 4001, 4002, for example:

```bash
jekyll s --host 0.0.0.0 --port 4001
```

And access `127.0.0.1:4001`.

Tips: `--host 0.0.0.0` is not necessary, this can help you access this local website via your LAN IP address using another device.

### 5. Merge to `main`

If you think there is no error, switch to `main` branch, sync with the upstream again, then merge commits.

**This is also NECESSARY!**

```bash
(yescafe-dev) git checkout main
(main) git pull origin main
(main) git merge yescafe-dev
```

If you don't do pull firstly and merge directly like me, while you are pushing, git may tell you:

![git push reject xd](/assets/readme/SCR-20221014-u5a.png)

If you don't have powerful git skills like me, do not try this.

### 6. Handle with conflicts

Reserved.

Oh, this would be a technique which you should have learned.

### 7. Push to upstream

At the first time, execute:

```bash
(main) git push -u origin main
```

to push and set upstream.

And in the next time, you could just run:

```bash
(main) git push
```

### 8. Next time, redo from 1!


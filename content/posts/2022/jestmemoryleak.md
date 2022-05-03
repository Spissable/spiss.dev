+++
title = "Jest Memory Leaks - Some Lessons Learnt"
date = 2022-05-03
+++

Recently I was facing some memory leaks in the test suits of one of my projects. As I spent a couple of days analyzing the issue and finally fixing it, I wanted to summarize the lessons learnt.

<!-- more -->

### Project Infos
- Nest.JS v8
- Node.JS v14
- ~800 unit tests using Jest


### The Build Up
Every once in a while, the Github Actions pipeline would run out of memory during a test run. This is what it looked like:

```
<--- JS stacktrace --->

FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
```

While it didn't happen consistently, it was still becoming annoying enough. To make matters worse, a Node.JS update to v16 seemed to make the problem unbearable. Time to investigate 🕵🏽‍♂️.

### Node v16
There seems to be a [bug](https://github.com/facebook/jest/issues/11956), introduced with Node v16.11, causing memory leaks with Jest. While this bug is certainly putting my Node 16 update to a halt until it's resolved, the mentioned Github issue also gives quite some insight on how to debug these kinds of issues. Back to Node 14 🔙.

### Early Suspicions
Some early ideas what could be causing the issues were:
- A bad jest/ts-jest/... package update
- [Jest-ts-auto-mock](https://www.npmjs.com/package/jest-ts-auto-mock) as this is messing with the transformer
- The `setupFilesBeforeEnv` which I had added recently

In order to verify any assumptions and changes made, the following command was used to see if any memory was leaking:

`node --expose-gc ./node_modules/.bin/jest --runInBand --logHeapUsage`


### Going Back in Time
In order to see if the problem has been happening for a while, just at a smaller scale, I went back to a commit some months ago and ran the above command. Turns out, back then everything was looking fine!

With that knowledge, I proceded to test whether package updates are responsible for what's happening, but no luck there.

I figured I should try and pin-point to the exact commit where the problem started, but with the normal memory fluctuation it was impossible to spot. To make matters even worse, there seems to be yet a different [memory issue](https://github.com/facebook/jest/issues/12142) when using the `--runInBand` flag.

### detectLeaks Flag to the Rescue
Thankfully there is yet another flag called `--detectLeaks` which will force the garbage collection and fail the test suite if it detects any memory leak.

The updated command: `node --expose-gc ./node_modules/.bin/jest --detectLeaks`

Going back to the same "suspected-memory-leak-free-commit", this command proved exactly that. Jumping around commits "bisection" style, while running the leak detection every time, very quickly gave me the exact commit which turned every test suite red.

### setupFilesAfterEnv + nock
Turns out, the issue was the following jest setup file which I introduced to globally disable any external http requests in tests:
```typescript
// jest.setup.ts
import * as nock from 'nock';

nock.disableNetConnect();
nock.enableNetConnect('127.0.0.1')
```

There is a section in the [nock README](https://github.com/nock/nock#memory-issues-with-jest) which actually describes that exact issue. There is also some more context linked there.

### Key lessons learnt
- RTFM
- Run tests with `--detectLeaks` flag, perhaps even in the CI to detect issues right away, instead of facing 5 different issues at the same time once it all bubbles up.
- Try out newer transformers such as swc/jest or esbuild/jest for new projects.
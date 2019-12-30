# smartJudge API
smartJudge is an online platform where students can practice with introductory programming problems and receive auto generated repair hints when solution is incorrect.

Link to smartJudge IDE: https://github.com/lethehaiau/smartJudgeIDE

## Supported Languages
Python

## Project Organization
smartJudge based on Judge0 API which is a [Rails 5](http://weblog.rubyonrails.org/2016/6/30/Rails-5-0-final/) application organized in two major components:

* [Rails API](https://github.com/rails-api/rails-api)
  * accepts requests and creates background jobs for Worker.
* [Worker](https://github.com/resque/resque)
  * accepts new jobs and process them as they arrive. Worker has only one job - [IsolateJob](https://github.com/ioi/isolate), that job runs untrusted programs in sandboxed environment.
  
## Development Setup
Setting up your development environment is easy thanks to [Docker](https://docs.docker.com/) and [Docker Compose](https://docs.docker.com/compose/). So please install those before continuing.

Because we are running our development environment in Docker you don't need to have Ruby, Rails, PostgreSQL, Redis, etc. installed on your computer. You just need to:
1. Pull [judge0/api](https://hub.docker.com/r/judge0/api/) image (tested with 1.4.0):
    ```
    $ docker pull judge0/api:1.4.0
    ```
2. Copy `judge0-api.conf.default` to `judge0-api.conf`.
3. Run development shell (it will take a while only first time):
    ```
    $ ./scripts/dev-shell
    ```

`scripts/dev-shell` script will open you new **development shell** always in the same container, and if container doesn't exist it will create one for you.

You need to run Rails API and Worker in order to have Judge0 API fully operational:

1. Open new development shell and in there run Rails API server:
    ```
    $ ./scripts/run-server
    ```
2. Open new development shell again and in there run Worker process:
    ```
    $ ./scripts/run-workers
    ```
3. Open http://localhost:3000 in your browser.

This is minimal setup for development environment, now you can open your favorite editor in your host and start developing Judge0 API.

Possible error: if you get error when run rails migrate it may due to failed to load the env config, try `source scripts/load-config`

## About Docker Images
This project has two Dockerfiles:
1. [Dockerfile](https://github.com/lethehaiau/smartJudge/blob/master/Dockerfile)
   * builds `judge0/api:1.4.0` image

2. [Dockerfile.dev](https://github.com/lethehaiau/smartJudge/blob/master/Dockerfile.dev)
   * build `judge0/api:dev` image

`judge0/api:dev` is your local development image built FROM `judge0/api:1.4.0`. It is not pushed to Docker Hub. That is why you first need to pull `judge0/api:1.4.0` before building your development environment.

## Thank to
**Judge0 API** is an web API for code compilation and execution. Complete and detailed API documentation is available
on https://api.judge0.com.

**Clara** CLuster And RepAir tool for introductory programming assignments https://github.com/iradicek/clara

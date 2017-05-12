# bhima-demo
Demo hospital build for the BHIMA HIS. Includes build scripts as well as standardised test build snapshots.

##Latest Production Build 

```./latest```
This folder will hold the latest production build of BHIMA for the hospital 
demo generation to be run against. This repository will be used to drive many 
of the helper classes required to run the demo test.

```bash
> git clone https://github.com/IMA-WorldHealth/bhima-2.x latest
> npm install 
> bower install
> npm run build
```

# Steps to build 
*(Not yet stable - as of 31/01/2017)*

```sh
# 1. build the demo hospitals database, this will the core bhima.sql scripts 
# found in the `/latest` repository and build the example demo hospital
cd /bhima-demo/
./data/build.sh

# 2. make sure that the BHIMA server is running and using the correct environment 
# variables for the server. 
# Currently the demo is configured to access port 7000 and use the database 
# `bhima_production`. This is to avoid collision with development servers that may 
# be running. 

# .env.production 
# PORT=7000
# DB_NAME='bhima_production'

cd /bhima-demo/latest/
npm run app 

# move to scripts to run the demo hospital emulation
cd /bhima-demo/scripts

# 3. run a selenium server - there is a helper script to execute the selenium 
# server found in node modules; this can be configured 
./selenium.sh 

# 4. 'attach' to the current session, this will open a selenium session with the 
# open selenium server. Once the session is attached it will write the session 
# ID to a file called `selenium_config.js`. This will be used by all future scripts. 
# Doing this allows us to only require only one selenium session instead of tearing 
# down and building one per script 
./attachSession.js

# 5. run the demo script - this will begin the demo hospital emulation, attempting 
# connect to a BHIMA server running on port 7000, expecting a clean database build

# ./demo.js

# note to include emulating change over time, the demo must be run as `sudo` to 
# have access to updating the system time, this should only be done in a secure 
# non-production environement (ideally a demo sandbox) 
sudo ./demo.js

```

[![Build Status](https://travis-ci.org/carrickr/testingDemo.svg?branch=master)](https://travis-ci.org/carrickr/testingDemo) [![Coverage Status](https://coveralls.io/repos/github/carrickr/testingDemo/badge.svg?branch=master)](https://coveralls.io/github/carrickr/testingDemo?branch=master)

# testingDemo

Testing Demo is the Rails demo project for the 2016 Statewide IT 'Continuous Integration Tools: A hands-on approach' session.

# Session Structure

The hope is to have 60 minutes or less of power point slides and standing in front of the room talking at people.  The rest of the session can be spent trying out the tools and writing tests either as one large group or in multiple groups.  To that end while not required, coming with a dev environment will let you do it yourself rather than watch others do it on a screen.  Instructions on the accounts you need and how to set up the dev environment are posted below.  


# Stuff To Do Before the Session

I highly recommend you get your dev environment setup before the session.  Currently 64 people are enrolled and 64 laptops simultaneously trying to pull down a VM over IUWireless probably does not end well.  

## GitHub Account

To log into TravisCI and Coveralls.io and to push changes you make up to Github for public consumption you will need a Github account.  Without a Github account you will limited to only being able to read the code in the Github repository.  You can signup for Github [here](https://github.com/join) or via the big green `Sign Up` button on the upper right of this page.

If you setup a Github account contact me before the Statewide session so I can authorize you to write to this Github repository during the session.

## Getting A Working Rails Project

You have two options.  You can either install the project directly onto your machine (not recommended for Windows users) or download the VM.  If you're not sure which path is the best for you, I suggest the VM.  

### Installing the VM

#### VM Info
* OS: Ubuntu 16.04 LTS
* Username: statewide
* Password: statewide

Note: Beside having the username and password of admin account posted here, this machine has default or password for most other services.  So if you give a public IP it will be mining Bitcoins for someone within minutes.  

Also Note: Virtual Machines often kill battery, bring a power adapter!

1.  [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1.  Download the [virtual appliance here](https://iu.app.box.com/s/u2ix58gzevxjk5h3mh68004qnqb4a5xx).
1.  Import the appliance.  
  *  You can import by opening VirtualBox and selected `File > Import Appliance` to launch the import wizard.
  *  On the `Appliance Settings` Page during the import:
    *  If you only have a dual core laptop assign the machine one core.  Otherwise assign it at least two cores (two to four cores is ideal, depending on your many your laptop has).
    * Uncheck the USB Controller box.
  *  [More extensive documentation here](https://docs.oracle.com/cd/E26217_01/E26796/html/qs-import-vm.html)
1.  With the appliance off tweak its system settings:
  1. Right click on the appliance and select `Settings`.
  1. Select `Network` and ensure the `Attached To` field is set to `NAT`.  It should be by default.
1. Start the Statewide2016 appliance by double clicking on it.  The appliance should startup and autologin to the statewide account.
  *  If you get Node Error it probably means you didn't uncheck the USB Controller when you were importing the appliance.  Go back to `Settings` and disable the USB Controller.
1.  In the appliance click on the terminal icon in the left hand bar.
1. Execute the following commands:
  1. `cd testingDemo`
  1. `git pull`
  1. `bundle install`
  1. `bundle exec rspec`
1. After the rspec tests run you should see something along the lines of: `Finished in 5.24 seconds (files took 3.23 seconds to load) 5 examples, 0 failures, 1 pending`.  The values will change as I add more tests prior to the session, however there should always be zero failures should be zero.  If there are failures something has gone wrong.
1.  If you have a Github Account:
  1. If you are currently in the testingDemo folder (from the previous steps) go up a level via `cd ..`  
  1. Run `mv testingDemo testingDemoReadOnly`
  1. Configure Git via:
    1. `git config --global user.name "YOUR NAME"`
    1. `git config --global user.email "YOUR EMAIL ADDRESS"`
    1.  See [here](https://help.github.com/articles/set-up-git/) for more documentation
    1. Configure your [SSH Keys so you can clone from git](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/).  If you currently don't have a public key you will need to [generate a new key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/).
  1. Run `git clone git@github.com:carrickr/testingDemo.git`.  Github should ask you for your password.
  1. Run `cd testingDemo`
  1. Run `bundle install`
  1. Run `bundle exec rake db:migrate`
  1. Run `bundle exec rspec`
  1. You should see the tests run again with zero failures.  If this or a previous step failed you can still use the testingDemoReadOnly folder you created but you won't be able to push to github.  
1.  You're all set, just shut the machine down and celebrate!

### Installing the Project Directly

1. If you don't have a github setup on your machine, [configure it](https://help.github.com/articles/set-up-git/).
1. Configure your [SSH Keys so you can clone from git](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/).  If you currently don't have a public key you will need to [generate a new key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/).
1. Open up terminal type `ruby -v`
  1.  If you have 2.2.0 or greater skip ahead to the next step.  If the version reported is less than 2.2.0 you need to upgrade your Ruby.  The easiest way to do this is via RVM.
  1.  [Install rvm](https://rvm.io/rvm/install):
    1.  Run `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`
    1.  Run `\curl -sSL https://get.rvm.io | bash -s stable`
    1.  Check the output for any references needing to add rvm to your path via a source command and perform them if needed.
  1. Install Ruby 2.3.1 by running `rvm install 2.3.1`
  1. Set 2.3.1 as you default by running `rvm --default use 2.3.1`
1. Navigate to the directory you want to put this project in.
1. Run `git clone git@github.com:carrickr/testingDemo.git` and then `cd testingDemo`
1. Run `bundle install` and `bundle exec rake db:migrate`.  If you don't have certain dependencies on your machine the bundle install may fail and you'll need to install them.  Common dependencies missing are libxml2, libxslt, nodejs, and build-essentials (on Ubuntu).
1. Run `bundle exec rspec`.  The tests should run with no failures.
1. You can start a development console and interact with the app via `bundle exec rails c` or start a development version of the app via `bundle exec rails s`.

# Working With GitHub

Github will allow us to share code but it can also create conflicts.  Specifically if you simply go into the testingDemo project and start changing files github will associate with these with your local master branch.  So when if someone in the session posts a change you want to the master branch and you run `git pull` to download those changes a file version conflict may occur.  So you want to contain your work in a branch.  To do this navigate to your testingDemo project and do the following:

1.  `git branch BRANCHNAME`
1.  `git checkout BRANCHAME`

This creates a new local branch called BRANCHNAME and then moves you to it.  The branch is based off whatever branch you currently have checked out at the time of running the git branch command.  

Now you can do whatever you want, but before checking out another branch you need to save your changes to this branch.  Any unsaved changes will be carried over to whatever branch you checkout and this can lead to conflicts.  To save files do:

1.  Run `git status` and look for files marked modified.
1.  Add those files in via `git add FILE` (ex: `git add Gemfile` or `git add spec/lib/iucat_spec.rb`)
1.  Once all your files are added run `git commit -m COMMIT MESSAGE`
1.  Run `git status` again.  You should no modified files.  Ignore an untracked files as they are not relevant.  

With that complete it is now safe to switch to another branch.  To catch back up with the public master:

1.  Run `git checkout master` and `git pull`
1.  To switch to a new branch that is posted on github run `git fetch` and `git checkout BRANCHNAME`

The final thing is pushing your work to github.  During the session please limit how often you do this, as we are using a free account on TravisCI that can only do two builds at a time and it builds whenever anyone pushes to github.  So 64 people pushing creates quite the backlog.  To push first add and commit your work (see above) and then:

1.  If the branch you are on has never been pushed to github before run `git push -u origin BRANCHNAME`
1.  If the branch been committed before you can run `git push`
1.  If you want to push to backup your work or share it with another person in the class, but don't want to clog up Travis you can add `[ci skip]` to your commit message.  For example this workflow would not trigger a Tavis build:
  1. `git add Gemfile`
  1. `git commit 'Adding in the rubocop gem [ci skip]'`
  1. `git push`

# Session Slides and Other Useful stuff

In progress, watch this space.

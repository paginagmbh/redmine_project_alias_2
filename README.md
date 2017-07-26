Redmine Project Alias 2
=======================

This plugin lets you create aliases for project identifiers and also lets you use the aliases as main identifier (means: renaming a project identifier and having the old identifier as alias).

This is a git fork of Andriy Lesyuk's [project_alias](http://projects.andriylesyuk.com/projects/project-alias) plugin which seems to be abandoned for a few years now.

*This plugin is listed in the [Redmine plugin directory](http://www.redmine.org/plugins/redmine_project_alias_2)*


Compatibility
-------------

The plugin is tested with Redmine 2.6.x, 3.0 - 3.4.

For older version (2.5.x, 2.3.x, 2.2.x, 1.4.x) please download the [original plugin](http://www.redmine.org/plugins/project_alias2).


Installation and setup
----------------------

* Clone or [download](https://github.com/paginagmbh/redmine_project-alias-2/releases) this repo into your **redmine_root/plugins/** folder
```
$ git clone https://github.com/paginagmbh/redmine_project_alias_2.git
```
* If you downloaded a tarball / zip from master branch, make sure you rename the extracted folder to `redmine_project_alias_2`
* You have to run the plugin rake task to provide the assets (from the Redmine root directory):
```
$ rake redmine:plugins:migrate RAILS_ENV=production
```
* Restart Redmine

Uninstall
---------

If you want to uninstall and remove the plugin, do the following:


* Run this rake task from the Redmine root directory:
```
$ bundle exec rake redmine:plugins NAME=redmine_project_alias_2 VERSION=0 RAILS_ENV=production
```

* Delete the plugin folder

* Restart Redmine

**Be aware that you're loosing aliases and link redirections when uninstalling the plugin!**


License
-------

*redmine_project-alias-2* plugin is developed under its original [GPL License](LICENCE).

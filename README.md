jdmash
======

facemash like web app for Japan diet members' website

## require

* sqlite3 or Postgres9.x
* bundler
* Rails4


## setup

```
git clone git@github.com:miminashi/jdmash.git
cd jdmash
bundle install --path vendor/bundle
rake db:migrate
```


## import from JapanDietDB API

```
rails c
irb(main):001:0> Member.import_from_api('https://japandietdb.net/members/member_all.json')
```


## random search

```
rails c
irb(main):005:0> Member.random(2).map{|m| m.name}
  Member Load (1.6ms)  SELECT  "members".* FROM "members"  WHERE (url is not null)  ORDER BY random() LIMIT 2
=> ["高階恵美子", "萩生田光一"]
irb(main):006:0> Member.random(2).map{|m| m.name}
  Member Load (3.5ms)  SELECT  "members".* FROM "members"  WHERE (url is not null)  ORDER BY random() LIMIT 2
=> ["松田学", "坂井学"]
irb(main):007:0> Member.random(2).map{|m| m.name}
  Member Load (2.9ms)  SELECT  "members".* FROM "members"  WHERE (url is not null)  ORDER BY random() LIMIT 2
=> ["船田元", "牧山ひろえ"]
```


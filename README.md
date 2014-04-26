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


## elo rating

```
irb(main):043:0* a, b = Member.random(2)
  Member Load (35.0ms)  SELECT  "members".* FROM "members"  WHERE (url is not null)  ORDER BY random() LIMIT 2
=> #<ActiveRecord::Relation [#<Member id: 514, first_name: "正行", family_name: "直嶋", url: "http://www.naoshima.com/", created_at: "2014-04-26 10:15:57", updated_at: "2014-04-26 10:15:57", rating: 1000>, #<Member id: 16, first_name: "孝", family_name: "江崎", url: "http://esakitakashi.net/", created_at: "2014-04-26 10:15:55", updated_at: "2014-04-26 10:15:55", rating: 1000>]>
irb(main):044:0> a.rating
=> 1000
irb(main):045:0> b.rating
=> 1000
irb(main):046:0> Member.fight(:winner => a, :loser => b)
   (7.3ms)  begin transaction
  SQL (6.0ms)  UPDATE "members" SET "rating" = ?, "updated_at" = ? WHERE "members"."id" = 514  [["rating", 1012], ["updated_at", "2014-04-26 11:17:26.570204"]]
   (1.6ms)  commit transaction
   (1.1ms)  begin transaction
  SQL (4.2ms)  UPDATE "members" SET "rating" = ?, "updated_at" = ? WHERE "members"."id" = 16  [["rating", 987], ["updated_at", "2014-04-26 11:17:26.642778"]]
   (1.5ms)  commit transaction
=> true
irb(main):047:0> a.rating
=> 1012
irb(main):048:0> b.rating
=> 987
```

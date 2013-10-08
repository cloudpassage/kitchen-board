# kitchen-board (halo api console)

(WARNING : Sharp Tools May Cut: Use at your own risk.)

Author: *Alfonso Adriasola* - *aadriasola@gmail.com*

Ruby console with a CloudPassage api session going


##Requirements and Dependencies
Run bundle install, it should install:
* json
* rest-client
* oauth2
* awesome_print

##Installation 

Clone, download, or fork the git repo, then configure as below.


###Configuration

You need to provide three ENV variables for your account, with the user specific api credentials
available to you via the  CloudPassage admin view.

These can be set in various ways, via .bashrc , via inline , etc. 
```
export HALO_KEY_ID = 'xxxxx'
export HALO_SECRET_KEY  = 'xxxxxxxxxxxx'
export HALO_HOST = 'api.cloudpassage.com'
```

Launch locally as :

`./halo_console.rb`

If all is set up correctly you will see the following prompt


```
CloudPassage API Ruby Command Line Interface
********************************************
 Now you can call cp.get and so on 
#<CpSession:<object hash>

2.0.0p195 :001 >
```


##Usage

Running `halo_console.rb` will create a `cp` object with the API session token embedded.
A command prompt appears so you can fire requests.
The responses are shown by default in their raw json format, it can be modified with `pretty` method for formatted json.
Use `to_hash` to get the response into a Ruby hash format.


###*Example Commands*

```ruby
cp.get(:fim_policies)

cp.get(:groups).to_hash

puts cp.get("fim_policies/{id}").pretty

```

For PUT and POST actions, parameters can be supplied as JSON,
this will be handled by RestClient and submitted the right way

```ruby
cp.put "group/{id}", {group:{name:"load balancers"}
```
Given a correctly formatted json file of a file integrity policy "file.json" you could execute

```ruby
my_json_policy = File.read("file.json")

cp.post "fim_policies", my_json_policy
```

###*Output*

A response object that is by default showing the json version, but can be made into a Ruby Hash by the .to_hash method


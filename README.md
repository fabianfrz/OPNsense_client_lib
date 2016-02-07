# OPNsense client library

This is an implementation of a library which allows you to communicate
with your OPNsense appliance.

How can this library be used?
-----------------------------

``` ruby
require_relative 'relative/path/to/this/library/requireall'

# OPNsense requires credentials
cred = OPNsense::APICredentials.new(api_key, api_secret, api_url, certificate)

# now you can create a request object
OPNsense::Request.new(cred)

# everything is ready - you can access the api now
OPNsense::FirmwareUpdate.upgrade!

```


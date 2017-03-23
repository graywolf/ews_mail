EWS::Mail
=========

Very simple gem to send mail via Exchange Web Service.

```ruby
require 'ews_mail'
EWS::Mail.send(
	username: '<USERNAME>',
	password: '<PASSWORD>',
	rcpts: '<RECIPIENT>',
	subject: '<SUBJECT>',
	body: '<PLAINTEXT-BODY>'
)
EWS::Mail.send(
	username: '<USERNAME>',
	password: '<PASSWORD>',
	rcpts: ['<RECIPIENT1>', '<RECIPIENT2>'],
	subject: '<SUBJECT>',
	body: '<PLAINTEXT-BODY>'
)
```

This gem is most suited for backend stuff, if you need to send mail via
office365 from application with some kind of frontend, you are better off
using outlook REST API. That's because oAuth2 is kinda painful to do from
something running as deamon on a server.

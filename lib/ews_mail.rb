require 'savon'

# Exchange Web Services namespace
module EWS
# Mail module
module Mail

	# URL of EWS WSDL
	WSDL = 'https://outlook.office365.com/EWS/Services.wsdl'
	# Endpoint against which we want to run requests
	ENDPOINT = 'https://outlook.office365.com/EWS/Exchange.asmx'
	# Namespaces to add to the request
	NAMESPACES = {
		'xmlns:t' =>
			'http://schemas.microsoft.com/exchange/services/2006/types'
	}

	# Send mail via EWS.
	#
	# Senders is determined automatically by EWS based on your
	# username.
	#
	# =Example
	#
	# EWS::Mail.send(
	# 	username: '<USERNAME>',
	# 	password: '<PASSWORD>',
	# 	rcpts: '<RECIPIENT>',
	# 	subject: '<SUBJECT>',
	# 	body: '<PLAINTEXT-BODY>'
	# )
	# EWS::Mail.send(
	# 	username: '<USERNAME>',
	# 	password: '<PASSWORD>',
	# 	rcpts: ['<RECIPIENT1>', '<RECIPIENT2>'],
	# 	subject: '<SUBJECT>',
	# 	body: '<PLAINTEXT-BODY>'
	# )
	def self.send(username:, password:, rcpts:, subject:, body:)
		c = Savon.client({
			wsdl: WSDL,
			endpoint: ENDPOINT,
			basic_auth: [username, password],
			namespaces: NAMESPACES,
		})

		message = {
			'tns:Items' => {
				't:Message' => {
					't:Subject' => subject,
					't:Body' => body,
					't:ToRecipients' => {
						't:Mailbox' => [*rcpts].map do |v|
							{ 't:EmailAddress' => v }
						end
					},
					attributes!: {
						't:Body' => { 'BodyType' => 'Text' }
					}
				}
			},
		}
		attributes = { 'MessageDisposition' => 'Send' }

		c.call(:create_item, message: message, attributes: attributes)
	end

end
end

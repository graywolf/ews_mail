require 'savon'

module EWS
module Mail

	VERSION = '1.0.1'

	WSDL = 'https://outlook.office365.com/EWS/Services.wsdl'
	ENDPOINT = 'https://outlook.office365.com/EWS/Exchange.asmx'
	NAMESPACES = {
		'xmlns:t' =>
			'http://schemas.microsoft.com/exchange/services/2006/types'
	}

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

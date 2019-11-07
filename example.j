'use strict'

const Express = require('express')
const Request = require('request-promise')

const StartServer = async () => {
	let userAgentURI = 'https://raw.githubusercontent.com/rypx/offline-browser-user-agent/master/useragent.txt'
	let userAgent = (await Request.get(userAgentURI)).toString().trim().split('/n')
	
	let RobotsConfig = {
		UserAgent: userAgent,
		Disallow: '/'
	}
	
	Express()
		.use(require('express-robots-txt')(RobotsConfig))
		.get('/', (req, res) => {
			res.send('Hello, World!')
		})
		.listen(3000, () => console.log('Server is Online'))
}

StartServer()

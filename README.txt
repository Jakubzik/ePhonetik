# Node ePhonetik App

TODO:

... Korrektur vorhandener Tests

... Manifest für WebApp/Smartphone
... ... Versionsmanagement: Download nur bei neuer Versionsmanagement

... Lifecycle von Lektionen, Fragen, Antworten im Backend
... ... Tests zum Lifecycle
... ... Oberfläche zum Lifecycle


Code-Struktur:

Backend
========
app/
    ... routes.js
	[.getLektionen(res)]
	.get(/api/lektion)         -->       Lektionen-JSON via /models/lektionen.getLektionen()
	.post()	   TODO
	.delete()	   TODO
	.get(*)	                 -->	   index.html

	      
  .../models/
	  ... lektion.js
	      .load()		--> 	postgres objektrelationaler Mapper
.
Frontend
========
public/js
    ...core.js
	Konnektor zw. Controller und Service
	
    ... /controllers/
	... main.js
	    Lektion.get()	--> Beim Laden Lektionen vom Server

    ... /services/
	... ePhonetikFragen.js
	    .factory
	    
	    
## Requirements

- [Node and npm](http://nodejs.org)

## Installation

1. Clone the repository: `git clone git@github.com:scotch-io/node-todo`
2. Install the application: `npm install`
3. Start the server: `node server.js`
4. View in browser at `http://localhost:8080`

## Tutorial Series

This repo corresponds to the Node Todo Tutorial Series on [scotch.io](http://scotch.io)

Each branch represents a certain tutorial.
- tut1-starter: [Creating a Single Page Todo App with Node and Angular](http://scotch.io/tutorials/javascript/creating-a-single-page-todo-app-with-node-and-angular)
- tut2-services: Coming Soon
- tut3-auth: Coming Soon
- tut4-sockets: Coming Soon
- tut5-redis: Coming Soon
- tut6-organization: Coming Soon

Happy Todo-ing!

![Todo-aholic](http://i.imgur.com/ikyqgrn.png)

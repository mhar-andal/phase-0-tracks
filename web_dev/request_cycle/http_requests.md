HTTP Status Codes

What are Common HTTP Request status codes?

HTTP Status Code - 200 OK
The request has succeeded. The information returned with the response is dependent on the method used in the request.
  - Seems like this the code you get when everything loads successfully

HTTP Status Code - 300 Multiple Choices
The requested resource has different choices and cannot be resolved into one. For example, there may be several index.html pages depending on which language is wanted (such as Dutch).
  - The resource requested has different choices and cannot choose one.

HTTP Status Code - 301 Moved Permanently
The requested resource has been assigned a new permanent URI and any future references to this resource.
  - The requested resource has been Moved

HTTP Status Code - 403 Forbidden
The server understood the request, but is refusing to fulfill it. Authorization will not help and the request SHOULD NOT be repeated.
  - Server refuses the request because it does not have Authorization

What are the differences between a GET and POST request? When might each be used?
A GET request will request data from a specified resource
  - GET request can be cached
  - GET requests remain in the browser history
  - GET requests can be bookmarked
  - GET requests have length restrictions

  A GET request might be used when clicking a link. That link will send GET requests to a resource for desired files.

A POST request will submit data to be processed to a specified resource
  - POST request can never be cached
  - POST request do not remain in the browser history
  - POST requests cannot be bookmarked
  - POST requests have no restrictions on data length

  A POST request might be used when filling out forms in HTML. It might send a post request when the client submits a form to the server.

HTTP COOKIES

An HTTP cookie is a small piece of data that a server sends to the user's web browser, that may store it together and the next request to the same server.  
Typically it is used to know if two requests came from the same browser allowing to keep a user logged in.

3 things cookies are mainly used for:
  - Session management(user logins, shopping carts)
  - Personalization(user preferences)
  - Tracking(analyzing user behavior)

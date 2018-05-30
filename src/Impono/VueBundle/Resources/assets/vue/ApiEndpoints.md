API documentation body format:   request format:   api key:
  Save  Clear
/api/containers
GET  /api/containers.{_format} Get list of containers
DocumentationSandbox
Requirements
Name	Requirement	Type	Description
_format	json|html
Filters
Name	Information
offset
Requirement	\d+
Description	Offset for containers list pagination
Default	0
limit
Requirement	\d+
Description	Limit for containers list pagination
Default	10
name
Requirement
Description	Container name search criteria
Status Codes
Status Code	Description
200
Returned when successful
401
Returned when the user is not authorized
403
Returned when the user does not have access
POST  /api/containers.{_format} Add new container
/api/containers/{id}
DELETE  /api/containers/{id}.{_format} Remove container
GET  /api/containers/{id}.{_format} Get container
PUT  /api/containers/{id}.{_format} Update container
GET  /api/containers/{id}/available-variables.{_format} Get container available variables
GET  /api/containers/{id}/tags.{_format} Get container tags
POST  /api/containers/{id}/tags.{_format} Add new tag to container
GET  /api/containers/{id}/triggers.{_format} Get container triggers
POST  /api/containers/{id}/triggers.{_format} Add new trigger to container
GET  /api/containers/{id}/variables.{_format} Get container variables
POST  /api/containers/{id}/variables.{_format} Add new variable to container
POST  /api/containers/{id}/version-publish.{_format} Publish container
GET  /api/containers/{id}/version-published.{_format} Get latest publish version of container
POST  /api/containers/{id}/version-restore.{_format} Restore container
GET  /api/containers/{id}/websites.{_format} Get container websites
PUT  /api/containers/{id}/websites.{_format} Update website assigned to container
/api/oauth/v2/token
POST /api/oauth/v2/token.{_format} Log in to application and get token
/api/tags/{id}
DELETE  /api/tags/{id}.{_format} Delete tag
GET  /api/tags/{id}.{_format} Get tag
PUT  /api/tags/{id}.{_format} Update tag
/api/triggers/{id}
DELETE  /api/triggers/{id}.{_format} Remove trigger
GET  /api/triggers/{id}.{_format} Get trigger
PUT  /api/triggers/{id}.{_format} Update trigger
/api/variables/{id}
DELETE  /api/variables/{id}.{_format} Remove variable
GET  /api/variables/{id}.{_format} Get variable
PUT  /api/variables/{id}.{_format} Update variable
Documentation auto-generated on Mon, 20 Nov 17 18:00:09 +0000
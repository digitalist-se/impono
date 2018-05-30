import axios from 'axios'
export default axios.create({
  baseURL: 'https://will-kill-soon-promise.jls-sto2.elastx.net/api/containers.json',
  timeout: 5000,
  headers: {
    'Authorization': 'Bearer YzIyMjNkOTEwNjY0YmZkMGNhODA4MWU1ZWJjYWVjODQ4NDQ1ODZmMDEwYzM0ZmUwM2FkYjc0MGY4MzY2NjgwYw',
    'Content-Type': 'application/json'
  }
})

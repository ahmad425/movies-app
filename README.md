# Movies APP

BASE_URL = 'http://localhost:3000'

Admin Panel
```
{BASE_URL}/admin
```

## Movies APP API:
* Verify User
```
POST: {BASE_URL}/api/users
Params: { user: { username: 'user_name' } }
```

* User favourite movies
```
GET: {BASE_URL}/api/users/:id/favourite_movies
```

* Get all movies
```
GET: {BASE_URL}/api/movies
```

* Get Specific movie
```
GET: {BASE_URL}/api/movies/:id
```

* Make specific movie favourite for user
```
POST: {BASE_URL}/api/movies/:id/make_favourite
params: { user_id: 'USER_ID' }
```

# The codebase includes the following sections

+ Design API endpoints.
+ Create a folder for your code.
+ Create the data.
+ Write a handler to return all items.
+ Write a handler to add a new item.
+ Write a handler to update an item.
+ Write a handler to delete an item.
+ Write a handler to return a specific item.

## Writing a RESTful web service API with Go and the Gin Web Framework with two endpoints

__/albums__

_GET_ – Get a list of all albums, returned as JSON.
_POST_ – Add a new album from request data sent as JSON.

__/albums/:id__

_GET_ – Get an album by its ID, returning the album data as JSON. 

### From a different command line window, use __curl__ to make a request to your running web service

```
$ curl http://localhost:5000/albums \
    --include \
    --header "Content-Type: application/json" \
    --request "POST" \
    --data '{"id": "4","title": "Master of Puppets","artist": "Metallica","price": 69.99}'
```

### From a different command line window, use __curl__ to make a patch request to your running web service

```
$ curl http://localhost:5000/albums/4 \
    --include \
    --header "Content-Type: application/json" \
    --request "PATCH" \
    --data '{"id": "4","title": "Master of Puppets","artist": "Metallica","price": 99.99}'
``
```

### From a different command line window, use __curl__ to make a delete request to your running web service

```
$ curl http://localhost:5000/albums/4 \
    --include \
    --header "Content-Type: application/json" \
    --request "DELETE"
```

### Use __curl__ to retrieve the full list of albums, which you can use to confirm that the new album was added

```
$ curl http://localhost:5000/albums \
    --header "Content-Type: application/json" \
    --request "GET"
```



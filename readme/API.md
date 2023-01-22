## API Reference

### User

All routes for the User actions

#### Register User

Call this route with the required params to create a user

```http
  POST /api/users
```

| Parameter  | Type     | Description                    |
| :--------- | :------- | :----------------------------- |
| `Username` | `string` | **Required**. Username of user |
| `Email`    | `string` | **Required**. Email of user    |
| `Password` | `string` | **Required**. Password of user |

#### Get user

Call this route with the user ID and the Bearer token, and it will returns the user.

```http
  GET /api/users/${id}
```

| Parameter      | Type     | Description                               |
| :------------- | :------- | :---------------------------------------- |
| `id`           | `string` | **Required**. ID of the user              |
| `Bearer token` | `string` | **Required**. Token of authenticated user |

#### Update user

Call this route with the parameters you want to update and the Bearer Token to update a user

```https
  GET /api/users/${id}
```

| Parameter      | Type     | Description                                                                          |
| :------------- | :------- | :----------------------------------------------------------------------------------- |
| `Bearer token` | `string` | **Required**. Token of authenticated user (Needs to be the same of the updated user) |
| `Username`     | `string` | **Not Required**. Username to update                                                 |
| `Email`        | `string` | **Not Required**. Email to update                                                    |
| `Password`     | `string` | **Not Required**. Password to update                                                 |

#### Delete user

Call this route with the user ID and a Bearer Token to delete a user

```https
DELETE /api/users/${id}
```

| Parameter      | Type     | Description                               |
| :------------- | :------- | :---------------------------------------- |
| `id`           | `string` | **Required**. ID of the user              |
| `Bearer token` | `string` | **Required**. Token of authenticated user |

### Posts

All routes for the Post actions

#### Register Post

Call this route with the required parameters and the Bearer token to create a Post

```http
  POST /api/posts
```

| Parameter      | Type     | Description                                         |
| :------------- | :------- | :-------------------------------------------------- |
| `Title`        | `string` | **Required**. Title of the question                 |
| `Content`      | `string` | **Required**. Content of the question               |
| `User ID`      | `string` | **Required**. Id of the user is adding the question |
| `Bearer token` | `string` | **Required**. Token of authenticated user           |

#### Get Post

Call this route with the Post ID and the Bearer token to show the post you want

```http
  GET /api/posts/${id}
```

| Parameter      | Type     | Description                               |
| :------------- | :------- | :---------------------------------------- |
| `id`           | `string` | **Required**. ID of the question          |
| `Bearer token` | `string` | **Required**. Token of authenticated user |

#### Get Posts

Call this route with a Bearer token to show all posts

```http
  GET /api/posts
```

| Parameter      | Type     | Description                               |
| :------------- | :------- | :---------------------------------------- |
| `Bearer token` | `string` | **Required**. Token of authenticated user |

#### Update post

Call this route with the params you want to update and the Bearer token to update a post

```https
  GET /api/posts/${id}
```

| Parameter      | Type     | Description                                                                          |
| :------------- | :------- | :----------------------------------------------------------------------------------- |
| `Bearer token` | `string` | **Required**. Token of authenticated user (Needs to be the same of the updated user) |
| `Content`      | `string` | **Not Required**. Content to update                                                  |
| `Title`        | `string` | **Required**. Title to update                                                        |

#### Delete post

Call this route with a Post ID and a Bearer token to delete a post

```https
  DELETE /api/posts/${id}
```

| Parameter      | Type     | Description                                |
| :------------- | :------- | :----------------------------------------- |
| `id`           | `string` | **Required**. ID of the question to delete |
| `Bearer token` | `string` | **Required**. Token of authenticated user  |

### Comments

All routes for Commentary actions

#### Register commentary

Call this route with the required params and the Bearer token to create a commentary

```http
  POST /api/comments
```

| Parameter      | Type     | Description                                          |
| :------------- | :------- | :--------------------------------------------------- |
| `Content`      | `string` | **Required**. Content of the question                |
| `User ID`      | `string` | **Required**. Id of the user is adding the answer    |
| `Post ID`      | `string` | **Required**. Id of the post that is being answered` |
| `Bearer token` | `string` | **Required**. Token of authenticated user            |

#### Get commentary

Call this route with the Commentary ID and the Bearer token to show the Commentary

```http
  GET /api/comments/${id}
```

| Parameter      | Type     | Description                               |
| :------------- | :------- | :---------------------------------------- |
| `id`           | `string` | **Required**. ID of the commentary        |
| `Bearer token` | `string` | **Required**. Token of authenticated user |

#### Update commentary

Call this route with the parameters you want to update and the Bearer token to update a commentary

```https
  POST /api/comments/${id}
```

| Parameter      | Type     | Description                                                                          |
| :------------- | :------- | :----------------------------------------------------------------------------------- |
| `Bearer token` | `string` | **Required**. Token of authenticated user (Needs to be the same of the updated user) |
| `Content`      | `string` | **Not Required**. Content to update                                                  |

#### Delete commentary

Call this route with a Commentary ID and the Bearer token to delete a commentary

```https
  DELETE /api/comments/${id}
```

| Parameter      | Type     | Description                                  |
| :------------- | :------- | :------------------------------------------- |
| `id`           | `string` | **Required**. ID of the commentary to delete |
| `Bearer token` | `string` | **Required**. Token of authenticated user    |

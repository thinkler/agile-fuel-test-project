[![Build Status](https://semaphoreci.com/api/v1/thinkler/agile-fuel-test-project/branches/master/shields_badge.svg)](https://semaphoreci.com/thinkler/agile-fuel-test-project)

## Overivew

Heroku server:
https://rewards-list.herokuapp.com/users/sign_in

Default user credentials:

email: admin@admin.com
password: foopass

## Main features

* Sign in, sign out, sign up, change password for users
* Paginated list of rewards for authenticated
* Filter by status
* Order by status, id

## Api features

Follow https://rewards-list.herokuapp.com/docs to check api documentation

* Sign in, sign out, sign up, change password for users
* Friendly filter, order by params
* Paginated, serialized rewards response with meta

## Api authentication

After sign in, you get authentication headers. You should pass them where it necessary. \
Short headers description (based on devise_token_auth documentation):
```
uid: A unique value that is used to identify the user (equal to user email)
expiry: The date at which the current session will expire
token-type: Shoul be 'Bearer'
access-token: This serves as the user's password for each request
client: This enables the use of multiple simultaneous sessions on different clients
```

## Api requests example

### Rewards

  Endpoint: https://rewards-list.herokuapp.com/api/v1/rewards \
  Method: GET \
  Headers: Require authentication headers \
  Params:
  ```
  {
    'status': 'approved',
    'order': '-id'
  }
  ```

### Sign in

Endpoint: https://rewards-list.herokuapp.com/api/v1/auth/sign_in \
Method: POST \
Params:
```
{
  'email': 'some@mail.com',
  'password': 'somepass'
}
```

### Sign up

Endpoint: https://rewards-list.herokuapp.com/api/v1/auth/ \
Method: POST \
Params:
```
{
  'email': 'some@mail.com',
  'password': 'somepass'
}
```

### Sign out

Endpoint: https://rewards-list.herokuapp.com/api/v1/auth/sign_out \
Method: DELETE \
Headers: Require authentication headers

### Change password

Endpoint: https://rewards-list.herokuapp.com/api/v1/auth/api/v1/auth \
Method: PUT \
Headers: Require authentication headers \
Params:
```
{
  'email': 'some@mail.com',
  'current_password', 'oldpass',
  'password': 'newpass'
}
```

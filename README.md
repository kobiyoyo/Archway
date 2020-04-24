<br />
<p align="center">
  <h1 align="center">Social Media Clone</h1>

  <p align="center">
    A Ruby on Rails application
    <br />
    <br />
    <a href="https://powerful-escarpment-41375.herokuapp.com/login">View Demo</a>
    ·
    <a href="https://github.com/kobiyoyo/FACEBOOK-CLONE/issues">Report Bug</a>
    ·
    <a href="https://github.com/kobiyoyo/FACEBOOK-CLONE/issues">Request Feature</a>
  </p>
  <img src="app/assets/images/screenshot.png" alt="facebook-project">
</p>



## Description
The Social media-clone project is an implementation of Facebook using Ruby on Rails. The technical goals of the project are to emulate some functionalities that Facebook has implemented, such as allowing the users to have friends in a symmetrical irreflexive way, accept & send friend requests, submit posts and see the posts of their friends and comment on the posts of their friends.

The project is part of a series of projects to be completed by students of [Microverse](https://www.microverse.org/ "The Global School for Remote Software Developers!").


## Built With
- Ruby 
- Ruby on Rails
- Bulma
- Bullet
- Rubocop
- PostgreSQL

## Features
- A user can signup/login
- A user can add post.
- A user can add comments to posts.
- Sending friend requests.
- Accepting friend requests.
- Edit setting and profile information.



## Future features
* Ability to login with Facebook.
* Logout after 5 minutes of inactivity


## Environment
- Ruby on Rails version 6.0
- [Bootstrap-sass](https://www.rubydoc.info/gems/bootstrap-sass/3.3.6) is a Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications version 3.3.7
- Puma: A Ruby Web Server Built For Concurrency version '3.9.1'

## Live Demo
[Live Demo Link](https://powerful-escarpment-41375.herokuapp.com/login)
## Usage

> Clone the repository to your local machine

```sh
$ git clone https://github.com//kobiyoyo/FACEBOOK-CLONE/.git
```

> cd into the directory

```sh
$ bundle install --without production
```


> Next,create & migrate the database:
```
$ rails db:create

$ rails db:migrate
```

> Run the app in a local server:

```
$ rails server
```
> Finally, run the test suite to verify that everything is working correctly:

```
$ rspec
```
> You can then drop into rails console to explore the models

```sh
$ cd rails c
```
## Contributors

* [Adama Chubiyojo Desmond](https://github.com/kobiyoyo)

* [Danilo Zagarcanin ](https://github.com/danilozag1992)

## Contributing

1. Fork it (https://github.com/kobiyoyo/FACEBOOK-CLONE/fork)
2. Create your feature branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -am 'what this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen-name])
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
 







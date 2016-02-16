# TrainingViz

Visualizing the data from biking with data things.

Downloading of data thanks to [tapiriik](https://tapiriik.com).

My goal is to make it clear what wattage I can generate at what heartrate - and how and what training effects that over time.

=======

### Dependencies

| What            | Install             |
| --------------- | -------------------------- |
| Elixir 1.2.1    | Someday I want to have a elixir version manager, instead of `brew install elixir`  |
| Node Version Manager (nvm) | [install info](https://github.com/creationix/nvm) |
| Node 5.6.0 | install with nvm - `nvm install && npm install` |
| PostgreSQL 9.4  | `brew install postgresql` |

Node version is set in the [.nvmrc](/.nvmrc)

=======

### Testing/local development

Create and migrate the database:

    mix ecto.create
    mix ecto.migrate

*note: this requires a postgres user `postgres`*

<!--
$ psql postgres
postgres=# CREATE USER postgres LOGIN CREATEDB;
postgres=# \du
-->

Continuously run testing:

    mix test.watch
    

=======

*This is my first [Phoenix app](http://www.phoenixframework.org/) and first elixir code. Don't be surprised if things are a heinous mess or just plain wrong, I don't know what I'm doing*
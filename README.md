# Stackly

Need help? Stackly! When you need help in you homework or a error in your code, come to Stackly!

## Technologies Used

- Elixir
- Phoenix
- PostgreSQL

## Environment Variables

To run this project, you will need to add the following environment variables to your `.env` file

`SECRET_KEY_BASE` - You can generate this key by typing `mix phx.server` in your terminal

`GUARDIAN_SECRET` - You can generate this key by typing `mix guardian.gen.secret` in your terminal

## Run Locally

Clone the project

```bash
  git clone https://github.com/stackly-com/stackly-backend.git
```

Go to the project directory

```bash
  cd stackly-backend
```

Install dependencies

```bash
  mix deps.get
```

Create and migrate the database

```bash
  mix ecto.setup
```

Start Stackly project

```bash
mix phx.server
```

Now you can make requests in `localhost:4000`

## API Reference

See all the API reference [here](/readme/API.md)

## Running Tests

To run tests, run the following command

```bash
  mix test
```

To check the test coverage on the run application

```bash
MIX_ENV=test mix coveralls
```

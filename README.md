# MangaSama - README.md

This is an end-of-course project for the Fullstack Dev - Ruby course at [etp4a.com](https://etp4a.com). MangaSama is a web application based on Rails, offering a dynamic platform for users passionate about anime (manga).

## Requirements

* Ruby 3.1.1
* Rails 7.0.5.1
* PostgreSQL 14.8

## Getting Started

### Installation

1. Clone the project repository :  ```git clone https://github.com/hmoustaphaousmane/MangSama.git```

2. Navigate to the root directory of the project : ```cd MangSama```

3. Install dependencies (gems) : ```bundle install```

### Configuration

1. Edit the file `/config/database.yml` and modify the following lines:
    - Line 27: Change the username with your PostgreSQL username
      ```
      username: postgresql_username
      ```

    - Line 28: Change the password with your PostgreSQL password
      ```
      password: postgresql_password
      ```

### Database Setup

1. Create the database:
   ```
   rails db:create
   ```

2. Check the migrations status (up/down):
   ```
   rails db:migrate:status
   ```

3. Run the database migrations:
   ```
   rails db:migrate
   ```

4. Check again the migrations status (up/down):
   ```
   rails db:migrate:status
   ```

5. Populate (seed) the database:
   ```
   rails db:seed
   ```
   
### Running the Application

1. Start the development server:
   ```
   rails server
   ```

2. In your browser, enter one of the following address to access the project:
   - [http://127.0.0.1:3000](http://127.0.0.1:3000)
   - [http://[::1]:3000](http://[::1]:3000)

**NOTE**: Make sure to replace `postgresql_username` and `postgresql_password` with your actual PostgreSQL credentials.

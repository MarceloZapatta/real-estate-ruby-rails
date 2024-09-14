# Real Estate Ruby on Rails

## Table of Contents
1. [Introduction](#introduction)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Database Setup](#database-setup)
5. [Running the Application](#running-the-application)
6. [Running Tests](#running-tests)
7. [Useful Commands](#useful-commands)

## Introduction

This project is a RESTful **API** built using **Ruby on Rails**, focused solely on providing back-end functionality with no front-end interface. The API allows full **CRUD operations** for both **Users** and **Offices**, enabling creation, updating, retrieval, and deletion of records. 

### Key Features:
- **CRUD for Users and Offices**: The API provides endpoints to manage users and offices. Each entity can be created, updated, retrieved, and deleted through RESTful API requests.
  
- **JWT Authentication**: Secure access to the API is managed through **JWT (JSON Web Token)** authentication. This ensures that only authenticated users can access protected resources. To log in, use the default credentials:
  - **Email**: `admin@company.com`
  - **Password**: `12345678`
  
- **Many-to-Many Relationship**: 
  - Users and Offices are connected via a **many-to-many relationship**. This means:
    - A user can belong to multiple offices.
    - An office can have multiple users associated with it.
  - The relationship is managed via a join table, allowing flexible assignment of users to offices and vice versa.

### Authentication:
- JWT tokens are issued upon login and must be included in the `Authorization` header for accessing protected routes.
- Example login credentials are provided for an admin user, but the API allows the creation of additional users through the user management endpoints.

This API is designed to be easily integrated into other services or front-end applications, offering a solid foundation for managing user and office data securely and efficiently.

## Requirements

Before setting up the project, ensure you have the following tools installed on your machine:

- **Ruby**: `>= 3.3.4`
- **Rails**: `>= 7.2.1`
- **Bundler**: `>= 2.5.18`
- **sqlite3** (or any other DB you're using)

## Installation

Follow these steps to set up and run the project locally:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/MarceloZapatta/real-estate-ruby-rails.git
   cd real-estate-ruby-rails
   ```

2. **Install dependencies**:

   Make sure you have [Bundler](https://bundler.io/) installed, then run:

   ```bash
   bundle install
   ```
## Database Setup

1. **Create the database**:

   Run the following command to create the database:

   ```bash
   rails db:create
   ```

2. **Run migrations**:

   To set up the database schema, run:

   ```bash
   rails db:migrate
   ```

3. **Seed the database** (Optional):

   To populate the database with seed data, run:

   ```bash
   rails db:seed
   ```

## Running the Application

Once the dependencies and database are set up, you can run the Rails server with the following command:

```bash
rails server
```

The application will be available at [http://localhost:3000](http://localhost:3000).

**Default user:**
  - **Email**: `admin@company.com`
  - **Password**: `12345678`

## Running Tests

To run the test suite, use the following command:

```bash
rails test
```

## Useful Commands

- **Start the server**: `rails server`
- **Run migrations**: `rails db:migrate`
- **Create the database**: `rails db:create`
- **Drop the database**: `rails db:drop`
- **Reset the database**: `rails db:reset`
- **Run seeds**: `rails db:seed`
- **Run tests**: `rails test` or `rspec`
- **Console**: `rails console`
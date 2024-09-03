# Ruby ORM with PostgreSQL Setup Guide

## Overview

This repository provides a step-by-step guide for setting up a Ruby project using PostgreSQL in a JupyterLab environment. The guide demonstrates how to create a simple ORM, set up the database schema, and perform basic CRUD operations.

## Features

- **Ruby ORM Implementation:** A simple Ruby ORM that interacts with PostgreSQL.
- **Database Schema Management:** Create and manage database schemas and tables using Ruby.
- **Basic CRUD Operations:** Insert and retrieve data from the PostgreSQL database.

## Getting Started

To use this project, you'll need to set up JupyterLab with a Ruby kernel and PostgreSQL. Follow these steps to get started:

### Prerequisites

1. **Install JupyterLab:** Ensure you have JupyterLab installed. You can follow the [official installation guide](https://jupyter.org/install) if needed.

2. **Install Ruby Kernel for JupyterLab:** Install the Ruby kernel for JupyterLab. Follow the installation instructions in the [IRuby GitHub repository](https://github.com/SCIInstitute/IRuby).

3. **Install PostgreSQL:** Ensure PostgreSQL is installed and running on your system. You can download it from the [official PostgreSQL website](https://www.postgresql.org/download/).

4. **Set Up Environment Variables:** Create a `.env` file in your project directory with the following content:

    ```sh
    DB_USERNAME=your_username
    DB_PASSWORD=your_password
    DB_NAME=your_database_name
    DB_HOST=localhost or your_ip
    DB_PORT=your_port
    ```

### Setting Up the Project

1. **Clone the Repository:**

    ```sh
    git clone https://github.com/yourusername/ruby-orm-postgresql.git
    cd ruby-orm-postgresql
    ```

### Contributing
Feel free to fork this repository and submit pull requests for improvements or new features. For significant changes, please open an issue to discuss it first.

### License
This project is licensed under the MIT License - see the LICENSE file for details.

### Contact
For any questions or feedback, please contact 68614004+jonathandlume@users.noreply.github.com.

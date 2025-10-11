# Aspectran Assets

## Introduction

Aspectran Assets is a utility project for building and deploying CSS, JS, Fonts, and Images commonly used in Aspectran's demo applications. It uses a SASS compiler to build minified CSS from SASS sources for various front-end frameworks and provides a runnable server to test the generated assets.

## Features

-   Manages front-end assets for multiple frameworks (Bootstrap, Foundation).
-   Compiles `.scss` source files into minified `.css` using Dart SASS.
-   Provides a runnable, self-contained Aspectran application using an embedded Undertow server to preview assets.
-   Outputs a clean, versioned directory structure for easy use in other projects.

## Prerequisites

-   Java 21 or higher
-   Maven 3.9.4 or higher

## How to Build Assets

You can build the assets for each CSS framework by activating the corresponding Maven profile. The compiled assets will be located in the `app/webroot/assets/` directory.

### Build Bootstrap Assets

To compile only the Bootstrap assets, run the following command:

```shell
mvn clean package -P css-bootstrap
```

### Build Foundation Assets

To compile only the Foundation assets, run the following command:

```shell
mvn clean package -P css-foundation
```

### Build All Assets

To compile all available assets, activate all profiles:

```shell
mvn clean package -P css-bootstrap,css-foundation
```

## How to Run the Test Server

This project includes a runnable server to preview the compiled assets and test pages.

1.  **Navigate to the `app` directory:**
    ```shell
    cd app
    ```

2.  **Start the interactive shell:**
    -   On Linux/macOS:
        ```shell
        ./bin/shell.sh
        ```
    -   On Windows:
        ```shell
        .\bin\shell.bat
        ```

3.  **Access the test pages:**
    Once the server starts, you can access the test pages in your browser (the default port is usually 8080, but check the application configuration).

4.  **Stop the server:**
    To shut down the application, type `quit` at the prompt in the interactive shell and press Enter.
    ```
    > quit
    ```

## Directory Structure

-   `src/main/scss/`: Contains the SASS source files, organized by framework (e.g., `bootstrap`, `foundation`). This is where you should modify styles.
-   `app/webroot/assets/`: Contains the final, compiled CSS assets, organized by framework and version. This directory is the document root of the test server.
-   `app/`: A runnable Aspectran application distribution, containing all necessary scripts, configurations, and libraries.

## License

Aspectran Assets is licensed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).

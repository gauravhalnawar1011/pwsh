# PowerShell `for` Loop

## Why Do We Need the `for` Loop?

The `for` loop is useful when repetition is controlled by a counter or when the number of iterations is known or can be clearly defined.

Instead of writing the same operation repeatedly, we define the operation once and let the loop control how many times it runs.

## Real-World Scenarios

### 1. Fixed Retry Attempts

A deployment operation may be allowed to retry a fixed number of times.

For example:

- Try a deployment up to 3 times
- Check an API up to 5 times
- Retry a connection up to 10 times

### 2. Processing Items by Index

Sometimes automation needs to work with an item based on its position in a collection.

Examples:

- Process the first 10 records
- Compare items at specific positions
- Work with array indexes

### 3. Generating Numbered Values

A script may need to generate sequential values.

Examples:

- Create test users with numbered names
- Generate test files
- Create numbered resources
- Generate test data

### 4. Running Scheduled or Repeated Tasks

A script may need to perform the same operation a known number of times.

Examples:

- Run a health check 5 times
- Collect metrics for 10 iterations
- Perform a controlled test

## DevOps Scenario

Imagine testing an application deployment.

You want to check the application 5 times before declaring the deployment unsuccessful.

The `for` loop is appropriate because the maximum number of attempts is known.

## Key Idea

Think:

> **"I know how the repetition is controlled by a counter."**

Use `for` when the iteration count or counter is an important part of the problem.

# PowerShell `while` Loop

## Why Do We Need the `while` Loop?

The `while` loop is useful when the script should continue running as long as a condition remains true.

The exact number of iterations may not be known beforehand.

The script keeps checking the condition and continues until the condition becomes false.

## Real-World Scenarios

### 1. Waiting for a Service

A Windows service may take time to start.

The script can repeatedly check the service state and continue waiting while it is not ready.

### 2. Waiting for an Application

After a deployment, an application may need time to become healthy.

The script can repeatedly check the application status until it reaches the required state.

### 3. Deployment Readiness

A DevOps pipeline may need to wait for:

- Kubernetes deployment readiness
- Pod readiness
- Load balancer availability
- Azure resource provisioning
- AWS resource availability

The number of checks is not always known.

### 4. Retry Until Success

An API request or network operation may temporarily fail.

The script can retry while the operation has not succeeded.

### 5. Polling

Automation frequently needs to check a system repeatedly.

Examples:

- Check an API
- Check a deployment
- Check a server
- Check a queue
- Check a cloud resource

## Important Consideration

A `while` loop must have a condition that can eventually become false.

Otherwise, the script can run indefinitely.

Production automation should normally include a safety mechanism such as:

- Maximum retry count
- Timeout
- Maximum execution duration
- Failure condition

## DevOps Scenario

Imagine a Kubernetes deployment.

The pipeline starts the deployment and then needs to wait until the application becomes ready.

The number of checks required is unknown.

This is a typical `while` loop problem.

## Key Idea

Think:

> **"Keep doing this while the condition is true."**

Use `while` when the condition controls the repetition rather than a fixed iteration count.

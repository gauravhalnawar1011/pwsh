# PowerShell `foreach` Loop

## Why Do We Need the `foreach` Loop?

The `foreach` loop is designed for processing a collection of items.

In automation, PowerShell commands frequently return multiple objects. Instead of handling each object manually, `foreach` allows the same operation to be applied to every item.

## Real-World Scenarios

### 1. Multiple Servers

A DevOps engineer may need to:

- Check multiple servers
- Check connectivity
- Check disk space
- Check services
- Collect system information

Each server can be processed using the same logic.

### 2. Multiple Files

A script may need to process every file in a directory.

Examples:

- Find large files
- Find empty files
- Search logs
- Archive old files
- Rename files
- Collect file information

### 3. Cloud Resources

Cloud automation commonly works with collections.

Examples:

- Multiple Azure VMs
- Multiple AWS EC2 instances
- Multiple S3 objects
- Multiple resource groups
- Multiple cloud resources returned by a command

### 4. Kubernetes Resources

Kubernetes commands can return multiple objects.

A script may need to process:

- Pods
- Deployments
- Services
- Nodes
- Namespaces

The same validation or reporting logic can be applied to each object.

### 5. Generating Reports

A collection of objects can be processed to create:

- CSV reports
- Health reports
- Inventory reports
- Compliance reports
- Monitoring reports

## DevOps Scenario

Imagine a company has 50 Windows servers.

The requirement is:

> Check whether the required service is running on every server and report the servers where it is stopped.

This is a natural `foreach` problem because the input is a collection of servers and the same operation needs to be performed on every server.

## Key Idea

Think:

> **"For every item in this collection, perform the same operation."**

Use `foreach` when the main problem is processing a collection of objects one item at a time.

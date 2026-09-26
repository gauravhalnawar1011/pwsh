# PowerShell Loops

Loops are used when a script needs to repeat an operation instead of writing the same commands multiple times.

In real-world automation, we commonly need to:

- Process many servers
- Process many files or directories
- Check multiple services
- Validate multiple resources
- Retry an operation until a condition changes
- Perform a task a fixed number of times
- Process every item returned by another PowerShell command
- Automate repetitive administration and DevOps tasks

## Why Do We Need Loops?

Without loops, repetitive automation becomes long, difficult to maintain, and error-prone.

For example, a DevOps engineer may need to check 100 servers. Writing separate commands for every server is inefficient. A loop allows the same logic to be applied consistently to every server.

The important idea is:

> **Write the logic once and repeat it automatically.**

## Choosing the Right Loop

PowerShell provides different loop types because different automation problems have different repetition requirements.

### `for`

Use when the repetition is controlled by a counter or a known number of iterations.

Typical scenarios:

- Run a task 10 times
- Generate numbered values
- Process items using an index
- Perform a fixed number of retry attempts

### `foreach`

Use when you have a collection of items and need to perform an operation on every item.

Typical scenarios:

- Check multiple servers
- Process multiple files
- Iterate through users
- Process Azure resources
- Work with AWS resources
- Process Kubernetes objects
- Generate reports from a collection

### `while`

Use when repetition depends on a condition and the number of iterations is not necessarily known beforehand.

Typical scenarios:

- Wait for a service to become available
- Retry an operation
- Wait for a deployment to become ready
- Keep checking a resource until its state changes
- Poll an API or system status

### `do while`

Use when the operation must execute at least once and then continue while a condition remains true.

Typical scenarios:

- Interactive menus
- Asking a user for input
- Retry operations where the first attempt must happen
- Continue processing based on the result of the previous operation

## DevOps Perspective

Loops are especially important in DevOps because automation frequently operates on collections of resources.

Examples include:

- Multiple AWS EC2 instances
- Multiple Azure VMs
- Multiple Kubernetes pods
- Multiple Docker containers
- Multiple Terraform resources
- Multiple log files
- Multiple Windows servers
- Multiple deployment targets

A good automation script should avoid repeating the same code manually for every resource.

## Learning Goal

The goal is not to memorize loop syntax.

The goal is to recognize the problem:

> **What needs to be repeated, and what controls when the repetition should stop?**

Once that is clear, choosing the appropriate PowerShell loop becomes much easier.

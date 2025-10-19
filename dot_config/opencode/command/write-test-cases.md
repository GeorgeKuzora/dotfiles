---
description: Generate comprehensive test cases for a given Python function or class
agent: python-testing-expert
model: koronatech/Coder
subtask: false
---

Analyze the provided Python $ARGUMENTS and produce a detailed list of test cases that comprehensively cover:
- Normal (happy-path) scenarios
- Boundary conditions
- Invalid or unexpected inputs (type errors, value errors, etc.)
- Edge cases (empty inputs, extreme values, None, etc.)
- Error handling and exception raising
- Asynchronous behavior (if applicable)
- Validation logic (especially for Pydantic models or custom validators)

For each test case, include:
- **ID**: A short, unique identifier (e.g., `tc01`, `tc02`)
- **Description**: Clear explanation of what is being tested (in Russian)
- **Input parameters**: Exact values or structures passed to the function/class
- **Expected behavior**: What the code should do (return value, raised exception, side effect, etc.)
- **Category**: One of: `normal`, `boundary`, `error`, `edge`, `async`, or `validation`

Do **not** write actual test code yet—only output the markdown numbered list of test cases with proper markdown formating.  
Assume the implementation uses modern Python (3.11+), type hints, and may involve async/await or Pydantic v2 models.
Consider all imports, types, classes on which tested object is dependent.

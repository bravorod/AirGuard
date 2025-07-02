# Contributing to AirGuard

First off, thanks for your interest in improving AirGuard! We welcome all contributions, from bug reports to new features, documentation fixes, and beyond.


<ol type="I">
  <li><a href="#reporting-a-bug">Reporting a Bug</a></li>
  <li><a href="#suggesting-enhancements">Suggesting Enhancements</a></li>
  <li><a href="#your-first-code-contribution">Your First Code Contribution</a></li>
  <li><a href="#development-workflow">Development Workflow</a></li>
  <li><a href="#coding-standards">Coding Standards</a></li>
  <li><a href="#testing">Testing</a></li>
  <li><a href="#commit-messages">Commit Messages</a></li>
  <li><a href="#pull-request-process">Pull Request Process</a></li>
  <li><a href="#code-of-conduct">Code of Conduct</a></li>
</ol>

---

## Reporting a Bug

1. Search existing issues to see if it’s already been reported.  
2. If not, open a new issue with a clear title and description; include steps to reproduce and any relevant logs or screenshots.  
3. Label it as `bug`.

---

## Suggesting Enhancements

1. Check the issue tracker for similar requests.  
2. Open an issue with the label `enhancement` describing your proposal, motivation, and expected impact.  
3. Discuss with maintainers before writing large amounts of code.

---

## Your First Code Contribution

We recommend starting with a small “good first issue”:

1. Look for issues labeled `good first issue`.  
2. Comment “I’d like to work on this” to claim it.  
3. Follow the Development Workflow below.

---

## Development Workflow

1. **Fork** the repo and **clone** your fork locally.  
2. Create a new branch:  
   ```bash
   git checkout -b feature/my-feature
  ```

3. Make your changes, then **commit**:
   ```bash
   git add .
   git commit -m "Brief description of changes"
   ```

4. **Push** to your fork:

   ```bash
   git push origin feature/feature
   ```
5. Open a **Pull Request** against `main`.

---

## Coding Standards

* **Python**: Follow PEP8 (use `black` or `flake8`).
* **JavaScript/TypeScript**: Use Prettier and ESLint.
* **Indentation**: 2 spaces.
* **Line length**: 80–100 characters.

---

## Testing

* **Backend**:

  ```bash
  cd backend
  pytest
  ```
* **Web**:

  ```bash
  cd website
  yarn test
  ```

All tests must pass before your PR will be merged.

---

## Commit Messages

* Include a short summary:

  ```
  Add sensor calibration endpoint

  - Implement `/sensors/{id}/calibrate` API
  - Add unit tests for calibration logic
  ```

---

## Pull Request Process

1. Ensure your branch is up-to-date with `master`.
2. All tests are passing.
3. Your PR description explains **what** and **why**, not just **how**.
4. Request a review from at least one maintainer.
5. Address review comments promptly.
6. After approval, the maintainer will merge.

---

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md). Please read it to understand the standards of behavior expected. Thank you for helping make AirGuard better! 




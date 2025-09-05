# Source Control Strategy

## Git Workflow
**Strategy**: GitHub Flow with feature branches  
**Main Branch**: Protected with required reviews  
**Feature Branches**: Short-lived, focused changes  
**Release Strategy**: Tagged releases with semantic versioning  

## Branch Protection Rules
- **Required Reviews**: 2 reviewers minimum  
- **Status Checks**: All CI checks must pass  
- **Up-to-date**: Require branches to be up to date  
- **Admin Enforcement**: Rules apply to administrators  

## Commit Standards
- **Conventional Commits**: Standardized commit messages  
- **Signed Commits**: GPG signature requirement  
- **Linear History**: Squash merge strategy  
- **Automated Checks**: Pre-commit hooks for linting  

## Repository Structure

```text
ecommerce-app/
├── .github/workflows/          # GitHub Actions
├── src/                        # Application source
├── tests/                      # Test suites
├── docker/                     # Container definitions
├── k8s/                        # Kubernetes manifests
├── terraform/                  # Infrastructure code
└── docs/                       # Documentation
                    # Documentation
---
**Source Control By**: AJ Almohammad, 2025-09-03
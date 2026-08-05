# Services

Each independently operated application stack gets its own directory here.
Compose commands should be run against that stack's `compose.yaml`; the
repository root is not itself a Compose project.

Service directories may contain checked-in, non-secret configuration and
`.env.example` files. Runtime state and real secrets must remain outside Git.

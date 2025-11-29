# Accelerating the API Design Lifecycle with Mocking

## Abstract

In today’s fast-paced development environment, delivering robust and efficient APIs requires a streamlined design process that minimizes delays and maximizes collaboration. Mocking has emerged as a transformative tool in the API design lifecycle, enabling teams to prototype, test, and iterate at unprecedented speeds.

This talk explores the role of mocking in enhancing API design workflows, focusing on its ability to:

1. Facilitate early stakeholder feedback by simulating API behavior before development.
2. Enable parallel development by decoupling frontend and backend teams.
3. Identify design flaws and inconsistencies earlier, reducing costly downstream changes.
4. Support rapid iteration and experimentation without impacting live systems.

Using real-world examples and best practices, we’ll demonstrate how tools like Postman, OpenAPI spec, and WireMock can be leveraged to create mock APIs that enhance collaboration, improve quality, and dramatically accelerate development timelines. Attendees will leave with actionable insights on integrating mocking into their API design lifecycle, fostering innovation and speed without compromising reliability.

## Artifacts

### Prism

Contents [here](./src/prism/)

- **Container scripts:**
  - `container/Dockerfile`, `container/podman_build.sh`, `container/podman_run.sh`
- **Mocking scripts:**
  - `mocking/mock_local.sh`, `mocking/mock_remote.sh`
- **Proxy & contract testing:**
  - `proxy/01_prism_start_proxy.sh`, `proxy/02_contract_test.sh`, `proxy/03_show_diff.sh`
- **Sample OpenAPI specs:**
  - `proxy/contacts-api-local.json`, `proxy/contacts-api-remote.json`

### Wiremock

Contents [here](./src/wiremock/)

- **Startup & test scripts:**
  - `00_get_wiremock.sh`, `01_start_wiremock.sh`, `02_run_tests.sh`, `reload_wiremock.sh`, `start_recording.sh`
- **Container scripts:**
  - `container/Dockerfile`, `container/podman_build.sh`, `container/podman_run.sh`
- **Mappings:**
  - `mappings/` (e.g., `accounts.json`, `health.json`, `faults.json`, etc.)
- **Response files:**
  - `__files/` (e.g., `account-get-response.json`, `404-response.json`, etc.)
- **Extensions:**
  - `extensions/` (custom transformers, if any)

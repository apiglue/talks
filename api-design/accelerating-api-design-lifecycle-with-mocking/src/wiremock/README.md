# WireMock Contacts API - Mocking Demo

A demonstration project showcasing API mocking capabilities using WireMock standalone server. This project simulates a contacts/accounts REST API with various endpoints for educational and testing purposes.

## 🎯 Purpose

This project was created for talks and demonstrations about API mocking techniques. It provides a realistic example of how to mock external APIs for development, testing, and demonstration purposes.

## 📋 Features

- **Complete REST API simulation** for a contacts/accounts service
- **Dynamic response templating** using Handlebars
- **JSON Schema validation** for request payloads
- **Containerized deployment** with Docker/Podman
- **Local development** support
- **Health check endpoint** for monitoring
- **Custom 404 handling** with detailed error responses

## 🔗 API Endpoints

### Accounts API

| Method | Endpoint               | Description                  |
| ------ | ---------------------- | ---------------------------- |
| `GET`  | `/api/accounts/`       | Get all accounts             |
| `GET`  | `/api/accounts/{uuid}` | Get specific account by UUID |
| `POST` | `/api/accounts/`       | Create new account           |
| `GET`  | `/api/health`          | Health check endpoint        |

### Example Requests

#### Get All Accounts

```bash
curl https://talks-mocking-wiremock.onrender.com/api/accounts/
```

#### Get Single Account

```bash
curl  https://talks-mocking-wiremock.onrender.com/api/accounts/f396a966-5eea-43d4-bd6a-1b44a2a16d9c
```

#### Create Account

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"name": "John", "lastName": "Smith"}' \
  https://talks-mocking-wiremock.onrender.com/api/accounts/
```

#### Health Check

```bash
curl https://talks-mocking-wiremock.onrender.com/api/health
```

## 🚀 Quick Start

### Option 1: Local Development (Java Required)

1. **Prerequisites**: Java 11+ installed
2. **Download WireMock**:
   ```bash
   chmod +x 00_get_wiremock.sh
   ./00_get_wiremock.sh
   ```
3. **Start WireMock server**:
   ```bash
   chmod +x 01_start_wiremock.sh
   ./01_start_wiremock.sh
   ```
4. **Run tests** (optional):
   ```bash
   chmod +x 02_run_tests.sh
   ./02_run_tests.sh
   ```

### Option 2: Container Deployment (Recommended)

#### Using Podman

1. **Build the container**:

   ```bash
   chmod +x podman_build.sh
   ./podman_build.sh
   ```

2. **Run the container**:
   ```bash
   chmod +x podman_run.sh
   ./podman_run.sh
   ```

#### Using Docker

1. **Build the image**:

   ```bash
   docker build -t marcelo10/talks-wiremock-contacts-api:latest .
   ```

2. **Run the container**:
   ```bash
   docker run -p 8081:8081 --name talks-wiremock-contacts-api -d marcelo10/talks-wiremock-contacts-api:latest
   ```

## 🎨 WireMock Features Demonstrated

### 1. Request Matching

- **URL patterns** with regex support (UUID validation)
- **HTTP method** matching
- **Header** validation
- **JSON Schema** validation for request bodies

### 2. Response Templating

- **Dynamic UUIDs** generation
- **Request data extraction** (path parameters, JSON body)
- **Random value selection** from predefined lists
- **Handlebars templating** for complex responses

### 3. Advanced Features

- **Priority-based** request matching
- **Custom transformers** for response processing
- **Location headers** with dynamic values
- **Verbose logging** for debugging

## 📊 Response Examples

### Get All Accounts Response

```json
{
  "data": [
    {
      "id": "f396a966-5eea-43d4-bd6a-1b44a2a16d9c",
      "name": "john",
      "lastName": "doe"
    },
    {
      "id": "9dfc7e64-fefd-4ca9-afa8-b2589450438e",
      "name": "jane",
      "lastName": "doe"
    }
  ]
}
```

### Create Account Response

```json
{
  "data": [
    {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "name": "John",
      "lastName": "Smith"
    }
  ]
}
```

## 🔧 Configuration

### Port Configuration

- **Default port**: 8081
- **Change port**: Modify the `--port` parameter in `01_start_wiremock.sh` or Dockerfile

### Adding New Endpoints

1. Create mapping files in `mappings/` directory
2. Add response templates in `__files/` directory
3. Restart the WireMock server or reload mappings:
   ```bash
   chmod +x reload_wiremock.sh
   ./reload_wiremock.sh
   ```

### Customizing Responses

- Edit JSON files in `__files/` directory
- Use Handlebars templating for dynamic content
- Refer to [WireMock documentation](http://wiremock.org/docs/) for advanced features

## 🎙️ Recording Mode

You can use WireMock's recording mode to capture requests from a real API:

```bash
chmod +x start_recording.sh
./start_recording.sh
```

This will start WireMock in proxy mode, recording all requests to generate mappings automatically.

## 📚 Learning Resources

This project demonstrates key concepts for:

- **API mocking** strategies
- **Test automation** with external dependencies
- **Service virtualization** techniques
- **Contract testing** preparation
- **Development environment** setup

## 🤝 Contributing

This is a demonstration project. Feel free to fork and adapt for your own talks or learning purposes.

## 📄 License

This project is intended for educational and demonstration purposes.

## 🏷️ Tags

`wiremock` `api-mocking` `testing` `microservices` `demo` `talks` `containerization` `rest-api`

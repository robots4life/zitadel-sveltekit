# SvelteKit + Zitadel OIDC Authentication Example

A modern, production-ready example demonstrating how to implement Zitadel authentication in a SvelteKit application using OpenID Connect (OIDC) flow.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![SvelteKit](https://img.shields.io/badge/SvelteKit-FF3E00?logo=svelte&logoColor=white)
![Zitadel](https://img.shields.io/badge/Zitadel-5282FF?logo=zitadel&logoColor=white)

## 🎯 Overview

This project showcases how to integrate Zitadel's authentication service into a SvelteKit application using the OIDC flow with **PKCE (Proof Key for Code Exchange)** for enhanced security. PKCE eliminates the need for client secrets in public clients, provides additional protection against authorization code interception attacks, and follows OAuth 2.1 security best practices.

**Why PKCE?**
- ✅ No client secrets stored in browser/app
- ✅ Protection against code interception attacks  
- ✅ Perfect for Single Page Applications (SPAs)
- ✅ Enhanced security for mobile and public clients
- ✅ OAuth 2.1 compliant

## 📋 Prerequisites

- Node.js 18+ 
- pnpm
- [Just](https://github.com/casey/just) command runner
- Docker (or Podman, Orbstack) and Docker Compose
- A Zitadel instance (local via docker-compose or cloud)

## 🛠 Tech Stack

- **Frontend**: SvelteKit, TypeScript, Auth.js
- **Authentication**: Zitadel
- **Task Runner**: Just
- **Local Services**: Docker Compose

### Why This Project?

- **Educational Resource**: Learn how to properly implement OIDC authentication in SvelteKit
- **Production-Ready**: Follow security best practices and modern development patterns
- **Fully Typed**: Complete TypeScript support for better developer experience
- **Well-Documented**: Extensive comments and documentation throughout the codebase

## 🎯 Features

- ✅ OIDC Authentication Flow
- ✅ Protected Routes
- ✅ Session Management
- ✅ Automatic Token Refresh
- ✅ Logout Handling
- ✅ User Profile Display
- ✅ TypeScript Support
- ✅ Responsive UI

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/robots4life/zitadel-sveltekit.git
cd zitadel-sveltekit
```

### 2. Install dependencies:
```bash
just install
```

### 3. Start local Zitadel instance:
```bash
just start-zitadel
```

### 4. Copy environment variables:
```bash
cp .env.example .env.local
```

### 5. Configure your environment variables (see [Configuration](#configuration))

### 6. Run the development server:
```bash
just dev
```

## ⚙️ Configuration

### Quick Start with Local Zitadel

1. **Start Zitadel locally**:
```bash
just zitadel-up
```

2. **Access Zitadel Console**: http://localhost:8080
   - Default credentials: `zitadel-admin@zitadel.localhost` / `Password1!`

### Manual Environment Variables

Create a `.env.local` file with the following variables:

```env
# Zitadel Configuration (Local)
ZITADEL_ISSUER=http://localhost:8080
ZITADEL_CLIENT_ID=your-client-id

# Zitadel Configuration (Cloud - Alternative)
# ZITADEL_ISSUER=https://your-instance.zitadel.cloud
# ZITADEL_CLIENT_ID=your-client-id

# Application URLs
PUBLIC_BASE_URL=http://localhost:5173
REDIRECT_URI=http://localhost:5173/auth/callback

# Session Secret (for server-side session storage)
AUTH_SECRET=your-super-secret-jwt-secret
```

### Zitadel Setup (Manual)

1. **Create a Project** in your Zitadel console
2. **Add an Application** with the following settings:
   - Application Type: `Single Page Application (SPA)` or `Native`
   - Authentication Method: `PKCE`
   - Redirect URIs: `http://localhost:5173/auth/callback`
   - Post Logout URIs: `http://localhost:5173`
   - Grant Types: `Authorization Code`
   - Response Types: `Code`
   - **Important**: No client secret is generated or needed

## 🚀 Available Commands

This project uses [Just](https://github.com/casey/just) for task automation. Run `just --list` to see all available commands.

### Development

```bash
# Install dependencies
just install

# Start development server
just dev

# Run development server with host binding
just dev-host

# Build the application
just build

# Preview production build
just preview
```

### Docker & Services

```bash
# Start Zitadel locally
just zitadel-up

# Stop Zitadel
just zitadel-down

# View Zitadel logs
just zitadel-logs

# Restart Zitadel services
just zitadel-restart

# Reset Zitadel data (⚠️  destroys all data)
just zitadel-reset
```

### Utilities

```bash
# Run type checking
just check

# Format code
just format

# Run linting
just lint

# Clean build artifacts
just clean
```

```
To Be Done (TBD) Repository Layout
```

## 🔐 Authentication Flow (PKCE)

1. **Login Initiation**: User clicks login, app generates PKCE code challenge
2. **Authorization**: User redirected to Zitadel with code challenge
3. **User Authentication**: User authenticates with Zitadel
4. **Callback**: Zitadel redirects back with authorization code
5. **Token Exchange**: App exchanges code + code verifier for tokens
6. **Session Creation**: User session established (no client secret needed)
7. **Protected Access**: User can access protected routes

**PKCE Benefits:**
- No client secret required (perfect for SPAs and public clients)
- Protection against authorization code interception
- Enhanced security for mobile and browser-based applications

## 🧪 Usage Examples

Work In Progress (WIP)

## 🔒 Security Considerations

### PKCE Security Benefits
- **No Client Secrets**: Eliminates secret storage in public clients
- **Code Interception Protection**: Dynamic code verifiers prevent replay attacks
- **OAuth 2.1 Compliance**: Follows latest security recommendations
- **Perfect Forward Secrecy**: Each authentication flow uses unique codes

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

### Development Guidelines

- Follow TypeScript best practices
- Add tests for new features
- Update documentation as needed
- Ensure responsive design
- Test authentication flows thoroughly

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support & Troubleshooting

### Common Issues

**Zitadel not accessible**
```bash
# Check if services are running
just zitadel-logs

# Restart services
just zitadel-restart
```

**Authentication redirect issues**
- Ensure redirect URIs match exactly in Zitadel console
- Check that `PUBLIC_BASE_URL` is correct in `.env.local`

**CORS errors**
- Verify Zitadel allowed origins include `http://localhost:5173`
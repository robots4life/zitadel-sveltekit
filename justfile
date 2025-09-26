# List available commands
default:
    @just --list

# Install dependencies
install:
    pnpm install

# Start development server
dev:
    pnpm run dev

# Start development server with host binding
dev-host:
    pnpm run dev -- --host

# Build the application
build:
    pnpm run build

# Preview production build  
preview:
    pnpm run preview

# Start Zitadel locally
zitadel-up:
    docker compose -f docker/docker-compose.yml up -d
    @echo "Zitadel starting up..."
    @echo "Console will be available at: http://localhost:8080"
    @echo "Default login: zitadel-admin@zitadel.localhost / Password1!"

# Stop Zitadel
zitadel-down:
    docker compose -f docker/docker-compose.yml down

# View Zitadel logs
zitadel-logs:
    docker compose -f docker/docker-compose.yml logs -f

# Restart Zitadel services
zitadel-restart:
    docker compose -f docker/docker-compose.yml restart

# Reset Zitadel data (⚠️ destroys all data)
zitadel-reset:
    docker compose -f docker/docker-compose.yml down -v
    docker compose -f docker/docker-compose.yml up -d

# Run type checking
check:
    pnpm run check

# Format code
format:
    pnpm run format

# Run linting
lint:
    pnpm run lint

# Clean build artifacts
clean:
    rm -rf build
    rm -rf .svelte-kit

# Full cleanup (including node_modules)
clean-all:
    just clean
    rm -rf node_modules
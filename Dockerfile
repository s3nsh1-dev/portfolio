# Multi-stage Dockerfile for Next.js (pnpm)

FROM node:20-alpine AS builder
WORKDIR /app

# Enable corepack and activate pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy dependency manifests first for better caching
COPY package.json pnpm-lock.yaml ./

# Install all dependencies (including devDeps needed for build)
RUN pnpm install --frozen-lockfile

# Copy the rest of the sources and build
COPY . .
RUN pnpm build

FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

# Copy built assets and production files from builder
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/node_modules ./node_modules

# Create a non-root user and switch to it
RUN addgroup -S next && adduser -S next -G next
USER next

EXPOSE 3000

# Start the Next.js server
CMD ["node", "node_modules/next/dist/bin/next", "start", "-p", "3000"]

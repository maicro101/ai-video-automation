FROM node:18-alpine

# Install FFmpeg and other dependencies
RUN apk add --no-cache ffmpeg

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY . .

# Expose port
EXPOSE 5678

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV WEBHOOK_URL=https://your-app.railway.app/

# Start n8n
CMD ["npm", "start"]

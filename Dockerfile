# Use official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all app files
COPY . .

# Expose port
EXPOSE 8080

# Run the app
CMD ["npm", "start"]


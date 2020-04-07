FROM node:12.16.1

# Create app working directory
WORKDIR /usr/src/app

# Change directory ownership to non-root user
RUN chown -R node:node /usr/src/app

# Copy package.json AND package-lock.json to working directory
COPY package*.json ./

# Switch user to non-root "node"
USER node

# Install dependencies
RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Copy application files to working directory with non-root user
COPY --chown=node:node . .

# Expose port as per your app
EXPOSE 3000

# Run the application
CMD [ "node", "server.js" ]

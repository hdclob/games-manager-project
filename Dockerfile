# Use an official Node.js image as the base image
FROM node:latest

# Set the working directory to the Next.js project
WORKDIR /app/games-manager-project

# Create a new Next.js project
RUN npx create-next-app@latest . --use-npm --example "https://github.com/vercel/next-learn/tree/master/basics/learn-starter"

# Expose the React development server port
EXPOSE 3000

# Install the MongoDB driver
RUN npm install mongodb

RUN npm install

# Start the React development server
CMD ["npm", "run", "dev"]

## Run this to build the image
# docker build -t games-manager-project .

## Run this to enter the container and retrieve the project's files for the first time
# docker run -it games-manager-project_app bash
# docker cp <container_id>:/app/games-manager-project ..

## To delete?
# docker run -it -p 3000:3000 -v /app/games-manager-project:$(pwd) games-manager-project
# docker run -it -p 3000:3000 -v $(pwd):/app/games-manager-project games-manager-project
# docker run -it -v "$(pwd):/app/games-manager-project" -p 3000:3000 games-manager-project


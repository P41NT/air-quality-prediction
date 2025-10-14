#!/bin/bash

# Start backend on 0.0.0.0:8000
cd backend
uvicorn app:app --host 0.0.0.0 --port 8000 &
BACKEND_PID=$!

# Wait for backend to start
sleep 3

# Start frontend on port 5000
cd ../frontend
npm start

# If frontend exits, kill backend
kill $BACKEND_PID
